import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/schedule_entity.dart';
import '../repositories/schedule_repository.dart';

@LazySingleton()
class UpdateScheduleUseCase {
  final ScheduleRepository _repository;

  UpdateScheduleUseCase(this._repository);

  Future<Result<ScheduleEntity>> call({
    required ScheduleEntity schedule,
    required List<int> memberIds,
  }) {
    return _repository.updateSchedule(schedule, memberIds);
  }
}
