import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

// [이재은] 권한 설정 관련 서비스 -> 로컬이라 서비스로!!
// 권한 타입 정의
enum AppPermissionType {
  notification, // 푸시
  camera, // 촬영(카메라)
  photo, // 사진선택(갤러리)
}

// 권한 상태 -> UI 표시 정보 + 상태
class PermissionInfo {
  final AppPermissionType type; // 권한 타입
  final String title; // 권한 이름
  final String description; // 권한 설명
  final bool isGranted; // 허용 여부
  final bool isPermanentlyDenied; // 영구 거부 (다시 묻지 않음 선택했는지!)

  const PermissionInfo({
    required this.type,
    required this.title,
    required this.description,
    required this.isGranted,
    required this.isPermanentlyDenied,
  });

  PermissionInfo copyWith({bool? isGranted, bool? isPermanentlyDenied}) {
    return PermissionInfo(
      type: type,
      title: title,
      description: description,
      isGranted: isGranted ?? this.isGranted,
      isPermanentlyDenied: isPermanentlyDenied ?? this.isPermanentlyDenied,
    );
  }
}

@LazySingleton()
class PermissionService {
  //앱에서 사용하는 기본 권한 목록
  static const List<AppPermissionType> appPermissions = [
    AppPermissionType.notification,
    AppPermissionType.camera,
    AppPermissionType.photo,
  ];

  // 앱에서 사용 하는 권한 메타 정보
  static const Map<AppPermissionType, _PermissionMeta> _metaMap = {
    AppPermissionType.notification: _PermissionMeta(
      title: '알림',
      description: '여행 일정, 친구 초대 등의 알림을 받을 수 있어요',
    ),
    AppPermissionType.camera: _PermissionMeta(
      title: '카메라',
      description: '여행 사진을 촬영하고 다이어리에 추가할 수 있어요',
    ),
    AppPermissionType.photo: _PermissionMeta(
      title: '사진',
      description: '갤러리에서 사진을 선택하여 업로드할 수 있어요',
    ),
  };

  // 전체 권한 상태 조회
  Future<List<PermissionInfo>> checkAllPermissions({
    List<AppPermissionType>? types,
  }) async {
    final targetTypes = types ?? appPermissions;
    final results = <PermissionInfo>[];

    for (final type in targetTypes) {
      final info = await checkPermission(type);
      results.add(info);
    }

    return results;
  }

  // 특정 권한 상태 조회
  Future<PermissionInfo> checkPermission(AppPermissionType type) async {
    final permission = _toPermission(type);
    final status = await permission.status;
    final meta = _metaMap[type]!;

    return PermissionInfo(
      type: type,
      title: meta.title,
      description: meta.description,
      isGranted: status.isGranted,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
  }

  // 권한 요청 다이얼로그 표시 -> 사용자 선택 후 결과 반환
  Future<PermissionInfo> requestPermission(AppPermissionType type) async {
    final permission = _toPermission(type);
    final status = await permission.request();
    final meta = _metaMap[type]!;

    return PermissionInfo(
      type: type,
      title: meta.title,
      description: meta.description,
      isGranted: status.isGranted,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
  }

  // 앱 설정 열기 -> 영구 거부된 권한은 여기서 변경
  Future<bool> openSettings() async {
    return await permission_handler.openAppSettings();
  }

  // AppPermissionType → permission_handler Permission 변환
  permission_handler.Permission _toPermission(AppPermissionType type) {
    switch (type) {
      case AppPermissionType.notification:
        return permission_handler.Permission.notification;
      case AppPermissionType.camera:
        return permission_handler.Permission.camera;
      case AppPermissionType.photo:
        return permission_handler.Permission.photos;
    }
  }
}

class _PermissionMeta {
  final String title;
  final String description;

  const _PermissionMeta({required this.title, required this.description});
}
