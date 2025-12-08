import '../repositories/friend_request_repository.dart';

// [엄수빈] 친구 요청 삭제 usecase
// @LazySingleton()
class DeleteRequestUsecase {
  final FriendRequestRepository _friendRequestRepository;

  DeleteRequestUsecase(this._friendRequestRepository);

  // 친구 요청 삭제
  Future<void> call(int id) {
    return _friendRequestRepository.deleteRequest(id);
  }
}
