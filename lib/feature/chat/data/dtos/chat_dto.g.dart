// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDTO _$ChatDTOFromJson(Map<String, dynamic> json) => _ChatDTO(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  tripId: (json['trip_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  message: json['content'] as String,
);

Map<String, dynamic> _$ChatDTOToJson(_ChatDTO instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'trip_id': instance.tripId,
  'user_id': instance.userId,
  'content': instance.message,
};
