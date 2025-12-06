import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@LazySingleton()
class GiveUpTripUsecase {
  final TripRepository _tripRepository;
  GiveUpTripUsecase(this._tripRepository);

  Future<Result<void>> call(int userId, int id) {
    return _tripRepository.giveUpTrip(userId, id);
  }
}
