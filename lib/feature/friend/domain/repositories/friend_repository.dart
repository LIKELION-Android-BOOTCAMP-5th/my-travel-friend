import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../entities/friend_entity.dart';

// [엄수빈] 친구 관련 domain 레포
abstract class FriendRepository {
  // userId의 친구 명단 다 가져오기
  Future<Result<List<FriendEntity>>> getFriends(int userId);

  // 친구 프로필 가져오기
  Future<Result<List<UserEntity>>> getFriendUsers(int myId);

  // 새로운 친구 관계 생성
  Future<Result<FriendEntity>> createFriendRelation(int userId1, int userId2);

  // 친구 삭제
  Future<Result<void>> deleteFriend(int userId1, int userId2);

  // 친구 검색
  Future<Result<List<UserEntity>>> searchNickname(int myId, String keyword);

  // 둘이 친구인지 검색
  Future<Result<FriendEntity?>> getFriendRelation(int userId1, int userId2);
}
