import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_event.freezed.dart';

/// [엄수빈] 친구 요청 이벤트
@freezed
class FriendRequestEvent with _$FriendRequestEvent {
  /// 친구 요청하기
  const factory FriendRequestEvent.createFriendRequest({
    required int requestId,
    required int targetId,
  }) = CreateFriendRequest;

  /// 친구 요청 목록 보기
  const factory FriendRequestEvent.getFriendRequest({required int userId}) =
      GetFriendRequest;

  /// 친구 요청 거절
  const factory FriendRequestEvent.deleteRequest({required int id}) =
      DeleteRequest;

  /// 친구 요청 수락
  const factory FriendRequestEvent.acceptRequest({required int id}) =
      AcceptRequest;

  // 전체 검색
  const factory FriendRequestEvent.searchRequestName({
    required int myId,
    required keyword,
  }) = SearchRequestName;

  // 받은 요청 프로필
  const factory FriendRequestEvent.getRequestProfile({required int myId}) =
      GetRequestProfile;

  // 클릭 여부
  const factory FriendRequestEvent.isRequest() = IsRequest;

  // 클릭과 요청 성공
  const factory FriendRequestEvent.requestCreate({
    required int requestId,
    required int targetId,
  }) = RequestCreate;
}
