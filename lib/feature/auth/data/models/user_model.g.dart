// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  id: (json['id'] as num).toInt(),
  uuid: json['uuid'] as String?,
  nickname: json['nickname'] as String?,
  email: json['email'] as String?,
  token: json['token'] as String?,
  profileImg: json['profile_img'] as String?,
  deletedAt: json['delete_at'] as String?,
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'uuid': instance.uuid,
  'nickname': instance.nickname,
  'email': instance.email,
  'token': instance.token,
  'profile_img': instance.profileImg,
  'delete_at': instance.deletedAt,
};
