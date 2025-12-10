import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/domain/repositories/alarm_setting_repository.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/alarm_setting_entity.dart';
import '../datasources/alarm_setting_datasource.dart';
import '../dtos/alarm_setting_dto.dart';

// [이재은] 알림설정 repository
@LazySingleton(as: AlarmSettingRepository)
class AlarmSettingRepositoryImpl implements AlarmSettingRepository {
  final AlarmSettingDataSource _dataSource;
  AlarmSettingRepositoryImpl(this._dataSource);

  // 내 알림 설정 가져오기
  @override
  Future<Result<AlarmSettingEntity>> getMyAlarmSetting(int userId) async {
    final res = await _dataSource.getMyAlarmSetting(userId: userId);

    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 알림설정 업데이트
  @override
  Future<Result<AlarmSettingEntity>> updateAlarmSetting(
    AlarmSettingEntity alarmSetting,
  ) async {
    final dto = AlarmSettingDTO.fromEntity(alarmSetting);

    final res = await _dataSource.updateAlarmSetting(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }
}
