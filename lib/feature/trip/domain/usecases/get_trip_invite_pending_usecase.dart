import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/trip_request_entity.dart';
import '../repositories/trip_request_repository.dart';

// [엄수빈] 이미 초대한 친구 리스트 (누가 보냈든)
@LazySingleton()
class GetTripInvitePendingUsecase {
  final TripRequestRepository _repo;

  GetTripInvitePendingUsecase(this._repo);

  Future<Result<List<TripRequestEntity>>> call(int tripId) {
    return _repo.getPendingInvites(tripId);
  }
}
