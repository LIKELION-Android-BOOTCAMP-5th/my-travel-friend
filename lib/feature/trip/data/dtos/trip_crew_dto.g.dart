// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_crew_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripCrewDTO _$TripCrewDTOFromJson(Map<String, dynamic> json) => _TripCrewDTO(
  tripId: (json['trip_id'] as num?)?.toInt(),
  memberId: (json['member_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$TripCrewDTOToJson(_TripCrewDTO instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'member_id': instance.memberId,
    };
