import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/trip_request_repository.dart';

@LazySingleton()
class AddTripUsecase {
  final TripRequestRepository _repo;

  AddTripUsecase(this._repo);

  Future<Result<void>> call(int myId, int tripId) {
    return _repo.addTrip(myId, tripId);
  }
}
