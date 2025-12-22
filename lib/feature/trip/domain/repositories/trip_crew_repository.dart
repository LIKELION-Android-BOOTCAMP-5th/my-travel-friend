import '../../../../core/result/result.dart';
import '../entities/trip_crew_entity.dart';

abstract class TripCrewRepository {
  //크루 검색
  Future<Result<List<TripCrewEntity>>> getTripCrew(int tripId);

  //크루에 추가
  Future<Result<void>> addTrip(int tripId, int memberId);
}
