import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@LazySingleton()
class GiveUpTripUseCase {
  final TripRepository _tripRepository;
  GiveUpTripUseCase(this._tripRepository);

  Future<Result<void>> call(int tripId, int userId) {
    return _tripRepository.giveUpTrip(tripId, userId);
  }
}
