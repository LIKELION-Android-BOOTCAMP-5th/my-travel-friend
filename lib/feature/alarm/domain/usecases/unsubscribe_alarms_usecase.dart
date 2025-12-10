import 'package:injectable/injectable.dart';

import '../repositories/alarm_repository.dart';

// [이재은] Realtime 구독 해제용 usecase
@LazySingleton()
class UnsubscribeAlarmsUseCase {
  final AlarmRepository _alarmRepository;

  UnsubscribeAlarmsUseCase(this._alarmRepository);

  Future<void> call() {
    return _alarmRepository.unsubscribeAlarms();
  }
}
