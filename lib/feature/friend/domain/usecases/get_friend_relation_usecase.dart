import '../entities/friend_entity.dart';
import '../repositories/friend_repository.dart';

// // [엄수빈] 친구 관계가 있는지 확인
@LazySingleton()
class GetFriendRelationUsecase {
  final FriendRepository _friendRepository;

  GetFriendRelationUsecase(this._friendRepository);

  // 아이디 두개로 친구관계인지 확인 (친구가 아닐 수 있으니 ?)
  Future<FriendEntity?> call(int userId1, int userId2) {
    return _friendRepository.getFriendRelation(userId1, userId2);
  }
}
