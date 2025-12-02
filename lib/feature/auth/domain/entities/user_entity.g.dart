// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: (json['id'] as num).toInt(),
  uuid: json['uuid'] as String?,
  nickname: json['nickname'] as String?,
  email: json['email'] as String?,
  token: json['token'] as String?,
  profileImg: json['profileImg'] as String?,
  deletedAt: json['deletedAt'] as String?,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'email': instance.email,
      'token': instance.token,
      'profileImg': instance.profileImg,
      'deletedAt': instance.deletedAt,
    };
