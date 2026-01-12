import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/alarm_setting_entity.dart';

part 'alarm_setting_state.freezed.dart';

// [이재은] 알림 설정 페이지 상태
enum AlarmSettingPageState { initial, loading, loaded, saving, error }

@freezed
abstract class AlarmSettingState with _$AlarmSettingState {
  const AlarmSettingState._();

  const factory AlarmSettingState({
    @Default(0) int userId,
    @Default(AlarmSettingPageState.initial) AlarmSettingPageState pageState,
    AlarmSettingEntity? setting,
    String? message,
  }) = _AlarmSettingState;

  // 전체 알림 상태
  bool get entireAlarm => setting?.entireAlarm ?? true;

  // 개별 알림 상태
  bool get tripRequest => setting?.tripRequest ?? true;
  bool get friendRequest => setting?.friendRequest ?? true;
  bool get newFriend => setting?.newFriend ?? true;
  bool get scheduleAdded => setting?.scheduleAdded ?? true;
  bool get scheduleEdited => setting?.scheduleEdited ?? true;
  bool get scheduleDeleted => setting?.scheduleDeleted ?? true;
  bool get talkMessage => setting?.talkMessage ?? true;
  bool get dDay => setting?.dDay ?? true;
}
