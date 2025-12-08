import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/alarm/domain/usecases/check_an_alarm_usecase.dart';

import '../../../../core/result/result.dart';
import '../../domain/usecases/check_alarms_usecase.dart';
import '../../domain/usecases/get_alarm_by_id_usecase.dart';
import '../../domain/usecases/get_alarms_usecase.dart';
import 'alarm_event.dart';
import 'alarm_state.dart';

// [이재은] 알림 BloC
@injectable
class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final GetAlarmsUseCase _getAlarmsUseCase;
  final GetAlarmByIdUseCase _getAlarmByIdUseCase;
  final CheckAnAlarmUseCase _checkAnAlarmUseCase;
  final CheckAlarmsUseCase _checkAlarmsUseCase;

  static const int _limit = 20;

  AlarmBloc(
    this._getAlarmsUseCase,
    this._getAlarmByIdUseCase,
    this._checkAnAlarmUseCase,
    this._checkAlarmsUseCase,
  ) : super(const AlarmState()) {
    on<GetAlarms>(_onGetAlarms);
    on<LoadMoreAlarms>(_onLoadMore);
    on<CheckAnAlarm>(_onCheckAnAlarm);
    on<CheckAlarms>(_onCheckAlarms);
    on<GetAlarmById>(_onGetAlarmById);
    on<ClearSelectedAlarm>(_onClearSelectedAlarm);
  }
  // 알림 리스트 가져오기
  Future<void> _onGetAlarms(GetAlarms event, Emitter<AlarmState> emit) async {
    emit(state.copyWith(pageState: AlarmPageState.loading));

    final res = await _getAlarmsUseCase.call(
      userId: event.userId,
      page: 0,
      limit: _limit,
    );

    res.when(
      success: (alarms) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.loaded,
            alarms: alarms,
            currentPage: 0,
            hasMore: alarms.length >= _limit,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 무한 스크롤 - 더 불러오기
  Future<void> _onLoadMore(
    LoadMoreAlarms event,
    Emitter<AlarmState> emit,
  ) async {
    if (!state.hasMore || state.pageState == AlarmPageState.loadingMore) return;

    emit(state.copyWith(pageState: AlarmPageState.loadingMore));

    final nextPage = state.currentPage + 1;
    final res = await _getAlarmsUseCase.call(
      userId: event.userId,
      page: nextPage,
      limit: _limit,
    );

    res.when(
      success: (newAlarms) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.loaded,
            alarms: state.alarms + newAlarms,
            currentPage: nextPage,
            hasMore: newAlarms.length >= _limit,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 알림 하나 읽음 처리
  Future<void> _onCheckAnAlarm(
    CheckAnAlarm event,
    Emitter<AlarmState> emit,
  ) async {
    final res = await _checkAnAlarmUseCase.call(event.alarmId);

    res.when(
      success: (_) {
        final updatedAlarms = state.alarms.map((alarm) {
          if (alarm.id == event.alarmId) {
            return alarm.copyWith(isChecked: true);
          }
          return alarm;
        }).toList();

        emit(
          state.copyWith(
            pageState: AlarmPageState.loaded,
            alarms: updatedAlarms,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 전체 알림 읽음 처리 (DB에서 모든 알림 isChecked= true)
  Future<void> _onCheckAlarms(
    CheckAlarms event,
    Emitter<AlarmState> emit,
  ) async {
    emit(state.copyWith(pageState: AlarmPageState.loading));

    final res = await _checkAlarmsUseCase.call(event.userId);

    res.when(
      success: (_) {
        final updatedAlarms = state.alarms
            .map((alarm) => alarm.copyWith(isChecked: true))
            .toList();

        emit(
          state.copyWith(
            pageState: AlarmPageState.success,
            alarms: updatedAlarms,
            message: '모든 알림을 읽음 처리했습니다',
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 알림 상세 조회 (라우팅)
  Future<void> _onGetAlarmById(
    GetAlarmById event,
    Emitter<AlarmState> emit,
  ) async {
    final res = await _getAlarmByIdUseCase.call(event.alarmId);

    res.when(
      success: (alarm) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.detailLoaded,
            selectedAlarm: alarm,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 선택된 알림 초기화
  void _onClearSelectedAlarm(
    ClearSelectedAlarm event,
    Emitter<AlarmState> emit,
  ) {
    emit(state.copyWith(pageState: AlarmPageState.loaded, selectedAlarm: null));
  }
}
