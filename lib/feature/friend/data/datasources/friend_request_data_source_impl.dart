import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/friend_request_dto.dart';
import 'friend_request_data_source.dart';

// [엄수빈] 친구 요청 데이터 소스 구현
@LazySingleton(as: FriendRequestDataSource)
class FriendRequestDataSourceImpl implements FriendRequestDataSource {
  FriendRequestDataSourceImpl();

  final supabase = Supabase.instance.client;
  static const _table = 'friend_request';

  @override
  Future<Result<List<FriendRequestDTO>>> getFriendRequest(int userId) async {
    try {
      final response = await supabase
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

  @override
  Future<Result<FriendRequestDTO>> createFriendRequest(
    int requestId,
    int targetId,
  ) async {
    try {
      final response = await supabase
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

  @override
  Future<Result<void>> acceptRequest(int id) async {
    try {
      final now = DateTime.now().toIso8601String();

      await supabase.from(_table).update({'answered_at': now}).eq('id', id);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteRequest(int id) async {
    try {
      await supabase.from(_table).delete().eq('id', id);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
