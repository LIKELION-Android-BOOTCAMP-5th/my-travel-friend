import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/service/internal/deep_link_service.dart';

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging _fcm;
  final DeepLinkService _deepLinkService;
  final FlutterLocalNotificationsPlugin _local;
  PushNotificationService(this._fcm, this._deepLinkService, this._local);
  Future<void> initialize() async {
    // 주의: 백그라운드 핸들러 등록은 main.dart에서 처리됨

    // iOS 포그라운드 알림 표시 설정 (iOS에서 포그라운드 알림 팝업을 띄우기 위해 필수)
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _initialization();

    // 알림 수신 리스너 설정
    _setupMessageListeners();
  }

  void _setupMessageListeners() {
    //포그라운드 메시지 (앱 실행 중)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('=== FOREGROUND MESSAGE RECEIVED ===');

      sendLocalPushFromFCM(message);
    });

    //알림 탭 이벤트 리스너 (Background 상태에서 알림 탭 시)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('=== MESSAGE OPENED APP (BACKGROUND) ===');
      handleRemoteMessageRouting(message);
    });

    // 앱이 완전히 종료(Terminated) 상태일 때 알림을 탭하면 메시지를 가져옴
    _fcm.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print('=== INITIAL MESSAGE (TERMINATED) ===');
        handleRemoteMessageRouting(message);
      }
    });
  }

  //로컬알림설정
  void _initialization() async {
    AndroidInitializationSettings android = const AndroidInitializationSettings(
      "push_icon_white",
    );
    DarwinInitializationSettings ios = const DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    InitializationSettings settings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await _local.initialize(
      settings,
      //메시지를 눌렀을때 실행될 콜백함수를 넣어야함
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  //로컬 푸시
  void sendLocalPushFromFCM(RemoteMessage message) async {
    final Map<String, dynamic> fcmData = message.data;

    final String title = message.notification?.title ?? "새로운 알림";
    final String body = message.notification?.body ?? "알림 내용";

    //데이터 파싱
    final String payloadString = jsonEncode(fcmData);

    NotificationDetails details = const NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        // 채널 ID는 FCM과 Local Notification이 동일한 채널을 사용하도록 일관성 있게 유지하는 것이 좋음
        "fcm_notification_channel", //채널아이디
        "일반 알림", //채널이름
        channelDescription: "새로운 알림 및 업데이트", //채널설명
        importance: Importance.max, //중요도
        priority: Priority.high,
      ),
    );

    await _local.show(
      // 알림 ID는 고유해야 하기때문에 데이터베이스의 alarm_id를 사용
      int.tryParse(fcmData['alarm_id'] ?? '1') ?? 1,
      title,
      body,
      details,
      payload: payloadString,
    );

    print('로컬알림 발송. 데이터: $payloadString');
  }

  //백그라운드,또는 앱이 죽어있을때 메시지에서 라우팅
  void handleRemoteMessageRouting(RemoteMessage message) {
    final Map<String, dynamic> fcmData = message.data;
    final String alarmType = fcmData['alarm_type']?.toString() ?? 'UNKNOWN';

    //알림타입과 데이터를 통해 라우팅경로를 생성하고 푸시
    _deepLinkService.navigateFromNotification(alarmType, fcmData);
  }

  //로컬푸시를 눌렀을때
  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    final String? payload = notificationResponse.payload;

    if (payload != null && payload.isNotEmpty) {
      try {
        //데이터 파싱
        final Map<String, dynamic> fcmData = jsonDecode(payload);

        final String alarmType = fcmData['alarm_type'] ?? 'UNKNOWN';

        _deepLinkService.navigateFromNotification(alarmType, fcmData);
      } catch (e) {
        print('알림처리중 에러: $e');
      }
    }
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
