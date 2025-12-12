import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/service/internal/permission_service.dart';

part 'permission_state.freezed.dart';

// [이재은] 권한 설정 관련 상태
// 페이지 상태
enum PermissionPageState { initial, loading, loaded, error }

@freezed
abstract class PermissionState with _$PermissionState {
  const factory PermissionState({
    // 페이지 상태
    @Default(PermissionPageState.initial) PermissionPageState pageState,

    // 권한 목록
    @Default([]) List<PermissionInfo> permissions,

    // 에러
    String? message,
  }) = _PermissionState;

  const PermissionState._();

  bool isGranted(AppPermissionType type) {
    return permissions.where((p) => p.type == type).firstOrNull?.isGranted ??
        false;
  }

  PermissionInfo? getPermission(AppPermissionType type) {
    return permissions.where((p) => p.type == type).firstOrNull;
  }
}
