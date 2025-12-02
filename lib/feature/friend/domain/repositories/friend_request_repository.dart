import '../entities/friend_request_entity.dart';

// [엄수빈] 친구 요청 레포
abstract class FriendRequestRepository {
  // 내가 받은 친구 요청 목록
  Future<List<FriendRequestEntity>> getFriendRequest(int userId);

  // 친구 요청 보내기
  Future<FriendRequestEntity> createFriendRequest(int requestId, int targetId);

  // 친구 요청 수락
  Future<void> acceptRequest(int id);

  // 친구 요청 삭제 -> 친구 요청 아이디로 찾기
  Future<void> removeRequest(int id);
}
