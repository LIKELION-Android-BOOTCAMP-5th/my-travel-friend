import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@lazySingleton
class DeleteTripUsecase {
  final TripRepository _tripRepository;
  DeleteTripUsecase(this._tripRepository);

  Future<Result<void>> call(int id) {
    return _tripRepository.deleteTrip(id);
  }
}
