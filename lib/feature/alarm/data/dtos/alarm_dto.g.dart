// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlarmDTO _$AlarmDTOFromJson(Map<String, dynamic> json) => _AlarmDTO(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  userId: (json['user_id'] as num).toInt(),
  type: json['type'] as String,
  content: json['content'] as String,
  isChecked: json['is_checked'] as bool,
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$AlarmDTOToJson(_AlarmDTO instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'user_id': instance.userId,
  'type': instance.type,
  'content': instance.content,
  'is_checked': instance.isChecked,
  'data': instance.data,
};
