import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/friend_entity.dart';
import '../repositories/friend_repository.dart';

// [엄수빈] 친구 명단 가져오기 usecase
@LazySingleton()
class GetFriendsUsecase {
  final FriendRepository _friendRepository;

  GetFriendsUsecase(this._friendRepository);

  Future<Result<List<FriendEntity>>> call(int userId) {
    return _friendRepository.getFriends(userId);
  }
}
