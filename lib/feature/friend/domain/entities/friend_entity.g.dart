// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendEntity _$FriendEntityFromJson(Map<String, dynamic> json) =>
    _FriendEntity(
      id: json['id'] as String,
      user1Id: json['user1Id'] as String?,
      user2Id: json['user2Id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FriendEntityToJson(_FriendEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
