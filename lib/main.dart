import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/DI/injection.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/service/internal/push_notification_service.dart';
import 'core/theme/app_theme.dart';
import 'feature/alarm/presentation/viewmodels/alarm_bloc.dart';
import 'feature/alarm/presentation/viewmodels/alarm_event.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'feature/setting/presentation/viewmodels/theme/theme_bloc.dart';
import 'feature/setting/presentation/viewmodels/theme/theme_event.dart';
import 'feature/setting/presentation/viewmodels/theme/theme_state.dart'
    hide AppTheme;

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

  final pushService = GetIt.instance<PushNotificationService>();
  //푸시메시지 초기화
  await pushService.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        //supabase listener를 통한 유저 객체 상태용 bloc
        BlocProvider(create: (context) => GetIt.instance<AuthProfileBloc>()),
        // [이재은] 앱 테마 관리용 bloc
        BlocProvider(
          create: (context) =>
              GetIt.instance<ThemeBloc>()..add(const LoadTheme()),
        ),
        // 알림 표시용 bloc
        BlocProvider(create: (context) => GetIt.instance<AlarmBloc>()),
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

  // 카메라 - 아직 안 물어본 경우만 요청
  final cameraStatus = await Permission.camera.status;
  if (cameraStatus.isDenied) {
    // 처음(아직 안 물어봄)일 때만
    await Permission.camera.request();
  }

  // 사진 - 아직 안 물어본 경우만 요청
  final photosStatus = await Permission.photos.status;
  if (photosStatus.isDenied) {
    await Permission.photos.request();
  }

  // Android만
  if (Platform.isAndroid) {
    final storageStatus = await Permission.storage.status;
    if (storageStatus.isDenied) {
      await Permission.storage.request();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.instance.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: context.read<ThemeBloc>().themeMode,

          builder: (context, child) {
            return BlocConsumer<AuthProfileBloc, AuthProfileState>(
              listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
              listener: (context, state) {
                if (state is AuthProfileAuthenticated) {
                  context.read<AlarmBloc>().add(
                    AlarmEvent.startWatching(userId: state.userInfo.id!),
                  );
                  AppRouter.instance.router.go('/home');
                }
                if (state is AuthProfileUnauthenticated) {
                  context.read<AlarmBloc>().add(
                    const AlarmEvent.stopWatching(),
                  );
                  AppRouter.instance.router.go('/login');
                }
              },
              builder: (context, authState) {
                // 로그아웃 중이면 로딩 오버레이
                if (authState is AuthProfileLoading) {
                  return Stack(
                    children: [
                      child ?? const SizedBox.shrink(),
                      Container(
                        color: Colors.black.withOpacity(0.3),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  );
                }
                return child ?? const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}
