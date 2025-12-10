// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoListDTO _$TodoListDTOFromJson(Map<String, dynamic> json) => _TodoListDTO(
  id: (json['id'] as num?)?.toInt(),
  tripId: (json['trip_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  content: json['content'] as String,
  isChecked: json['is_checked'] as bool,
);

Map<String, dynamic> _$TodoListDTOToJson(_TodoListDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'user_id': instance.userId,
      'content': instance.content,
      'is_checked': instance.isChecked,
    };
