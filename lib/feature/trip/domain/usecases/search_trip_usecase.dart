import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@LazySingleton()
class SearchTripUsecase {
  final TripRepository _tripRepository;
  SearchTripUsecase(this._tripRepository);

  Future<Result<List<TripEntity>>> call(int userId, String keyword, int page) {
    return _tripRepository.searchTrips(userId, keyword, page);
  }
}
