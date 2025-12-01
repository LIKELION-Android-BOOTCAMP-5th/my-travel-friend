// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaryEntity _$DiaryEntityFromJson(Map<String, dynamic> json) => _DiaryEntity(
  id: (json['id'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  tripId: (json['tripId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  isPublic: json['isPublic'] as bool,
  type: json['type'] as String,
  title: json['title'] as String?,
  scheduleId: (json['scheduleId'] as num?)?.toInt(),
  img: json['img'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  content: json['content'] as String?,
  cost: json['cost'] as String?,
);

Map<String, dynamic> _$DiaryEntityToJson(_DiaryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'tripId': instance.tripId,
      'userId': instance.userId,
      'isPublic': instance.isPublic,
      'type': instance.type,
      'title': instance.title,
      'scheduleId': instance.scheduleId,
      'img': instance.img,
      'rating': instance.rating,
      'content': instance.content,
      'cost': instance.cost,
    };
