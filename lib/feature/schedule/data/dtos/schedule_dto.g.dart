// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleDTO _$ScheduleDTOFromJson(Map<String, dynamic> json) => _ScheduleDTO(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  tripId: (json['trip_id'] as num).toInt(),
  userJson: json['user'] as Map<String, dynamic>?,
  categoryJson: json['category'] as Map<String, dynamic>?,
  tripJson: json['trip'] as Map<String, dynamic>?,
  title: json['title'] as String,
  place: json['place'] as String?,
  address: json['address'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  date: json['date'] as String,
  description: json['description'] as String?,
  categoryId: (json['category_id'] as num).toInt(),
);

Map<String, dynamic> _$ScheduleDTOToJson(_ScheduleDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'trip_id': instance.tripId,
      'user': instance.userJson,
      'category': instance.categoryJson,
      'trip': instance.tripJson,
      'title': instance.title,
      'place': instance.place,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'date': instance.date,
      'description': instance.description,
      'category_id': instance.categoryId,
    };
