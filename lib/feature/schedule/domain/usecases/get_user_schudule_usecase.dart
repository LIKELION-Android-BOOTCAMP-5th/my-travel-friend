import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/schedule_entity.dart';
import '../repositories/schedule_repository.dart';

// [이재은] 유저가 참여하는 스케줄 조회
@LazySingleton()
class GetUserScheduleUseCase {
  final ScheduleRepository _repository;

  GetUserScheduleUseCase(this._repository);

  Future<Result<List<ScheduleEntity>>> call({
    required int tripId,
    required int userId,
  }) async {
    return await _repository.getUserSchedule(tripId: tripId, userId: userId);
  }
}
