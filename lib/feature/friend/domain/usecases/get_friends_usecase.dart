import '../entities/friend_entity.dart';
import '../repositories/friend_repository.dart';

// [엄수빈] 친구 명단 가져오기 usecase
// @LazySingleton()
class GetFriendsUsecase {
  final FriendRepository _friendRepository;

  GetFriendsUsecase(this._friendRepository);

  // 다이어리 목록 가져오기
  Future<List<FriendEntity>> call(int userId) {
    return _friendRepository.getFriends(userId);
  }
}
