import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../config/router.dart';

@lazySingleton
class DeepLinkService {
  final GoRouter _router = AppRouter.instance.router;

  // 알림 데이터를 받아 라우팅을 실행하는 핵심 메서드
  void navigateFromNotification(
    String alarmType,
    Map<String, dynamic> fcmData,
  ) {
    final String targetRoute = _generateRoute(alarmType, fcmData);

    _router.push(targetRoute);
  }

  // 로컬 알림 페이로드에서 데이터를 추출하여 라우팅 실행 (onDidReceiveNotificationResponse 콜백용)
  String _generateRoute(String alarmType, Map<String, dynamic> deepLinkData) {
    switch (alarmType) {
      case 'TRIP_REQUEST':
        throw UnimplementedError();

      case 'FRIEND_REQUEST':
        throw UnimplementedError();

      case 'NEW_FRIEND':
        throw UnimplementedError();

      case 'SCHEDULE_EDITED':
        throw UnimplementedError();
      case 'SCHEDULE_ADDED':
        throw UnimplementedError();
      case 'SCHEDULE_DELETED':
        throw UnimplementedError();

      case 'TALK_MESSAGE':
        throw UnimplementedError();

      case 'D_DAY':
        throw UnimplementedError();
      default:
        // 정의되지 않은 알람 타입일 경우 기본 홈 경로
        return '/';
    }
  }
}
