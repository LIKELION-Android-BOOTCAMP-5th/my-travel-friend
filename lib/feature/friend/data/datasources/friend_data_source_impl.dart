import 'package:supabase_flutter/supabase_flutter.dart';

import '../dtos/friend_dto.dart';
import 'friend_data_source.dart';

// [엄수빈] 친구 데이터 소스 (구현)
class FriendDataSourceImpl implements FriendDataSource {
  final SupabaseClient _supabaseClient;
  FriendDataSourceImpl(this._supabaseClient);

  // userId의 친구 명단 다 가져오기
  @override
  Future<List<FriendDTO>> getFriends(int userId) async {
    final res = await _supabaseClient
        .from('friend')
        .select()
        .or('user1_id.eq$userId,user2_id.eq$userId');

    return (res as List).map((json) => FriendDTO.fromJson(json)).toList();
  }

  // 두 유저 사이에 친구 관계가 있는지 확인
  @override
  Future<FriendDTO?> getFriendRelation(int userId1, int userId2) async {
    final res = await _supabaseClient
        .from('friend')
        .select()
        .or(
          'and(user1_id.eq.$userId1,user2_id.eq.$userId2),'
          'and(user1_id.eq.$userId2,user2_id.eq.$userId1)',
        );

    return FriendDTO.fromJson(res as Map<String, dynamic>);
  }

  // 새로운 친구 관계 생성
  @override
  Future<FriendDTO> createFriendRelation(int userId1, int userId2) async {
    final insertData = {'user1_id': userId1, 'user2_id': userId2};

    final res = await _supabaseClient
        .from('friend')
        .insert(insertData)
        .select()
        .maybeSingle();

    return FriendDTO.fromJson(res as Map<String, dynamic>);
  }

  // 친구 삭제
  @override
  Future<void> deleteFriend(int userId1, int userId2) async {
    await _supabaseClient
        .from('friend')
        .delete()
        .or(
          'and(user1_id.eq.$userId1,user2_id.eq.$userId2),'
          'and(user1_id.eq.$userId2,user2_id.eq.$userId1)',
        );
  }
}
