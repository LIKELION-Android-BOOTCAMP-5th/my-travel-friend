import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/trip_crew_entity.dart';
import '../repositories/trip_crew_repository.dart';

// [엄수빈] 이미 크루원 가져오기
@LazySingleton()
class GetTripCrewUsecase {
  final TripCrewRepository _repo;

  GetTripCrewUsecase(this._repo);

  Future<Result<List<TripCrewEntity>>> call(int tripId) {
    return _repo.getTripCrew(tripId);
  }
}
