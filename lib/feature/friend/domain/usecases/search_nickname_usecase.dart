import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/friend_repository.dart';

// [엄수빈] 친구 검색 usecase
@LazySingleton()
class SearchNicknameUsecase {
  final FriendRepository _repository;

  SearchNicknameUsecase(this._repository);

  Future<Result<List<UserEntity>>> call(int myId, String keyword) {
    return _repository.searchNickname(myId, keyword);
  }
}
