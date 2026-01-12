import '../../../../core/result/result.dart';
import '../entities/trip_crew_entity.dart';

//[엄수빈] 여행 크루 레포
abstract class TripCrewRepository {
  //크루 검색
  Future<Result<List<TripCrewEntity>>> getTripCrew(int tripId);

  //크루에 추가
  Future<Result<void>> addTrip(int tripId, int memberId);
}
