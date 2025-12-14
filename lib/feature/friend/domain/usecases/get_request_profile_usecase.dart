import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/friend_request_repository.dart';

// [엄수빈] 친구 명단 가져오기 usecase
@LazySingleton()
class GetRequestProfileUsecase {
  final FriendRequestRepository _friendRepository;

  GetRequestProfileUsecase(this._friendRepository);

  Future<Result<List<UserEntity>>> call(int userId) {
    return _friendRepository.getRequestProfile(userId);
  }
}
