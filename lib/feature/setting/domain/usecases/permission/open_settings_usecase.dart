import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/permission_service.dart';

// [이재은] 시스템 설정 열기 usecase
@LazySingleton()
class OpenSettingsUseCase {
  final PermissionService _service;

  OpenSettingsUseCase(this._service);

  Future<Result<bool>> call() async {
    try {
      final result = await _service.openSettings();
      return Result.success(result);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '설정을 여는데 실패했어요'));
    }
  }
}
