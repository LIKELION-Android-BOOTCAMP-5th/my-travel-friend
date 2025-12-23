import 'package:my_travel_friend/feature/trip/domain/entities/trip_request_entity.dart';

import '../../../../core/result/result.dart';

//[엄수빈] 여행 초대 레포
abstract class TripRequestRepository {
  // 목록 조회
  Future<Result<List<TripRequestEntity>>> getTripRequest(int myId);

  // 여행 초대하기
  Future<Result<TripRequestEntity>> createTripRequest(
    int requestId,
    int targetId,
    int tripId,
  );

  // 초대 받은 여행 수락하기
  Future<Result<void>> acceptTripRequest(int id);

  // 초대 거절하기
  Future<Result<void>> deleteTripRequst(int id);

  // 이미 보낸 요청
  Future<Result<List<TripRequestEntity>>> getPendingInvites(int tripId);
}
