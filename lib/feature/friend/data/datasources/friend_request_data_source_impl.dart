import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/friend_request_dto.dart';
import 'friend_request_data_source.dart';

// [엄수빈] 친구 요청 데이터 소스 구현
@LazySingleton(as: FriendRequestDataSource)
class FriendRequestDataSourceImpl implements FriendRequestDataSource {
  final SupabaseClient _supabaseClient;
  FriendRequestDataSourceImpl(this._supabaseClient);

  static const _table = 'friend_request';
  static const _user = 'user';
  static const _friend = 'friend';

  //친구 요청 리스트 가져오기
  @override
  Future<Result<List<FriendRequestDTO>>> getFriendRequest(int userId) async {
    try {
      final response = await _supabaseClient
          .from(_table)
          .select()
          .eq('target_id', userId)
          .order('created_at', ascending: false);

      final list = (response as List)
          .map((e) => FriendRequestDTO.fromJson(e))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  //보낸 친구 요청
  @override
  Future<Result<List<FriendRequestDTO>>> getSentRequest(int userId) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .eq('request_id', userId)
          .isFilter('answered_at', null);

      final list = (res as List)
          .map((e) => FriendRequestDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 친구 요청 보내기
  @override
  Future<Result<FriendRequestDTO>> createFriendRequest(
    int requestId,
    int targetId,
  ) async {
    try {
      final response = await _supabaseClient
          .from(_table)
          .insert({'request_id': requestId, 'target_id': targetId})
          .select()
          .single();

      final dto = FriendRequestDTO.fromJson(response);

      return Result.success(dto);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 친구요청 수락
  @override
  Future<Result<void>> acceptRequest(int id) async {
    try {
      final now = DateTime.now().toIso8601String(); //현재 시간 가져오기

      await _supabaseClient
          .from(_table)
          .update({'answered_at': now})
          .eq('id', id);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  //친구 요청 삭제
  @override
  Future<Result<void>> deleteRequest(int id) async {
    try {
      await _supabaseClient.from(_table).delete().eq('id', id);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 받은 요청 프로필로 가져오기
  @override
  Future<Result<List<UserDTO>>> getRequestProfile(int userId) async {
    try {
      // 내가 받은 친구 요청의 request_id 목록
      final reqRes = await _supabaseClient
          .from(_table)
          .select('request_id')
          .eq('target_id', userId)
          .isFilter('answered_at', null);

      final requestIds = (reqRes as List)
          .map((e) => e['request_id'])
          .whereType<int>()
          .toList();

      if (requestIds.isEmpty) {
        return const Result.success([]);
      }

      // users 테이블에서 해당 유저들 프로필 조회
      final userRes = await _supabaseClient
          .from(_user)
          .select()
          .inFilter('id', requestIds);

      final users = (userRes as List)
          .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(users);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 전체 검색
  @override
  Future<Result<List<UserDTO>>> searchRequestName(
    int myId,
    String keyword,
  ) async {
    try {
      final trimmed = keyword.trim();
      if (trimmed.isEmpty) return const Result.success([]);

      // 친구 관계
      final friendRes = await _supabaseClient
          .from(_friend)
          .select('user1_id, user2_id')
          .or('user1_id.eq.$myId,user2_id.eq.$myId');

      final friendIds = <int>{};
      for (final row in (friendRes as List)) {
        final m = row as Map<String, dynamic>;
        final u1 = m['user1_id'] as int?;
        final u2 = m['user2_id'] as int?;
        if (u1 == myId && u2 != null) friendIds.add(u2);
        if (u2 == myId && u1 != null) friendIds.add(u1);
      }

      // users
      final userRes = await _supabaseClient
          .from(_user)
          .select()
          .ilike('nickname', '%$trimmed%')
          .neq('id', myId)
          .limit(20); //폭주해서 많이 가져옴 방지

      final candidates = (userRes as List)
          .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      // 이미 친구인 사람 제외
      final filtered = candidates
          .where((u) => u.id != null && !friendIds.contains(u.id))
          .toList();

      return Result.success(filtered);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
