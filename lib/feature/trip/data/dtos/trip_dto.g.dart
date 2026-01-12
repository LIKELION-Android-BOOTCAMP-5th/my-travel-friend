// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripDto _$TripDtoFromJson(Map<String, dynamic> json) => _TripDto(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  title: json['title'] as String,
  place: json['place'] as String,
  startAt: json['start_at'] as String,
  endAt: json['end_at'] as String,
  coverType: json['cover_type'] as String,
  coverImg: json['cover_img'] as String?,
  userId: (json['user_id'] as num).toInt(),
  deletedAt: json['deleted_at'] as String?,
  country: json['country'] as String,
  crewCount: (json['crew_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$TripDtoToJson(_TripDto instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'title': instance.title,
  'place': instance.place,
  'start_at': instance.startAt,
  'end_at': instance.endAt,
  'cover_type': instance.coverType,
  'cover_img': instance.coverImg,
  'user_id': instance.userId,
  'deleted_at': instance.deletedAt,
  'country': instance.country,
  'crew_count': instance.crewCount,
};
