import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/friend_dto.dart';
import 'friend_data_source.dart';

// [엄수빈] 친구 데이터 소스 (구현)
@LazySingleton(as: FriendDataSource)
class FriendDataSourceImpl implements FriendDataSource {
  final SupabaseClient _supabaseClient;
  FriendDataSourceImpl(this._supabaseClient);

  static const _table = 'friend';

  // userId의 친구 명단 다 가져오기
  @override
  Future<Result<List<FriendDTO>>> getFriends(int userId) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .or('user1_id.eq.$userId,user2_id.eq.$userId');

      final list = (res as List)
          .map((json) => FriendDTO.fromJson(json))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 두 유저 사이에 친구 관계가 있는지 확인
  @override
  Future<Result<FriendDTO?>> getFriendRelation(int userId1, int userId2) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .or(
            'and(user1_id.eq.$userId1,user2_id.eq.$userId2),'
            'and(user1_id.eq.$userId2,user2_id.eq.$userId1)',
          )
          .maybeSingle(); // 없으면 null

      if (res == null) {
        return const Result.success(null);
      }

      final dto = FriendDTO.fromJson(res);
      return Result.success(dto);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 새로운 친구 관계 생성
  @override
  Future<Result<FriendDTO>> createFriendRelation(
    int userId1,
    int userId2,
  ) async {
    try {
      final insertData = {'user1_id': userId1, 'user2_id': userId2};

      final res = await _supabaseClient
          .from(_table)
          .insert(insertData)
          .select()
          .maybeSingle();

      final dto = FriendDTO.fromJson(res as Map<String, dynamic>);
      return Result.success(dto);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 친구 삭제
  @override
  Future<Result<void>> deleteFriend(int userId1, int userId2) async {
    try {
      await _supabaseClient
          .from(_table)
          .delete()
          .or(
            'and(user1_id.eq.$userId1,user2_id.eq.$userId2),'
            'and(user1_id.eq.$userId2,user2_id.eq.$userId1)',
          );

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
