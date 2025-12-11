// lib/feature/friend/domain/usecases/search_my_friends_by_nickname_usecase.dart

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/friend_repository.dart';

@LazySingleton()
class SearchNicknameUsecase {
  final FriendRepository _repository;

  SearchNicknameUsecase(this._repository);

  Future<Result<List<UserEntity>>> call(int myId, String keyword) {
    return _repository.searchNickname(myId, keyword);
  }
}
