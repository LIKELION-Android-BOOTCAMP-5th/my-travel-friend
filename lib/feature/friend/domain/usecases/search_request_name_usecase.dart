import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/friend_request_repository.dart';

// [엄수빈] 전체 검색 usecase
@LazySingleton()
class SearchRequestNameUsecase {
  final FriendRequestRepository _repository;

  SearchRequestNameUsecase(this._repository);

  Future<Result<List<UserEntity>>> call(int myId, String keyword) {
    return _repository.searchRequestName(myId, keyword);
  }
}
