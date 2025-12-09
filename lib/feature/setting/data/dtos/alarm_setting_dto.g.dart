// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlarmSettingDTO _$AlarmSettingDTOFromJson(Map<String, dynamic> json) =>
    _AlarmSettingDTO(
      id: (json['id'] as num).toInt(),
      entireAlarm: json['entire_alarm'] as bool,
      tripRequest: json['trip_request'] as bool,
      friendRequest: json['friend_request'] as bool,
      scheduleEdited: json['schedule_edited'] as bool,
      scheduleAdded: json['schedule_added'] as bool,
      scheduleDeleted: json['schedule_deleted'] as bool,
      talkMessage: json['talk_message'] as bool,
      dDay: json['d-day'] as bool,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$AlarmSettingDTOToJson(_AlarmSettingDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entire_alarm': instance.entireAlarm,
      'trip_request': instance.tripRequest,
      'friend_request': instance.friendRequest,
      'schedule_edited': instance.scheduleEdited,
      'schedule_added': instance.scheduleAdded,
      'schedule_deleted': instance.scheduleDeleted,
      'talk_message': instance.talkMessage,
      'd-day': instance.dDay,
      'user_id': instance.userId,
    };
