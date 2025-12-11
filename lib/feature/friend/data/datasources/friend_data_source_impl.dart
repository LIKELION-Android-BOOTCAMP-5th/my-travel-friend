import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';
import '../dtos/friend_dto.dart';
import 'friend_data_source.dart';

// [엄수빈] 친구 데이터 소스 (구현)
@LazySingleton(as: FriendDataSource)
class FriendDataSourceImpl implements FriendDataSource {
  final SupabaseClient _supabaseClient;
  FriendDataSourceImpl(this._supabaseClient);

  static const _table = 'friend';
  static const _user = 'user';

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

  //친구 검색
  @override
  Future<Result<List<FriendDTO>>> searchNickname(
    int myId,
    String keyword,
  ) async {
    try {
      // 닉네임으로 users 테이블에서 후보 유저들 찾기
      final userRes = await _supabaseClient
          .from(_user)
          .select()
          .like('nickname', '%$keyword%') // 부분 검색
          .neq('id', myId); // 자기 자신은 제외

      final candidateUsers = (userRes as List)
          .map((json) => UserDTO.fromJson(json as Map<String, dynamic>))
          .toList();

      if (candidateUsers.isEmpty) {
        // 닉네임에 해당하는 유저가 아무도 없으면 바로 빈 리스트
        return const Result.success([]);
      }

      // 후보 유저들의 id만 뽑기
      final targetIds = candidateUsers
          .map((u) => u.id)
          .whereType<int>() // null 제거
          .toList();

      if (targetIds.isEmpty) {
        return const Result.success([]);
      }

      // Supabase in() 쿼리용 문자열 (예: "2,3,5")
      final idListStr = targetIds.join(',');

      /// friend 테이블에서 내 친구들 중 닉네임 후보들에 해당하는 관계만 가져오기
      final friendRes = await _supabaseClient
          .from(_table)
          .select()
          .or(
            'and(user1_id.eq.$myId,user2_id.in.($idListStr)),'
            'and(user2_id.eq.$myId,user1_id.in.($idListStr))',
          );

      if (friendRes.isEmpty) {
        // 닉네임에 맞는 애들 중에 실제로 내 친구인 사람은 없는 경우
        return const Result.success([]);
      }

      final friendList = (friendRes as List)
          .map((json) => FriendDTO.fromJson(json as Map<String, dynamic>))
          .toList();

      return Result.success(friendList);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
