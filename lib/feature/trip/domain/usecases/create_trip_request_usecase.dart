import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/trip_request_entity.dart';
import '../repositories/trip_request_repository.dart';

@LazySingleton()
class CreateTripRequestUsecase {
  final TripRequestRepository _repo;

  CreateTripRequestUsecase(this._repo);

  Future<Result<TripRequestEntity>> call(
    int requestId,
    int targetId,
    int tripId,
  ) {
    return _repo.createTripRequest(requestId, targetId, tripId);
  }
}
