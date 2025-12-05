import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging fcm;

  PushNotificationService(this.fcm);

  // 푸시알람 권한 요청 메서드
  Future<bool> requestPermission() async {
    final settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final isGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized;
    return isGranted;
  }

  Future<String?> getToken() async {
    final fcmToken = await fcm.getToken();
    print("Initial FCM Token: $fcmToken");
    return fcmToken;
  }
}
