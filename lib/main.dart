import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/DI/injection.dart';
import 'package:my_travel_friend/theme/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/service/internal/push_notification_service.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //dotenv는di 등록이 안되므로 먼저 여기서 초기화
  await dotenv.load(fileName: "assets/config/.env");
  //DI관련
  await configureDependencies();
  print("Handling a background message: ${message.messageId}");
  // TODO: 백그라운드에서 실행시 로직 처리
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //dotenv는di 등록이 안되므로 먼저 여기서 초기화
  await dotenv.load(fileName: "assets/config/.env");
  //DI관련
  await configureDependencies();

  // 권한 요청
  await _requestPermissions();

  //백그라운드 핸들러
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiBlocProvider(
      providers: [
        //supabase listener를 통한 유저 객체 상태용 bloc
        BlocProvider(create: (context) => GetIt.instance<AuthProfileBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

// 앱 시작시 필요한 권한 요청
Future<void> _requestPermissions() async {
  // FCM 푸시 알림 권한
  final pushService = GetIt.instance<PushNotificationService>();
  await pushService.requestPermission();

  // 카메라 권한
  await Permission.camera.request();

  // 앨범/갤러리 권한
  await Permission.photos.request();

  // 저장 권한 (Android)
  await Permission.storage.request();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.instance.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
