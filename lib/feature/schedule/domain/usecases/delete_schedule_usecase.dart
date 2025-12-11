import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../repositories/schedule_repository.dart';

@LazySingleton()
class DeleteScheduleUseCase {
  final ScheduleRepository _repository;

  DeleteScheduleUseCase(this._repository);

  Future<Result<void>> call(int scheduleId) {
    return _repository.deleteSchedule(scheduleId);
  }
}
