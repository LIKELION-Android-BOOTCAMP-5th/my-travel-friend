import '../../../../core/result/result.dart';
import '../dtos/trip_request_dto.dart';

abstract class TripRequestDataSource {
  // 목록 가져오기
  Future<Result<List<TripRequestDto>>> getTripRequest(int myId);

  // 여행 초대하기
  Future<Result<TripRequestDto>> createTripRequest(
    int requestId,
    int targetId,
    int tripId,
  );

  // 초대 받은 여행 수락하기
  Future<Result<void>> acceptTripRequest(int id);

  // 초대 거절하기
  Future<Result<void>> deleteTripRequst(int id);

  // 이미 보낸 요청
  Future<Result<List<TripRequestDto>>> getPendingInvites(int tripId);
}
