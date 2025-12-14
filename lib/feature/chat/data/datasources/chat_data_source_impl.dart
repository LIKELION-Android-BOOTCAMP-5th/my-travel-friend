import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';
import '../dtos/chat_dto.dart';
import '../dtos/chat_read_status_dto.dart';
import 'chat_data_source.dart';

// [이재은] 채팅 관련 데이터 소스 (구현체)
@LazySingleton(as: ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;

  // Realtime 채널 관리
  RealtimeChannel? _chatChannel;
  StreamController<Result<List<ChatDTO>>>? _chatStreamController;

  ChatDataSourceImpl(this._supabaseClient);

  // 채팅 내용 가져오기 (여행아이디로)
  @override
  Future<Result<List<ChatDTO>>> getChat({
    required int tripId,
    required int page,
    required int limit,
  }) async {
    try {
      final offset = page * limit;

      final res = await _supabaseClient
          .from('chat')
          .select('*')
          .eq('trip_id', tripId)
          .order('created_at', ascending: true)
          .range(offset, offset + limit - 1);

      final list = (res as List).map((json) => ChatDTO.fromJson(json)).toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 채팅 보내기
  @override
  Future<Result<ChatDTO>> sendChat({required ChatDTO chat}) async {
    try {
      final insertData = chat.toJson()
        ..remove('user')
        ..remove('id')
        ..remove('created_at');
      final res = await _supabaseClient
          .from('chat')
          .insert(insertData)
          .select('*')
          .single();
      final dto = ChatDTO.fromJson(res);
      return Result.success(dto);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 리얼타임 구독 - tripId로 필터링
  @override
  Stream<Result<List<ChatDTO>>> subscribeChat(int tripId) {
    // 기존 채널 정리
    _chatChannel?.unsubscribe();
    _chatStreamController?.close();

    // 새 생성
    _chatStreamController = StreamController<Result<List<ChatDTO>>>.broadcast();

    _chatChannel = _supabaseClient
        .channel('chat_$tripId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'chat',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'trip_id',
            value: tripId,
          ),
          callback: (payload) {
            _handleRealtimeEvent(payload, tripId);
          },
        )
        .subscribe();

    return _chatStreamController!.stream;
  }

  // Realtime 이벤트 처리
  Future<void> _handleRealtimeEvent(
    PostgresChangePayload payload,
    int tripId,
  ) async {
    // 변경 발생 시 전체 리스트 다시 조회
    final res = await getChat(tripId: tripId, page: 0, limit: 50);
    _chatStreamController?.add(res);
  }

  // 구독 해제
  @override
  Future<void> unsubscribeChat() async {
    await _chatChannel?.unsubscribe();
    _chatChannel = null;
    await _chatStreamController?.close();
    _chatStreamController = null;
  }

  // 여행 크루 리스트 조회
  @override
  Future<Result<List<UserDTO>>> getTripCrews({required int tripId}) async {
    try {
      final res = await _supabaseClient
          .from('trip_crew')
          .select('''
            user:member_id (
              id,
              uuid,
              nickname,
              email,
              token,
              profile_img,
              delete_at
            )
          ''')
          .eq('trip_id', tripId);

      final crews = (res as List)
          .where((row) => row['user'] != null)
          .map((row) => UserDTO.fromJson(row['user']))
          .toList();

      return Result.success(crews);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 채팅 마지막 읽은 위치 조회
  @override
  Future<Result<ChatReadStatusDTO?>> getReadStatus({
    required int tripId,
    required int userId,
  }) async {
    try {
      final res = await _supabaseClient
          .from('chat_read_status')
          .select()
          .eq('trip_id', tripId)
          .eq('user_id', userId)
          .maybeSingle();

      if (res == null) {
        return Result.success(null);
      }

      return Result.success(ChatReadStatusDTO.fromJson(res));
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 채팅 읽음 상태 업데이트
  @override
  Future<Result<ChatReadStatusDTO>> updateReadStatus({
    required int tripId,
    required int userId,
    required int lastReadChatId,
  }) async {
    try {
      final res = await _supabaseClient
          .from('chat_read_status')
          .upsert({
            'trip_id': tripId,
            'user_id': userId,
            'last_read_chat_id': lastReadChatId,
            'last_read_at': DateTime.now().toIso8601String(),
          }, onConflict: 'trip_id,user_id')
          .select()
          .single();

      return Result.success(ChatReadStatusDTO.fromJson(res));
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 채팅 안 읽은 메시지 개수 조회
  @override
  Future<Result<int>> getUnreadCount({
    required int tripId,
    required int userId,
  }) async {
    try {
      // 마지막 읽은 chat_id 조회
      final statusRes = await _supabaseClient
          .from('chat_read_status')
          .select('last_read_chat_id')
          .eq('trip_id', tripId)
          .eq('user_id', userId)
          .maybeSingle();

      final lastReadChatId = statusRes?['last_read_chat_id'] as int?;

      // 안 읽은 메시지 개수 조회
      if (lastReadChatId == null) {
        // 읽은 적 없으면 전체 개수
        final countRes = await _supabaseClient
            .from('chat')
            .select()
            .eq('trip_id', tripId)
            .count(CountOption.exact);

        return Result.success(countRes.count);
      } else {
        // 마지막 읽은 id보다 큰 메시지 개수
        final countRes = await _supabaseClient
            .from('chat')
            .select()
            .eq('trip_id', tripId)
            .gt('id', lastReadChatId)
            .count(CountOption.exact);

        return Result.success(countRes.count);
      }
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
