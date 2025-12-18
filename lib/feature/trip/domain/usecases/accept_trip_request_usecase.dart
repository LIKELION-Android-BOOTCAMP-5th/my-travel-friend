import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/trip_request_repository.dart';

@LazySingleton()
class AcceptTripRequestUsecase {
  final TripRequestRepository _repo;

  AcceptTripRequestUsecase(this._repo);

  Future<Result<void>> call(int id) {
    return _repo.acceptTripRequest(id);
  }
}
