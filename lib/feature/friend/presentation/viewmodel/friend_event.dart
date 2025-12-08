import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_event.freezed.dart';

//[엄수빈] 친구 이벤트
@freezed
class FriendEvent with _$FriendEvent {
  // 친구 목록 가져오기
  // - 화면 처음 들어올 때
  // - 새로고침할 때
  const factory FriendEvent.getFriends({required int userId}) = GetFriends;

  /// 메뉴에서 "친구랑 여행가기" 눌렀을 때
  const factory FriendEvent.goTravel({
    required int myUserId,
    required int friendUserId,
  }) = GoTravel;

  /// 메뉴에서 "친구 삭제" 눌렀을 때
  const factory FriendEvent.deleteFriend({
    required int myUserId,
    required int friendUserId,
  }) = DeleteFriend;
}
