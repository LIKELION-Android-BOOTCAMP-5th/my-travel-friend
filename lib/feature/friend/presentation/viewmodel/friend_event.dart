import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_event.freezed.dart';

//[엄수빈] 친구 이벤트
@freezed
class FriendEvent with _$FriendEvent {
  // 친구 목록 다 가져오기
  const factory FriendEvent.getFriends({required int userId}) = GetFriends;

  //친구 목록 프로필로 가져오기
  const factory FriendEvent.getFriendUsers({required int myId}) =
      GetFriendUsers;

  /// 메뉴에서 "친구랑 여행가기" 눌렀을 때
  const factory FriendEvent.goTravel({
    required int myUserId,
    required int friendUserId,
  }) = GoTravel;

  /// 메뉴에서 "친구 삭제" 눌렀을 때
  const factory FriendEvent.deleteFriend({
    required int myUserId,
    required int? friendUserId,
  }) = DeleteFriend;

  /// 검색어 변경될 때마다 호출
  const factory FriendEvent.keywordChanged(String keyword) = KeywordChanged;

  // 검색버튼 클릭
  const factory FriendEvent.searchToggle() = SearchToggle;
}
