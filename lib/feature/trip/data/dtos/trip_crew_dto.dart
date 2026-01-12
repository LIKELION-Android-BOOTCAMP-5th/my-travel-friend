import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/trip_crew_entity.dart';

part 'trip_crew_dto.freezed.dart';
part 'trip_crew_dto.g.dart';

//[엄수빈] 여행 크루 DTO
@freezed
abstract class TripCrewDTO with _$TripCrewDTO {
  const TripCrewDTO._();

  const factory TripCrewDTO({
    @JsonKey(name: 'trip_id') int? tripId,
    @JsonKey(name: 'member_id') int? memberId,
  }) = _TripCrewDTO;

  factory TripCrewDTO.fromJson(Map<String, dynamic> json) =>
      _$TripCrewDTOFromJson(json);

  TripCrewEntity toEntity() {
    return TripCrewEntity(tripId: tripId, memberId: memberId);
  }
}
