import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/alarm/domain/repositories/alarm_repository.dart';

import '../../../../core/result/result.dart';
import '../entities/alarm_entity.dart';

@LazySingleton()
class CheckAnAlarmUseCase {
  final AlarmRepository _alarmRepository;

  CheckAnAlarmUseCase(this._alarmRepository);

  // 알림 하나 읽음 처리
  Future<Result<List<AlarmEntity>>> call(int alarmId) {
    return _alarmRepository.checkAnAlarm(alarmId);
  }
}
