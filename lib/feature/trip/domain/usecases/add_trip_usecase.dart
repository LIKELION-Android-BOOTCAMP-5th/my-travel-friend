import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/trip_crew_repository.dart';

@LazySingleton()
class AddTripUsecase {
  final TripCrewRepository _repo;

  AddTripUsecase(this._repo);

  Future<Result<void>> call(int tripId, int memberId) {
    return _repo.addTrip(tripId, memberId);
  }
}
