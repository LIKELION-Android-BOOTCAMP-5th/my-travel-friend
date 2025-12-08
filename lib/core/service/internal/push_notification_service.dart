import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);
  Future<void> initialize() async {
    // 주의: 백그라운드 핸들러 등록은 main.dart에서 처리됨

    // iOS 포그라운드 알림 표시 설정 (iOS에서 포그라운드 알림 팝업을 띄우기 위해 필수)
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    /*
    _setupTokenRefreshListener();

    _initialization();

    // 4. 알림 수신 리스너 설정
    _setupMessageListeners();*/
  }

  // 푸시알람 권한 요청 메서드
  Future<bool> requestPermission() async {
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final isGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized;
    return isGranted;
  }

  Future<String?> getToken() async {
    final fcmToken = await _fcm.getToken();
    print("Initial FCM Token: $fcmToken");
    return fcmToken;
  }
}
