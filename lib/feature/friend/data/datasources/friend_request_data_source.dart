import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';
import '../dtos/friend_request_dto.dart';

// [엄수빈] 친구 요청 데이터 소스 (추상)
abstract class FriendRequestDataSource {
  // 내가 받은 친구 요청 목록
  Future<Result<List<FriendRequestDTO>>> getFriendRequest(int userId);

  // 내가 보낸 친구 요청 목록
  Future<Result<List<FriendRequestDTO>>> getSentRequest(int userId);

  // 친구 요청 보내기
  Future<Result<FriendRequestDTO>> createFriendRequest(
    int requestId,
    int targetId,
  );

  // 친구 요청 수락
  Future<Result<void>> acceptRequest(int id);

  // 친구 요청 삭제 -> 친구 요청 아이디로 찾기
  Future<Result<void>> deleteRequest(int id);

  // 친구 검색
  Future<Result<List<UserDTO>>> searchRequestName(int myId, String keyword);

  // 내가 받은 친구 요청 목록 (프로필)
  Future<Result<List<UserDTO>>> getRequestProfile(int userId);
}
