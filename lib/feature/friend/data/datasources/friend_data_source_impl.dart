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
  Future<Result<List<UserDTO>>> searchNickname(int myId, String keyword) async {
    try {
      // friend 테이블에서 내 친구 관계 가져오기
      final friendRes = await _supabaseClient
          .from(_table)
          .select()
          .or('user1_id.eq.$myId,user2_id.eq.$myId');

      final friendList = (friendRes as List)
          .map((json) => FriendDTO.fromJson(json as Map<String, dynamic>))
          .toList();

      if (friendList.isEmpty) {
        // 친구가 한 명도 없으면 바로 빈 리스트
        return const Result.success([]);
      }

      // 친구 관계에서 상대방 userId만 뽑기
      final friendUserIds = <int>{}; // 중복 제거를 위해 Set 사용

      for (final f in friendList) {
        final user1 = f.userId1;
        final user2 = f.userId2;

        if (user1 == myId && user2 != null) {
          friendUserIds.add(user2);
        } else if (user2 == myId && user1 != null) {
          friendUserIds.add(user1);
        }
      }

      // user 테이블에서 닉네임 검색으로 필터
      final userRes = await _supabaseClient
          .from(_user)
          .select()
          // id가 친구 목록에 포함된 유저들만
          .filter('id', 'in', friendUserIds.toList())
          // 닉네임 부분 검색
          .like('nickname', '%$keyword%');

      final userList = (userRes as List)
          .map((json) => UserDTO.fromJson(json as Map<String, dynamic>))
          .toList();

      return Result.success(userList);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
