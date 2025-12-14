import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/friend_repository.dart';

//[엄수빈] 친구 명단 프로필로 가져오기 usecase
@LazySingleton()
class GetFriendUsersUsecase {
  final FriendRepository _repository;

  GetFriendUsersUsecase(this._repository);

  Future<Result<List<UserEntity>>> call(int myId) {
    return _repository.getFriendUsers(myId);
  }
}
