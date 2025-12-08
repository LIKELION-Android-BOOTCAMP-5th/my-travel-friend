import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/alarm_entity.dart';
import '../repositories/alarm_repository.dart';

@LazySingleton()
class CheckAlarmsUseCase {
  final AlarmRepository _alarmRepository;

  CheckAlarmsUseCase(this._alarmRepository);

  // 알림 리스트 전체 읽음 처리
  Future<Result<List<AlarmEntity>>> call(int userId) {
    return _alarmRepository.checkAlarms(userId);
  }
}
