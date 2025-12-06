import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/alarm_entity.dart';
import '../../domain/repositories/alarm_repository.dart';
import '../datasources/alarm_data_source.dart';

@LazySingleton(as: AlarmRepository)
class AlarmRepositoryImpl implements AlarmRepository {
  final AlarmDataSource _dataSource;
  AlarmRepositoryImpl(this._dataSource);

  // 알림 리스트 가져오기
  @override
  Future<Result<List<AlarmEntity>>> getAlarms(
    int userId,
    int page,
    int limit,
  ) async {
    final res = await _dataSource.getAlarms(
      userId: userId,
      page: page,
      limit: limit,
    );

    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 알림 하나 선택해서 읽기
  @override
  Future<Result<AlarmEntity>> getAlarmById(int id) async {
    final res = await _dataSource.getAlarmById(id);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 알림 하나 읽음 처리
  @override
  Future<Result<List<AlarmEntity>>> checkAnAlarm(int alarmId) async {
    final res = await _dataSource.checkAnAlarm(alarmId);
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 알림 전체 읽음 처리
  @override
  Future<Result<List<AlarmEntity>>> checkAlarms(int userId) async {
    final res = await _dataSource.checkAlarms(userId);
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }
}
