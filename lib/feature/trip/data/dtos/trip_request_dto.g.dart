// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripRequestDto _$TripRequestDtoFromJson(Map<String, dynamic> json) =>
    _TripRequestDto(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      requestId: (json['request_id'] as num).toInt(),
      targetId: (json['target_id'] as num).toInt(),
      tripId: (json['trip_id'] as num?)?.toInt(),
      answeredAt: json['answered_at'] as String?,
    );

Map<String, dynamic> _$TripRequestDtoToJson(_TripRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'request_id': instance.requestId,
      'target_id': instance.targetId,
      'trip_id': instance.tripId,
      'answered_at': instance.answeredAt,
    };
