import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_event.freezed.dart';

/// [엄수빈] 친구 요청 이벤트
@freezed
class FriendRequestEvent with _$FriendRequestEvent {
  /// 닉네임으로 유저 검색
  const factory FriendRequestEvent.searchByNickname({
    required String nickname, // 검색어
    required int requestId, // 나(myUserId)
  }) = SearchByNickname;

  /// 검색 초기화
  const factory FriendRequestEvent.clearSearch() = ClearSearch;

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
}
