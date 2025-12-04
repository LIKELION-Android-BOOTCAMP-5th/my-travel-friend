import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging fcm;

  PushNotificationService(this.fcm);

  Future<String?> getToken() async {
    final fcmToken = await fcm.getToken();
    print("Initial FCM Token: $fcmToken");
    return fcmToken;
  }
}
