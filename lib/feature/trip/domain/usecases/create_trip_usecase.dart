import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@lazySingleton
class CreateTripUsecase {
  final TripRepository _tripRepository;

  CreateTripUsecase(this._tripRepository);

  Future<Result<TripEntity>> call(TripEntity Entity) {
    return _tripRepository.createTrip(Entity);
  }
}
