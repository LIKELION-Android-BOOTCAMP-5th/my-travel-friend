import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/domain/usecases/alarm/get_my_alarm_setting_usecase.dart';
import 'package:my_travel_friend/feature/setting/domain/usecases/alarm/update_alarm_setting_usecase.dart';

import '../../../../../core/result/result.dart';
import '../../../domain/entities/alarm_setting_entity.dart';
import 'alarm_setting_event.dart';
import 'alarm_setting_state.dart';

// [이재은] 알림설정 bloc
@injectable
class AlarmSettingBloc extends Bloc<AlarmSettingEvent, AlarmSettingState> {
  final GetMyAlarmSettingUseCase _getMyAlarmSettingUseCase;
  final UpdateAlarmSettingUseCase _updateAlarmSettingUseCase;

  Timer? _debounceTimer;

  AlarmSettingBloc(
    this._getMyAlarmSettingUseCase,
    this._updateAlarmSettingUseCase,
  ) : super(const AlarmSettingState()) {
    on<LoadAlarmSetting>(_onLoad);
    on<ToggleEntireAlarm>(_onToggleEntireAlarm);
    on<ToggleIndividualAlarm>(_onToggleIndividualAlarm);
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  // 알림 설정 불러오기
  Future<void> _onLoad(
    LoadAlarmSetting event,
    Emitter<AlarmSettingState> emit,
  ) async {
    emit(
      state.copyWith(
        userId: event.userId,
        pageState: AlarmSettingPageState.loading,
      ),
    );

    final res = await _getMyAlarmSettingUseCase.call(userId: event.userId);

    res.when(
      success: (setting) {
        emit(
          state.copyWith(
            pageState: AlarmSettingPageState.loaded,
            setting: setting,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: AlarmSettingPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 전체 알림 토글
  Future<void> _onToggleEntireAlarm(
    ToggleEntireAlarm event,
    Emitter<AlarmSettingState> emit,
  ) async {
    final current = state.setting;
    if (current == null) return;

    final AlarmSettingEntity updated;

    if (!event.value) {
      // 전체 끄면 하위 전부 끄기
      updated = current.copyWith(
        entireAlarm: false,
        tripRequest: false,
        friendRequest: false,
        newFriend: false,
        scheduleEdited: false,
        scheduleAdded: false,
        scheduleDeleted: false,
        talkMessage: false,
        dDay: false,
      );
    } else {
      // 전체 켜도 전체만 켜도 하위는 유지
      updated = current.copyWith(entireAlarm: true);
    }

    emit(state.copyWith(setting: updated));
    _debounceSave(updated);
  }

  // 개별 알림 토글
  Future<void> _onToggleIndividualAlarm(
    ToggleIndividualAlarm event,
    Emitter<AlarmSettingState> emit,
  ) async {
    final current = state.setting;
    if (current == null) return;

    AlarmSettingEntity updated = _updateIndividualAlarm(
      current,
      event.type,
      event.value,
    );

    updated = _adjustEntireAlarm(updated, event.value);

    emit(state.copyWith(setting: updated));
    _debounceSave(updated);
  }

  // 개별 업데이트
  AlarmSettingEntity _updateIndividualAlarm(
    AlarmSettingEntity current,
    String type,
    bool value,
  ) {
    return switch (type) {
      'tripRequest' => current.copyWith(tripRequest: value),
      'friendRequest' => current.copyWith(friendRequest: value),
      'newFriend' => current.copyWith(newFriend: value),
      'scheduleEdited' => current.copyWith(scheduleEdited: value),
      'scheduleAdded' => current.copyWith(scheduleAdded: value),
      'scheduleDeleted' => current.copyWith(scheduleDeleted: value),
      'talkMessage' => current.copyWith(talkMessage: value),
      'dDay' => current.copyWith(dDay: value),
      _ => current,
    };
  }

  // 전체 알림 상태 자동 조정
  AlarmSettingEntity _adjustEntireAlarm(
    AlarmSettingEntity setting,
    bool individualValue,
  ) {
    // 하나라도 켜지면 전체도 켜기
    if (individualValue) {
      return setting.copyWith(entireAlarm: true);
    }

    // 모든 하위가 꺼지면 전체도 끄기
    final allOff =
        !setting.tripRequest &&
        !setting.friendRequest &&
        !setting.newFriend &&
        !setting.scheduleDeleted &&
        !setting.scheduleEdited &&
        !setting.scheduleAdded &&
        !setting.talkMessage &&
        !setting.dDay;

    if (allOff) {
      return setting.copyWith(entireAlarm: false);
    }

    return setting;
  }

  // debounce 저장 (500ms)
  void _debounceSave(AlarmSettingEntity setting) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _saveToServer(setting);
    });
  }

  // 서버에 저장하기
  Future<void> _saveToServer(AlarmSettingEntity setting) async {
    final res = await _updateAlarmSettingUseCase.call(setting);

    res.when(
      success: (_) {
        // 저장 성공 -> 별도 처리 없음
      },
      failure: (failure) {
        // 저장 실패 -> 별도 처리 없음
      },
    );
  }
}
