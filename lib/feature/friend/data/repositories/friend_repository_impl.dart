import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/friend_entity.dart';
import '../../domain/repositories/friend_repository.dart';
import '../datasources/friend_data_source.dart';

//[엄수빈] 친구 레포지토리 구현
@LazySingleton(as: FriendRepository)
class FriendRepositoryImpl implements FriendRepository {
  final FriendDataSource _dataSource;
  FriendRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<FriendEntity>>> getFriends(int userId) async {
    final res = await _dataSource.getFriends(userId);
    return res.when(
      success: (dtos) => Result.success(dtos.map((e) => e.toEntity()).toList()),
      failure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<FriendEntity?>> getFriendRelation(
    int userId1,
    int userId2,
  ) async {
    final res = await _dataSource.getFriendRelation(userId1, userId2);
    return res.when(
      success: (dto) => Result.success(dto?.toEntity()),
      failure: (error) => Result.failure(error),
    );
  }

  //친구 추가
  @override
  Future<Result<FriendEntity>> createFriendRelation(
    int userId1,
    int userId2,
  ) async {
    final res = await _dataSource.createFriendRelation(userId1, userId2);
    return res.when(
      success: (dto) => Result.success(dto.toEntity()),
      failure: (error) => Result.failure(error),
    );
  }

  //친구 삭제
  @override
  Future<Result<void>> deleteFriend(int userId1, int userId2) async {
    return await _dataSource.deleteFriend(userId1, userId2);
  }

  // 친구 검색
  @override
  Future<Result<List<UserEntity>>> searchNickname(
    int myId,
    String keyword,
  ) async {
    final result = await _dataSource.searchNickname(myId, keyword);

    return result.when(
      success: (dto) {
        return Result.success(dto.map((dto) => dto.toEntity()).toList());
      },
      failure: (failure) => Result.failure(failure),
    );
  }
}
