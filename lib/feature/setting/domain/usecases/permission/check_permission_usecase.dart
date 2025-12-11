// [이재은] 권한 상태 조회 유스케이스
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../../../../core/service/internal/permission_service.dart';

@LazySingleton()
class CheckPermissionsUseCase {
  final PermissionService _service;

  CheckPermissionsUseCase(this._service);

  Future<Result<List<PermissionInfo>>> call() async {
    try {
      final permissions = await _service.checkAllPermissions();
      return Result.success(permissions);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '권한 상태를 불러오는데 실패했어요'));
    }
  }
}
