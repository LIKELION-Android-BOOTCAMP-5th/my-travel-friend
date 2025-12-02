import 'package:injectable/injectable.dart';

import '../entities/friend_entity.dart';
import '../repositories/friend_repository.dart';

// [엄수빈] 친구 관계 생성 usecase
@LazySingleton()
class CreateFriendRelationUsecase {
  final FriendRepository _friendRepository;

  CreateFriendRelationUsecase(this._friendRepository);

  // 친구 관계 생성
  Future<FriendEntity> call(int userId1, int userId2) {
    return _friendRepository.createFriendRelation(userId1, userId2);
  }
}
