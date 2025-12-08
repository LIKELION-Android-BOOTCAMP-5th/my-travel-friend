import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/friend_request_entity.dart';
import '../repositories/friend_request_repository.dart';

// // [엄수빈] 친구 요청 usecase
@LazySingleton()
class CreateFriendRequestUsecase {
  final FriendRequestRepository _friendRequestRepository;

  CreateFriendRequestUsecase(this._friendRequestRepository);

  // 친구요청
  Future<Result<FriendRequestEntity>> call(int requestId, int targetId) {
    return _friendRequestRepository.createFriendRequest(requestId, targetId);
  }
}
