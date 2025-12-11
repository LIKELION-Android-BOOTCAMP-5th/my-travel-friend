import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/schedule/data/datasources/schedule_data_source.dart';
import 'package:my_travel_friend/feature/schedule/data/dtos/schedule_dto.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/schedule_entity.dart';
import 'package:my_travel_friend/feature/schedule/domain/repositories/schedule_repository.dart';

@LazySingleton(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource _dataSource;

  ScheduleRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<ScheduleEntity>>> getAllSchedule(
    int tripId,
    int page,
  ) async {
    final res = await _dataSource.getAllSchedule(tripId: tripId, page: page);

    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<ScheduleEntity>> createSchedule(
    ScheduleEntity schedule,
    List<int> memberIds,
  ) async {
    final dto = ScheduleDTO.fromEntity(schedule);

    final res = await _dataSource.createSchedule(
      schedule: dto,
      memberIds: memberIds,
    );

    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<ScheduleEntity>> updateSchedule(
    ScheduleEntity schedule,
    List<int> memberIds,
  ) async {
    final dto = ScheduleDTO.fromEntity(schedule);

    final res = await _dataSource.updateSchedule(
      schedule: dto,
      memberIds: memberIds,
    );

    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<void>> deleteSchedule(int scheduleId) async {
    return await _dataSource.deleteSchedule(scheduleId: scheduleId);
  }

  @override
  Future<Result<List<UserEntity>>> getScheduleMembers(int scheduleId) async {
    final res = await _dataSource.getScheduleMembers(scheduleId: scheduleId);

    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<List<UserEntity>>> getTripMembers(int tripId) async {
    final res = await _dataSource.getTripMembers(tripId: tripId);

    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }
}
