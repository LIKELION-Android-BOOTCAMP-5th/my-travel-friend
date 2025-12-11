import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/service/internal/permission_service.dart';

part 'permission_event.freezed.dart';

// [이재은] 권한 설정 관련 이벤트
@freezed
abstract class PermissionEvent with _$PermissionEvent {
  // 권한 상태 불러오기
  const factory PermissionEvent.loadPermission() = LoadPermission;

  // 권한 토글 클릭 -> 호출
  const factory PermissionEvent.toggled(AppPermissionType type) = Toggled;

  // 시스텝 설정으로 이동
  const factory PermissionEvent.openSystem() = OpenSystem;

  // 새로고침
  const factory PermissionEvent.refresh() = Refresh;
}
