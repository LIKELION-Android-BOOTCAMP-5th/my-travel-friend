// [이재은] 알림 설정 관련 데이터 소스 (추상)
import '../../../../core/result/result.dart';
import '../dtos/alarm_setting_dto.dart';

abstract class AlarmSettingDataSource {
  // 내 알림 설정 불러오기
  Future<Result<AlarmSettingDTO>> getMyAlarmSetting({required int userId});

  // 알림 설정 업데이트
  Future<Result<AlarmSettingDTO>> updateAlarmSetting(
    AlarmSettingDTO alarmSetting,
  );
}
