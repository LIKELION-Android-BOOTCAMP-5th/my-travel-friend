import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/alarm_dto.dart';
import 'alarm_data_source.dart';

// [이재은] 알림 관련 데이터 소스 (구현체)
@LazySingleton(as: AlarmDataSource)
class AlarmDataSourceImpl implements AlarmDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;

  // Realtime 채널 관리
  RealtimeChannel? _alarmChannel;
  final _alarmStreamController =
      StreamController<Result<List<AlarmDTO>>>.broadcast();

  AlarmDataSourceImpl(this._supabaseClient);

  // 알림 리스트 조회
  @override
  Future<Result<List<AlarmDTO>>> getAlarms({
    required int userId,
    required int page,
    required int limit,
  }) async {
    try {
      final offset = page * limit;

      final res = await _supabaseClient
          .from('alarm')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final list = (res as List)
          .map((json) => AlarmDTO.fromJson(json))
          .toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 알림 상세 조회
  @override
  Future<Result<AlarmDTO>> getAlarmById(int id) async {
    try {
      final res = await _supabaseClient
          .from('alarm')
          .select()
          .eq('id', id)
          .single();

      final list = AlarmDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 알림 하나 읽음 처리
  @override
  Future<Result<List<AlarmDTO>>> checkAnAlarm(int alarmId) async {
    try {
      final res = await _supabaseClient
          .from('alarm')
          .update({'is_checked': true})
          .eq('id', alarmId!)
          .select();

      final list = (res as List).map((e) => AlarmDTO.fromJson(e)).toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 모든 알림 읽음 처리
  @override
  Future<Result<List<AlarmDTO>>> checkAlarms(int userId) async {
    try {
      final res = await _supabaseClient
          .from('alarm')
          .update({'is_checked': true})
          .eq('user_id', userId)
          .select();

      final list = (res as List).map((e) => AlarmDTO.fromJson(e)).toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 리얼타임 구독 - userId로 필터링
  @override
  Stream<Result<List<AlarmDTO>>> watchAlarms(int userId) {
    // 기존 채널 정리
    _alarmChannel?.unsubscribe();

    _alarmChannel = _supabaseClient
        .channel('alarm_user_$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'alarm',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            _handleRealtimeEvent(payload, userId);
          },
        )
        .subscribe();

    return _alarmStreamController.stream;
  }

  // Realtime 이벤트 처리
  Future<void> _handleRealtimeEvent(
    PostgresChangePayload payload,
    int userId,
  ) async {
    // 변경 발생 시 전체 리스트 다시 조회
    final res = await getAlarms(userId: userId, page: 0, limit: 50);
    _alarmStreamController.add(res);
  }

  // 구독 해제
  @override
  Future<void> unsubscribeAlarms() async {
    await _alarmChannel?.unsubscribe();
    _alarmChannel = null;
  }

  // 리소스 정리
  void dispose() {
    _alarmChannel?.unsubscribe();
    _alarmStreamController.close();
  }
}
