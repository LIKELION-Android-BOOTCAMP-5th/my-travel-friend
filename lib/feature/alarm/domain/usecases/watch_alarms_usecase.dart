import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/alarm_entity.dart';
import '../repositories/alarm_repository.dart';

// [이재은] 알림리스트 Realtime 구독
@LazySingleton()
class WatchAlarmsUseCase {
  final AlarmRepository _alarmRepository;

  WatchAlarmsUseCase(this._alarmRepository);

  Stream<Result<List<AlarmEntity>>> call(int userId) {
    return _alarmRepository.watchAlarms(userId);
  }
}
