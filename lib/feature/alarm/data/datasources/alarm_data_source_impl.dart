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
}
