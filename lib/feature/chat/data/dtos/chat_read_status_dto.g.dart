// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_read_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatReadStatusDTO _$ChatReadStatusDTOFromJson(Map<String, dynamic> json) =>
    _ChatReadStatusDTO(
      id: (json['id'] as num?)?.toInt(),
      tripId: (json['trip_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      lastReadChatId: (json['last_read_chat_id'] as num?)?.toInt(),
      lastReadAt: json['last_read_at'] as String?,
    );

Map<String, dynamic> _$ChatReadStatusDTOToJson(_ChatReadStatusDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'user_id': instance.userId,
      'last_read_chat_id': instance.lastReadChatId,
      'last_read_at': instance.lastReadAt,
    };
