import '../../../../core/result/result.dart';
import '../dtos/trip_crew_dto.dart';

//[엄수빈] 크루원 데이터 소스 추상
abstract class TripCrewDataSource {
  //이미 리스트
  Future<Result<List<TripCrewDTO>>> getTripCrew(int tripId);

  // trip 넣기
  Future<Result<void>> addTrip(int tripId, int myId);
}
