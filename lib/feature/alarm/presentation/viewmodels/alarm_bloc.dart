import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/alarm/domain/usecases/check_an_alarm_usecase.dart';
import 'package:my_travel_friend/feature/alarm/domain/usecases/unsubscribe_alarms_usecase.dart';

import '../../../../core/result/result.dart';
import '../../domain/usecases/check_alarms_usecase.dart';
import '../../domain/usecases/get_alarm_by_id_usecase.dart';
import '../../domain/usecases/get_alarms_usecase.dart';
import '../../domain/usecases/watch_alarms_usecase.dart';
import 'alarm_event.dart';
import 'alarm_state.dart';

// [이재은] 알림 BloC
@injectable
class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final GetAlarmsUseCase _getAlarmsUseCase;
  final GetAlarmByIdUseCase _getAlarmByIdUseCase;
  final CheckAnAlarmUseCase _checkAnAlarmUseCase;
  final CheckAlarmsUseCase _checkAlarmsUseCase;
  final WatchAlarmsUseCase _watchAlarmsUseCase;
  final UnsubscribeAlarmsUseCase _unsubscribeAlarmsUseCase;

  static const int _limit = 20;

  // Realtime 구독 관리
  StreamSubscription? _alarmSubscription;

  AlarmBloc(
    this._getAlarmsUseCase,
    this._getAlarmByIdUseCase,
    this._checkAnAlarmUseCase,
    this._checkAlarmsUseCase,
    this._watchAlarmsUseCase,
    this._unsubscribeAlarmsUseCase,
  ) : super(const AlarmState()) {
    on<GetAlarms>(_onGetAlarms);
    on<LoadMoreAlarms>(_onLoadMore);
    on<CheckAnAlarm>(_onCheckAnAlarm);
    on<CheckAlarms>(_onCheckAlarms);
    on<GetAlarmById>(_onGetAlarmById);
    on<ClearSelectedAlarm>(_onClearSelectedAlarm);
    on<RefreshAlarm>(_onRefresh);
    on<RequestNavigate>(_onRequestNavigate);
    on<NavigationHandled>(_onNavigationHandled);
    on<StartWatching>(_onStartWatching);
    on<AlarmsReceived>(_onAlarmsReceived);
    on<WatchError>(_onWatchError);
    on<StopWatching>(_onStopWatching);
  }

  // Realtime 구독 시작
  Future<void> _onStartWatching(
    StartWatching event,
    Emitter<AlarmState> emit,
  ) async {
    // 기존 구독 해제
    await _alarmSubscription?.cancel();

    emit(state.copyWith(userId: event.userId));

    add(AlarmEvent.getAlarms(userId: event.userId));

    // 스트림 구독
    _alarmSubscription = _watchAlarmsUseCase(event.userId).listen((res) {
      res.when(
        success: (alarms) => add(AlarmEvent.alarmsReceived(alarms: alarms)),
        failure: (failure) =>
            add(AlarmEvent.watchError(message: failure.message)),
      );
    });
  }

  // Realtime 알림 수신(성공)
  void _onAlarmsReceived(AlarmsReceived event, Emitter<AlarmState> emit) {
    emit(
      state.copyWith(pageState: AlarmPageState.loaded, alarms: event.alarms),
    );
  }

  // Realtime 에러 수신
  void _onWatchError(WatchError event, Emitter<AlarmState> emit) {
    emit(
      state.copyWith(pageState: AlarmPageState.error, message: event.message),
    );
  }

  // Realtime 구독 해제
  Future<void> _onStopWatching(
    StopWatching event,
    Emitter<AlarmState> emit,
  ) async {
    await _alarmSubscription?.cancel();
    _alarmSubscription = null;
    await _unsubscribeAlarmsUseCase();
  }

  // Bloc 종료 시 정리
  @override
  Future<void> close() {
    _alarmSubscription?.cancel();
    _unsubscribeAlarmsUseCase();
    return super.close();
  }

  // 자동 새로고침
  void _refreshList() {
    if (state.userId == 0) return;
    add(AlarmEvent.getAlarms(userId: state.userId));
  }

  // 알림 리스트 가져오기
  Future<void> _onGetAlarms(GetAlarms event, Emitter<AlarmState> emit) async {
    emit(
      state.copyWith(userId: event.userId, pageState: AlarmPageState.loading),
    );

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
      userId: state.userId,
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

    final res = await _checkAlarmsUseCase.call(state.userId);

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

  // 새로고침
  Future<void> _onRefresh(RefreshAlarm event, Emitter<AlarmState> emit) async {
    _refreshList();
  }

  // 네비게이션 핸들러
  // 알림 클릭 시 네비게이션 상태 결정
  void _onRequestNavigate(RequestNavigate event, Emitter<AlarmState> emit) {
    final alarm = event.alarm;
    final navigation = _getNavigationRoute(alarm.type, alarm.data);
    emit(state.copyWith(navigation: navigation));
  }

  // 알림 타입 -> 네비게이션 경로 + 데이터 가져오기
  AlarmNavigation _getNavigationRoute(String type, Map<String, dynamic>? data) {
    // data에서 필요한 Id 가져오기
    final tripId = data?['trip_id'] as int?;
    final scheduleId = data?['schedule_id'] as int?;

    return switch (type) {
      // 설정 쪽 - 친구, 여행 초대
      // 여행 초대 알림 -> 설정 - 여행 초대
      'TRIP_REQUEST' => const AlarmNavigationTo('/setting/recevice_trip'),
      // 친구 요청 알림 -> 설정 - 친구 요청
      'FRIEND_REQUEST' => const AlarmNavigationTo('/setting/friend_recevice'),
      // 친구 수락 알림 -> 설정 - 친구 목록
      'NEW_FRIEND' => const AlarmNavigationTo('/setting/friend'),

      // 여행 상세 쪽 - 스케줄, 톡톡
      // 스케줄 생성, 수정 -> 여행 - 일정 - 해당 스케줄 포커스
      'SCHEDULE_ADDED' when tripId != null => AlarmNavigationTo(
        _buildPath(tripId, scheduleId),
      ),
      'SCHEDULE_EDITED' when tripId != null => AlarmNavigationTo(
        _buildPath(tripId, scheduleId),
      ),

      // 스케줄 삭제 -> 여행 - 일정 (스케줄 아이디 없음)
      'SCHEDULE_DELETED' when tripId != null => AlarmNavigationTo(
        '/trip/$tripId/schedule',
      ),

      // 톡톡 메세지 알림 -> 여행 - 톡톡탭
      'TALK_MESSAGE' when tripId != null => AlarmNavigationTo(
        '/trip/$tripId/talk',
      ),

      // D-Day 알림 -> 여행 - 홈
      'D_DAY' when tripId != null => AlarmNavigationTo('/trip/$tripId'),

      _ => const AlarmNavigationNone(),
    };
  }

  // 스케줄 경로 생성 헬퍼
  String _buildPath(int tripId, int? scheduleId) {
    final basePath = '/trip/$tripId/schedule';
    if (scheduleId != null) {
      return '$basePath?scheduleId=$scheduleId';
    }
    return basePath;
  }

  // 네비게이션 플래그 리셋
  // - Screen에서 실제 라우팅 수행 후 호출
  // - 중복 네비게이션 방지
  void _onNavigationHandled(NavigationHandled event, Emitter<AlarmState> emit) {
    emit(state.copyWith(navigation: const AlarmNavigationNone()));
  }
}
