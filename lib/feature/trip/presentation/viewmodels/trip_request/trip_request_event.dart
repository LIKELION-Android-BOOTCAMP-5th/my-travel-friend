import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_request_event.freezed.dart';

@freezed
class TripRequestEvent with _$TripRequestEvent {
  // 여행 초대 보내기
  const factory TripRequestEvent.createTripRequest({
    required int requestId,
    required int targetId,
    required int tripId,
  }) = CreateTripRequest;

  // 초대 수락
  const factory TripRequestEvent.acceptTripRequest({
    required int requestId,
    required int tripId,
    required int myUserId,
  }) = AcceptTripRequest;

  // 초대 거절
  const factory TripRequestEvent.deleteTripRequest({required int id}) =
      DeleteTripRequest;

  // 받은 여행 목록 조회
  const factory TripRequestEvent.getTripRequest({required myId}) =
      GetTripRequest;

  // trip 테이블에 추가
  const factory TripRequestEvent.addTrip({
    required int myId,
    required int tripId,
  }) = AddTrip;

  const factory TripRequestEvent.getTripsByIds({required List<int> tripIds}) =
      GetTripsByIds;

  // 초대 제외 리스트 (이미 리스트)
  const factory TripRequestEvent.getInviteExcludes({required int tripId}) =
      GetInviteExcludes;
}
