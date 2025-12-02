import 'package:injectable/injectable.dart';

import '../entities/friend_request_entity.dart';
import '../repositories/friend_request_repository.dart';

// [엄수빈] 내가 받은 친구 요청 목록 usecase
@LazySingleton()
class GetFriendRequestUsecase {
  final FriendRequestRepository _friendRequestRepository;

  GetFriendRequestUsecase(this._friendRequestRepository);

  // userId로 해당 친구 다 가져오기
  Future<List<FriendRequestEntity>> call(int userId) {
    return _friendRequestRepository.getFriendRequest(userId);
  }
}
