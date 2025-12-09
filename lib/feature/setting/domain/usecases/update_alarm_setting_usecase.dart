import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/domain/entities/alarm_setting_entity.dart';
import 'package:my_travel_friend/feature/setting/domain/repositories/alarm_setting_repository.dart';

import '../../../../core/result/result.dart';

@LazySingleton()
class UpdateAlarmSettingUseCase {
  final AlarmSettingRepository _alarmSettingRepository;

  UpdateAlarmSettingUseCase(this._alarmSettingRepository);

  // 알림 설정 수정
  Future<Result<AlarmSettingEntity>> call(AlarmSettingEntity alarmSetting) {
    return _alarmSettingRepository.updateAlarmSetting(alarmSetting);
  }
}
