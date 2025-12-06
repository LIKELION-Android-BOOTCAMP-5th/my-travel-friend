import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/alarm/domain/entities/alarm_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/alarm_repository.dart';

// [이재은] 아이디로 세부 알림 조회하기 usecase
@LazySingleton()
class GetAlarmByIdUseCase {
  final AlarmRepository _alarmRepository;

  GetAlarmByIdUseCase(this._alarmRepository);

  // 알림 상세 조회(아이디로 가져오기)
  Future<Result<AlarmEntity>> call(int id) {
    return _alarmRepository.getAlarmById(id);
  }
}
