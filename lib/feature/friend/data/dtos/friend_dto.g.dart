// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendDTO _$FriendDTOFromJson(Map<String, dynamic> json) => _FriendDTO(
  id: (json['id'] as num?)?.toInt(),
  userId1: (json['user1_id'] as num?)?.toInt(),
  userId2: (json['user2_id'] as num?)?.toInt(),
  createdAt: json['create_at'] as String?,
);

Map<String, dynamic> _$FriendDTOToJson(_FriendDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user1_id': instance.userId1,
      'user2_id': instance.userId2,
      'create_at': instance.createdAt,
    };
