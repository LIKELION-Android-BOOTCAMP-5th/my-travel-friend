import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/trip_request_entity.dart';
import '../repositories/trip_request_repository.dart';

// [엄수빈] 받은 여행 초대 목록 가져오기
@lazySingleton
class GetTripRequestUsecase {
  final TripRequestRepository _repository;

  GetTripRequestUsecase(this._repository);

  Future<Result<List<TripRequestEntity>>> call(int myId) {
    return _repository.getTripRequest(myId);
  }
}
