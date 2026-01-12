import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_crew_entity.freezed.dart';

// [엄수빈] 여행 크루 엔티티
@freezed
abstract class TripCrewEntity with _$TripCrewEntity {
  const factory TripCrewEntity({int? tripId, int? memberId}) = _TripCrewEntity;
}
