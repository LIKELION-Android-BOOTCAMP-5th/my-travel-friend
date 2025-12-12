import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/permission_service.dart';

// [이재은] 권한 요청 usecase
@LazySingleton()
class RequestPermissionUseCase {
  final PermissionService _service;

  RequestPermissionUseCase(this._service);

  Future<Result<PermissionInfo>> call(AppPermissionType type) async {
    try {
      final permission = await _service.requestPermission(type);
      return Result.success(permission);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '권한 요청에 실패했어요'));
    }
  }
}
