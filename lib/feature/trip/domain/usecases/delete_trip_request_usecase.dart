import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/trip_request_repository.dart';

@LazySingleton()
class DeleteTripRequestUsecase {
  final TripRequestRepository _repo;

  DeleteTripRequestUsecase(this._repo);

  Future<Result<void>> call(int id) {
    return _repo.deleteTripRequst(id);
  }
}
