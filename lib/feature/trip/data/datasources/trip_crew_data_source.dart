import '../../../../core/result/result.dart';
import '../dtos/trip_crew_dto.dart';

abstract class TripCrewDataSource {
  //이미 리스트
  Future<Result<List<TripCrewDTO>>> getTripCrew(int tripId);

  // trip 넣기
  Future<Result<void>> addTrip(int myId, int tripId);
}
