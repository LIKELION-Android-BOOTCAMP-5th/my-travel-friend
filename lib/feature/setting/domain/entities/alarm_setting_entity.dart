import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_setting_entity.freezed.dart';

// [이재은] : Alarm Setting Entity

@freezed
abstract class AlarmSettingEntity with _$AlarmSettingEntity {
  const factory AlarmSettingEntity({
    required int id,
    required bool entireAlarm,
    required bool tripRequest,
    required bool friendRequest,
    required bool newFriend,
    required bool scheduleEdited,
    required bool scheduleAdded,
    required bool scheduleDeleted,
    required bool talkMessage,
    required bool dDay,
    required int userId,
  }) = _AlarmSettingEntity;
}
