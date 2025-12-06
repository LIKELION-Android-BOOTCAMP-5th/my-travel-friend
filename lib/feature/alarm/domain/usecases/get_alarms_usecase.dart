import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/alarm_entity.dart';
import '../repositories/alarm_repository.dart';

// [이재은] 내 알람 리스트 조회 usecase
@LazySingleton()
class GetAlarmsUseCase {
  final AlarmRepository _alarmRepository;

  GetAlarmsUseCase(this._alarmRepository);

  // 알림 리스트 가져오기
  Future<Result<List<AlarmEntity>>> call({
    required int userId,
    required int page,
    int limit = 20,
  }) {
    return _alarmRepository.getAlarms(userId, page, limit);
  }
}
