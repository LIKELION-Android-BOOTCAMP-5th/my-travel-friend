import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_setting_event.freezed.dart';

// [이재은] 알림설정 이벤트
@freezed
class AlarmSettingEvent with _$AlarmSettingEvent {
  // 알림 설정 불러오기
  const factory AlarmSettingEvent.load({required int userId}) =
      LoadAlarmSetting;

  // 전체 알림 토글
  const factory AlarmSettingEvent.toggleEntireAlarm({required bool value}) =
      ToggleEntireAlarm;

  // 개별 알림 토글
  const factory AlarmSettingEvent.toggleIndividualAlarm({
    required String type,
    required bool value,
  }) = ToggleIndividualAlarm;
}
