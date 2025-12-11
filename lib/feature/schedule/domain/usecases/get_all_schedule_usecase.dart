import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/schedule_entity.dart';
import '../repositories/schedule_repository.dart';

@LazySingleton()
class GetAllScheduleUseCase {
  final ScheduleRepository _repository;

  GetAllScheduleUseCase(this._repository);

  Future<Result<List<ScheduleEntity>>> call({
    required int tripId,
    required int page,
  }) {
    return _repository.getAllSchedule(tripId, page);
  }
}
