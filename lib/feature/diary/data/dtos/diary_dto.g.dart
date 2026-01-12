// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaryDTO _$DiaryDTOFromJson(Map<String, dynamic> json) => _DiaryDTO(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  tripId: (json['trip_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  userJson: json['user'] as Map<String, dynamic>?,
  isPublic: json['is_public'] as bool,
  type: json['type'] as String,
  title: json['title'] as String?,
  scheduleId: (json['schedule_id'] as num?)?.toInt(),
  img: json['img'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  content: json['content'] as String?,
  cost: (json['cost'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  payment: json['payment'] as String?,
);

Map<String, dynamic> _$DiaryDTOToJson(_DiaryDTO instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'trip_id': instance.tripId,
  'user_id': instance.userId,
  'user': instance.userJson,
  'is_public': instance.isPublic,
  'type': instance.type,
  'title': instance.title,
  'schedule_id': instance.scheduleId,
  'img': instance.img,
  'rating': instance.rating,
  'content': instance.content,
  'cost': instance.cost,
  'currency': instance.currency,
  'payment': instance.payment,
};
