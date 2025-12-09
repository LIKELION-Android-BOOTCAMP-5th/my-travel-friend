import '../../../../core/result/result.dart';
import '../entities/alarm_setting_entity.dart';

// [이재은] 알림 설정 관련 domain repository
abstract class AlarmSettingRepository {
  // 현재 알림 설정 가져오기
  Future<Result<AlarmSettingEntity>> getMyAlarmSetting(int userId);

  // 알림 설정 변경
  Future<Result<AlarmSettingEntity>> updateAlarmSetting(
    AlarmSettingEntity alarmSetting,
  );
}
