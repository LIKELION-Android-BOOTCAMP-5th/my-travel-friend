// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistDTO _$ChecklistDTOFromJson(Map<String, dynamic> json) =>
    _ChecklistDTO(
      id: (json['id'] as num).toInt(),
      tripId: (json['trip_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      content: json['content'] as String,
      isChecked: json['is_checked'] as bool,
    );

Map<String, dynamic> _$ChecklistDTOToJson(_ChecklistDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'user_id': instance.userId,
      'content': instance.content,
      'is_checked': instance.isChecked,
    };
