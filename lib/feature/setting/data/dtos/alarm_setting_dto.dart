import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/alarm_setting_entity.dart';

part 'alarm_setting_dto.freezed.dart';
part 'alarm_setting_dto.g.dart';

// [이재은] 알림 설정 DTO

@freezed
abstract class AlarmSettingDTO with _$AlarmSettingDTO {
  const AlarmSettingDTO._();

  const factory AlarmSettingDTO({
    required int id,
    @JsonKey(name: 'entire_alarm') required bool entireAlarm,
    @JsonKey(name: 'trip_request') required bool tripRequest,
    @JsonKey(name: 'new_friend') required bool newFriend,
    @JsonKey(name: 'friend_request') required bool friendRequest,
    @JsonKey(name: 'schedule_edited') required bool scheduleEdited,
    @JsonKey(name: 'schedule_added') required bool scheduleAdded,
    @JsonKey(name: 'schedule_deleted') required bool scheduleDeleted,
    @JsonKey(name: 'talk_message') required bool talkMessage,
    @JsonKey(name: 'd-day') required bool dDay,
    @JsonKey(name: 'user_id') required int userId,
  }) = _AlarmSettingDTO;

  factory AlarmSettingDTO.fromJson(Map<String, dynamic> json) =>
      _$AlarmSettingDTOFromJson(json);

  factory AlarmSettingDTO.fromEntity(AlarmSettingEntity entity) {
    return AlarmSettingDTO(
      id: entity.id,
      entireAlarm: entity.entireAlarm,
      tripRequest: entity.tripRequest,
      friendRequest: entity.friendRequest,
      newFriend: entity.newFriend,
      scheduleAdded: entity.scheduleAdded,
      scheduleEdited: entity.scheduleEdited,
      scheduleDeleted: entity.scheduleDeleted,
      talkMessage: entity.talkMessage,
      dDay: entity.dDay,
      userId: entity.userId,
    );
  }

  AlarmSettingEntity toEntity() {
    return AlarmSettingEntity(
      id: id,
      entireAlarm: entireAlarm,
      tripRequest: tripRequest,
      friendRequest: friendRequest,
      newFriend: newFriend,
      scheduleAdded: scheduleAdded,
      scheduleEdited: scheduleEdited,
      scheduleDeleted: scheduleDeleted,
      talkMessage: talkMessage,
      dDay: dDay,
      userId: userId,
    );
  }
}
