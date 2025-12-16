import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';
import '../dtos/friend_dto.dart';

// [엄수빈] 친구 데이터 소스 (추상)
abstract class FriendDataSource {
  // userId의 친구 명단 다 가져오기
  Future<Result<List<FriendDTO>>> getFriends(int userId);

  // 친구 명단 프로필로 가져오기
  Future<Result<List<UserDTO>>> getFriendUsers(int myId);

  // 새로운 친구 관계 생성
  Future<Result<FriendDTO>> createFriendRelation(int userId1, int userId2);

  // 친구 삭제
  Future<Result<void>> deleteFriend(int userId1, int userId2);

  // 친구 검색
  Future<Result<List<UserDTO>>> searchNickname(int myId, String keyword);

  // 둘이 친구인지 확인
  Future getFriendRelation(int userId1, int userId2);
}
