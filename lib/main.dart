import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
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

// 위젯에서 앱 실행 시 pending 경로 저장 (URI 대신 경로 문자열)
String? _pendingWidgetPath;

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

  // 위젯 딥링크 초기화
  await _initHomeWidget();

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

// 위젯 딥링크 처리
Future<void> _initHomeWidget() async {
  await HomeWidget.setAppGroupId('group.com.team1113.mytravelfriend');

  // 앱이 위젯에서 실행된 경우 - 경로만 저장 (네비게이션 X)
  try {
    final initialUri = await HomeWidget.initiallyLaunchedFromHomeWidget();
    if (initialUri != null) {
      debugPrint('Initial widget URI: $initialUri');
      _pendingWidgetPath = _parseWidgetUri(initialUri);
      debugPrint('Pending widget path: $_pendingWidgetPath');
    }
  } catch (e) {
    debugPrint('Error getting initial widget URI: $e');
  }

  // 앱 실행 중 위젯 클릭 처리
  HomeWidget.widgetClicked.listen((uri) {
    if (uri != null) {
      debugPrint('Widget clicked URI: $uri');
      final path = _parseWidgetUri(uri);
      if (path != null) {
        _navigateToPath(path);
      }
    }
  });
}

// URI를 경로로 변환 (네비게이션 없이)
String? _parseWidgetUri(Uri uri) {
  final uriString = uri.toString();
  debugPrint('Parsing widget URI: $uriString');

  // mytravelfriend://trip/47 -> /trip/47/trip_home
  // mytravelfriend://trip/47/schedule -> /trip/47/schedule
  final regex = RegExp(r'trip/(\d+)(/schedule)?');
  final match = regex.firstMatch(uriString);

  if (match != null) {
    final tripId = match.group(1);
    final isSchedule = match.group(2) != null;

    if (tripId != null) {
      if (isSchedule) {
        return '/trip/$tripId/schedule';
      } else {
        return '/trip/$tripId/trip_home';
      }
    }
  }
  return null;
}

// 실제 네비게이션 수행
void _navigateToPath(String path) {
  try {
    debugPrint('Navigating to: $path');
    AppRouter.instance.router.go(path);
  } catch (e) {
    debugPrint('Navigation error: $e');
  }
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

                  // 인증 완료 후 pending 경로가 있으면 해당 페이지로 이동
                  if (_pendingWidgetPath != null) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      _navigateToPath(_pendingWidgetPath!);
                      _pendingWidgetPath = null;
                    });
                  } else {
                    AppRouter.instance.router.go('/home');
                  }
                }
                if (state is AuthProfileUnauthenticated) {
                  context.read<AlarmBloc>().add(
                    const AlarmEvent.stopWatching(),
                  );
                  AppRouter.instance.router.go('/login');
                }
              },
              builder: (context, authState) {
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
