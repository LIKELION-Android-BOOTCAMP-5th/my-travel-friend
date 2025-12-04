import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@lazySingleton
class GetCrewMemberCountUsecase {
  final TripRepository _tripRepository;
  GetCrewMemberCountUsecase(this._tripRepository);

  Future<Result<int>> call(int id) {
    return _tripRepository.countTripCrew(id);
  }
}
