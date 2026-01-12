import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/friend_request_entity.dart';

// [엄수빈] 친구 요청 레포
abstract class FriendRequestRepository {
  // 내가 받은 친구 요청 목록
  Future<Result<List<FriendRequestEntity>>> getFriendRequest(int userId);

  // 내가 보낸 친구 요청 목록
  Future<Result<List<FriendRequestEntity>>> getSentRequest(int userId);

  // 친구 요청 보내기
  Future<Result<FriendRequestEntity>> createFriendRequest(
    int requestId,
    int targetId,
  );

  // 친구 요청 수락
  Future<Result<void>> acceptRequest(int id);

  // 친구 요청 삭제 -> 친구 요청 아이디로 찾기
  Future<Result<void>> deleteRequest(int id);

  // 친구 검색
  Future<Result<List<UserEntity>>> searchRequestName(int myId, String keyword);

  // 내가 받은 친구 요청 목록 (프로필)
  Future<Result<List<UserEntity>>> getRequestProfile(int userId);
}
