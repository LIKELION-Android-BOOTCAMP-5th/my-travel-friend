import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/friend_repository.dart';

// [엄수빈] 친구 관계 삭제 usecase
@LazySingleton()
class DeleteFriendUsecase {
  final FriendRepository _friendRepository;

  DeleteFriendUsecase(this._friendRepository);

  // 다이어리 삭제
  Future<Result<void>> call(int userId1, int userId2) {
    return _friendRepository.deleteFriend(userId1, userId2);
  }
}
