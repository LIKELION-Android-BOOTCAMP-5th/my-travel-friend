import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/friend_request_entity.dart';
import '../../domain/repositories/friend_request_repository.dart';
import '../datasources/friend_request_data_source.dart';

// [엄수빈] 친구 요청 레포 구현
@LazySingleton(as: FriendRequestRepository)
class FriendRequestRepositoryImpl implements FriendRequestRepository {
  final FriendRequestDataSource _dataSource;

  FriendRequestRepositoryImpl(this._dataSource);

  // 받은 친구 요청
  @override
  Future<Result<List<FriendRequestEntity>>> getFriendRequest(int userId) async {
    final result = await _dataSource.getFriendRequest(userId);

    return result.when(
      success: (dtoList) {
        debugPrint('📦 repo dto count = ${dtoList.length}');
        debugPrint('📦 first dto = ${dtoList.first.toJson()}');
        final entities = dtoList.map((dto) => dto.toEntity()).toList();
        return Result.success(entities);
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  //보낸 친구요청
  @override
  Future<Result<List<FriendRequestEntity>>> getSentRequest(int userId) async {
    final result = await _dataSource.getSentRequest(userId);

    return result.when(
      success: (dtoList) {
        final entities = dtoList.map((dto) => dto.toEntity()).toList();
        return Result.success(entities);
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  // 친구 요청 생성 (친구 요청 보내기))
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

  // 친구 요청 수락 기능
  @override
  Future<Result<void>> acceptRequest(int id) async {
    final result = await _dataSource.acceptRequest(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 친구 요청 삭제 기능
  @override
  Future<Result<void>> deleteRequest(int id) async {
    final result = await _dataSource.deleteRequest(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 받은 요청 프로필로 가져오기
  @override
  Future<Result<List<UserEntity>>> getRequestProfile(int userId) async {
    final result = await _dataSource.getRequestProfile(userId);

    return result.when(
      success: (dto) {
        return Result.success(dto.map((e) => e.toEntity()).toList());
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  // 전체 검색
  @override
  Future<Result<List<UserEntity>>> searchRequestName(
    int myId,
    String keyword,
  ) async {
    final result = await _dataSource.searchRequestName(myId, keyword);

    return result.when(
      success: (dto) => Result.success(dto.map((e) => e.toEntity()).toList()),
      failure: (error) => Result.failure(error),
    );
  }
}
