import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/alarm_setting_dto.dart';
import 'alarm_setting_datasource.dart';

// [이재은] 알림설정 관련 데이터 소스 (구현체)
@LazySingleton(as: AlarmSettingDataSource)
class AlarmSettingDataSourceImpl implements AlarmSettingDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  AlarmSettingDataSourceImpl(this._supabaseClient);

  // 내 알림 설정 조회
  @override
  Future<Result<AlarmSettingDTO>> getMyAlarmSetting({
    required int userId,
  }) async {
    try {
      final res = await _supabaseClient
          .from('alarm_setting')
          .select()
          .eq('user_id', userId)
          .single();

      final list = AlarmSettingDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 알림 설정 업데이트
  Future<Result<AlarmSettingDTO>> updateAlarmSetting(
    AlarmSettingDTO alarmSetting,
  ) async {
    try {
      final updateDate = alarmSetting.toJson()
        ..remove('user_id')
        ..remove('created_at');

      final res = await _supabaseClient
          .from('alarm_setting')
          .update(updateDate)
          .eq('user_id', alarmSetting.userId!)
          .select()
          .single();

      final list = AlarmSettingDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
