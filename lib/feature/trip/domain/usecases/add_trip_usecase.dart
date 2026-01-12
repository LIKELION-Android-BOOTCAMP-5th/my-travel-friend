import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/trip_crew_repository.dart';

//[엄수빈] 여행 크루에 추가 usecase
@LazySingleton()
class AddTripUsecase {
  final TripCrewRepository _repo;

  AddTripUsecase(this._repo);

  Future<Result<void>> call(int tripId, int memberId) {
    return _repo.addTrip(tripId, memberId);
  }
}
