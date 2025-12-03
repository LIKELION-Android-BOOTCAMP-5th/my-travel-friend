import '../../../../core/result/result.dart';
import '../dtos/friend_dto.dart';

//[엄수빈] 친구 데이터 소스
abstract class FriendDataSource {
  Future<Result<List<FriendDTO>>> getFriends(int userId);
  Future<Result<FriendDTO?>> getFriendRelation(int userId1, int userId2);
  Future<Result<FriendDTO>> createFriendRelation(int userId1, int userId2);
  Future<Result<void>> deleteFriend(int userId1, int userId2);
}
