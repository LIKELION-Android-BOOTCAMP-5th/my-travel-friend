import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/permission_service.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/permission/permission_event.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/permission/permission_state.dart';

import '../../../domain/usecases/permission/check_permission_usecase.dart';
import '../../../domain/usecases/permission/request_permission_usecase.dart';

// [이재은] 권한 설정 관련 bloc
@injectable
class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final CheckPermissionsUseCase _checkPermissionsUseCase;
  final RequestPermissionUseCase _requestPermissionUseCase;
  final PermissionService _permissionService;

  PermissionBloc(
    this._permissionService,
    this._checkPermissionsUseCase,
    this._requestPermissionUseCase,
  ) : super(const PermissionState()) {
    on<LoadPermission>(_onLoadPermission);
    on<Toggled>(_onToggle);
    on<OpenSystem>(_onOpenSystem);
    on<Refresh>(_onRefresh);
  }

  // 권한 상태 가져오기
  Future<void> _onLoadPermission(
    LoadPermission event,
    Emitter<PermissionState> emit,
  ) async {
    emit(state.copyWith(pageState: PermissionPageState.loading));

    final res = await _checkPermissionsUseCase();

    res.when(
      success: (permissions) {
        emit(
          state.copyWith(
            pageState: PermissionPageState.loaded,
            permissions: permissions,
          ),
        );
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(
          state.copyWith(
            pageState: PermissionPageState.error,
            message: message,
          ),
        );
      },
    );
  }

  // 권한 토글 (현재 미사용 상태지만 혹시 몰라 보존)
  Future<void> _onToggle(Toggled event, Emitter<PermissionState> emit) async {
    final current = state.permissions
        .where((p) => p.type == event.type)
        .firstOrNull;

    if (current == null) return;

    // 이미 허용됨 or 영구 거부 → 설정으로 이동
    if (current.isGranted || current.isPermanentlyDenied) {
      await _permissionService.openSettings();
      return;
    }

    // 권한 요청
    final res = await _requestPermissionUseCase(event.type);

    res.when(
      success: (updated) {
        // 영구 거부 시 설정으로 이동
        if (updated.isPermanentlyDenied) {
          _permissionService.openSettings();
        }

        // 목록 업데이트
        final newList = state.permissions.map((p) {
          return p.type == event.type ? updated : p;
        }).toList();

        emit(state.copyWith(permissions: newList));

        if (!updated.isGranted) {
          _permissionService.openSettings();
        }
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(
          state.copyWith(
            pageState: PermissionPageState.error,
            message: message,
          ),
        );
      },
    );
  }

  // 시스템 설정 열기
  Future<void> _onOpenSystem(
    OpenSystem event,
    Emitter<PermissionState> emit,
  ) async {
    await _permissionService.openSettings();
  }

  // 새로고침
  Future<void> _onRefresh(Refresh event, Emitter<PermissionState> emit) async {
    final res = await _checkPermissionsUseCase();

    res.when(
      success: (permissions) {
        emit(state.copyWith(permissions: permissions, message: null));
      },
      failure: (_) {
        // 새로고침 실패는 무시
      },
    );
  }
}
