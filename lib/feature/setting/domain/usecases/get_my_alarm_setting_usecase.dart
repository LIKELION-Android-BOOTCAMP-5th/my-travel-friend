import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/domain/entities/alarm_setting_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/alarm_setting_repository.dart';

// [이재은] 알림 설정 정보 가져오기
@LazySingleton()
class GetMyAlarmSettingUseCase {
  final AlarmSettingRepository _alarmSettingRepository;

  GetMyAlarmSettingUseCase(this._alarmSettingRepository);

  // 알림 설정 가져오기
  Future<Result<AlarmSettingEntity>> call({required int userId}) {
    return _alarmSettingRepository.getMyAlarmSetting(userId);
  }
}
