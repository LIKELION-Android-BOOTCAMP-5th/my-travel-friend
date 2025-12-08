import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/friend_request_entity.dart';
import '../../domain/repositories/friend_request_repository.dart';
import '../datasources/friend_request_data_source.dart';

// [엄수빈] 친구 요청 레포 구현
@LazySingleton(as: FriendRequestDataSource)
class FriendRequestRepositoryImpl implements FriendRequestRepository {
  final FriendRequestDataSource _dataSource;

  FriendRequestRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<FriendRequestEntity>>> getFriendRequest(int userId) async {
    final result = await _dataSource.getFriendRequest(userId);

    return result.when(
      success: (dtoList) {
        final entities = dtoList.map((dto) => dto.toEntity()).toList();
        return Result.success(entities);
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<FriendRequestEntity>> createFriendRequest(
    int requestId,
    int targetId,
  ) async {
    final result = await _dataSource.createFriendRequest(requestId, targetId);

    return result.when(
      success: (dto) {
        final entity = dto.toEntity();
        return Result.success(entity);
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<void>> acceptRequest(int id) async {
    final result = await _dataSource.acceptRequest(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<void>> deleteRequest(int id) async {
    final result = await _dataSource.deleteRequest(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }
}
