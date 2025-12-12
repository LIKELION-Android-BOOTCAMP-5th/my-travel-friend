import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../repositories/schedule_repository.dart';

@LazySingleton()
class GetTripMembersUseCase {
  final ScheduleRepository _repository;

  GetTripMembersUseCase(this._repository);

  Future<Result<List<UserEntity>>> call({required int tripId}) {
    return _repository.getTripMembers(tripId);
  }
}
