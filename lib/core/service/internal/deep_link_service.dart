import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../config/router.dart';

@lazySingleton
class DeepLinkService {
  final GoRouter _router = AppRouter.instance.router;

  // 알림 데이터를 받아 라우팅을 실행하는 핵심 메서드
  void navigateFromNotification(Map<String, dynamic> fcmData) {
    // 2. GoRouter를 사용해 페이지 이동 실행 (push를 사용하여 스택 위에 새 화면을 덮음)
    //_router.push(targetRoute);

    //print('DeepLinkService: 라우팅 성공 경로: $targetRoute');
  }

  // 로컬 알림 페이로드에서 데이터를 추출하여 라우팅 실행 (onDidReceiveNotificationResponse 콜백용)
  void navigateFromPayload(String payload) {
    /*
    try {
      final Map<String, dynamic> fcmData = jsonDecode(payload);
      navigateFromNotification(fcmData);
    } catch (e) {
      print('Payload 파싱 에러: $e');
    }
    */
  }
}
