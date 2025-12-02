import 'package:injectable/injectable.dart';

import '../repositories/friend_request_repository.dart';

// [엄수빈] 친구 요청 수락 usecase
@LazySingleton()
class AcceptRequestUsecase {
  final FriendRequestRepository _friendRequestRepository;

  AcceptRequestUsecase(this._friendRequestRepository);

  // 친구요청 수락
  Future<void> call(int id) {
    return _friendRequestRepository.acceptRequest(id);
  }
}
