// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendRequestDTO _$FriendRequestDTOFromJson(Map<String, dynamic> json) =>
    _FriendRequestDTO(
      id: (json['id'] as num?)?.toInt(),
      requestId: (json['request_id'] as num).toInt(),
      targetId: (json['target_id'] as num).toInt(),
      answeredAt: json['answered_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$FriendRequestDTOToJson(_FriendRequestDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_id': instance.requestId,
      'target_id': instance.targetId,
      'answered_at': instance.answeredAt,
      'created_at': instance.createdAt,
    };
