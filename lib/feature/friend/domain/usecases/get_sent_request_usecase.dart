import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/friend_request_entity.dart';
import '../repositories/friend_request_repository.dart';

//[엄수빈] 보낸 친구 요청
@LazySingleton()
class GetSentRequestUsecase {
  final FriendRequestRepository _repo;
  GetSentRequestUsecase(this._repo);

  Future<Result<List<FriendRequestEntity>>> call(int userId) {
    return _repo.getSentRequest(userId);
  }
}
