import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/DI/injection.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/result/result.dart';
import 'core/service/internal/deep_link_service.dart';
import 'core/service/internal/push_notification_service.dart';
import 'core/theme/app_theme.dart';
import 'feature/alarm/presentation/viewmodels/alarm_bloc.dart';
import 'feature/alarm/presentation/viewmodels/alarm_event.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'feature/home_widget/service/home_widget_service.dart';
import 'feature/schedule/domain/entities/schedule_entity.dart';
import 'feature/schedule/domain/usecases/get_user_schudule_usecase.dart';
import 'feature/setting/presentation/viewmodels/theme/theme_bloc.dart';
import 'feature/setting/presentation/viewmodels/theme/theme_event.dart';
import 'feature/trip/domain/usecases/get_my_trip_usecase.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await dotenv.load(fileName: "assets/config/.env");
  await configureDependencies();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  await configureDependencies();

  await _requestPermissions();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final pushService = GetIt.instance<PushNotificationService>();
  await pushService.initialize();

  final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    pushService.handleRemoteMessageRouting(initialMessage);
  }

  await _initHomeWidget();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<AuthProfileBloc>()),
        BlocProvider(
          create: (context) =>
              GetIt.instance<ThemeBloc>()..add(const LoadTheme()),
        ),
        BlocProvider(create: (context) => GetIt.instance<AlarmBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

// 위젯 딥링크 처리
Future<void> _initHomeWidget() async {
  await HomeWidget.setAppGroupId('group.com.team1113.mytravelfriend');

  // 앱이 위젯에서 실행된 경우
  try {
    final initialUri = await HomeWidget.initiallyLaunchedFromHomeWidget();
    if (initialUri != null) {
      debugPrint('Initial widget URI: $initialUri');
      _handleWidgetUri(initialUri);
    }
  } catch (e) {
    debugPrint('Error getting initial widget URI: $e');
  }

  // 앱 실행 중 위젯 클릭 처리
  HomeWidget.widgetClicked.listen((uri) {
    if (uri != null) {
      debugPrint('Widget clicked URI: $uri');
      _handleWidgetUri(uri);
    }
  });
}

// 위젯 URI를 DeepLinkService로 전달
void _handleWidgetUri(Uri uri) {
  final uriString = uri.toString();
  debugPrint('Handling widget URI: $uriString');

  final regex = RegExp(r'trip/(\d+)(/schedule)?');
  final match = regex.firstMatch(uriString);

  if (match != null) {
    final tripId = match.group(1);
    final isSchedule = match.group(2) != null;

    if (tripId != null) {
      final deepLinkService = GetIt.instance<DeepLinkService>();
      deepLinkService.navigateFromNotification(
        isSchedule ? 'WIDGET_SCHEDULE' : 'WIDGET_TRIP',
        {'trip_id': tripId},
      );
    }
  }
}

Future<void> _requestPermissions() async {
  final pushService = GetIt.instance<PushNotificationService>();
  await pushService.requestPermission();

  final cameraStatus = await Permission.camera.status;
  if (cameraStatus.isDenied) {
    await Permission.camera.request();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  DateTime? _lastRefreshDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkAndRefreshWidget();
    }
  }

  Future<void> _checkAndRefreshWidget() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (_lastRefreshDate != null &&
        _lastRefreshDate!.year == today.year &&
        _lastRefreshDate!.month == today.month &&
        _lastRefreshDate!.day == today.day) {
      return;
    }

    final authState = GetIt.instance<AuthProfileBloc>().state;
    if (authState is AuthProfileAuthenticated) {
      try {
        final userId = authState.userInfo.id!;
        final homeWidgetService = GetIt.instance<HomeWidgetService>();
        final getMyTripUseCase = GetIt.instance<GetMyTripUsecase>();
        final getUserScheduleUseCase = GetIt.instance<GetUserScheduleUseCase>();

        final tripsResult = await getMyTripUseCase(userId, 1);

        await tripsResult.when(
          success: (trips) async {
            if (trips.isEmpty) {
              await homeWidgetService.refreshAllWidgets();
              return;
            }

            final settings = await homeWidgetService.getSettings();
            final selectedTrip = homeWidgetService.selectTripForWidget(
              trips: trips,
              settings: settings,
            );

            if (selectedTrip != null) {
              final schedulesResult = await getUserScheduleUseCase(
                tripId: selectedTrip.id!,
                userId: userId,
              );

              final schedules = schedulesResult.when(
                success: (data) => data,
                failure: (_) => <ScheduleEntity>[],
              );

              await homeWidgetService.updateAllWidgets(
                trips: trips,
                userSchedules: schedules,
              );
            }
          },
          failure: (_) async {
            await homeWidgetService.refreshAllWidgets();
          },
        );

        _lastRefreshDate = today;
        debugPrint('Widget refreshed at: $today');
      } catch (e) {
        debugPrint('Widget refresh error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeBloc>().themeMode;

    return MaterialApp.router(
      routerConfig: AppRouter.instance.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      builder: (context, child) {
        return BlocListener<AuthProfileBloc, AuthProfileState>(
          listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
          listener: (context, state) {
            if (state is AuthProfileAuthenticated) {
              context.read<AlarmBloc>().add(
                AlarmEvent.startWatching(userId: state.userInfo.id!),
              );
              _checkAndRefreshWidget();
            } else if (state is AuthProfileUnauthenticated) {
              context.read<AlarmBloc>().add(const AlarmEvent.stopWatching());
            }
          },
          child: BlocBuilder<AuthProfileBloc, AuthProfileState>(
            builder: (context, authState) {
              return Stack(
                children: [
                  child ?? const SizedBox.shrink(),
                  if (authState is AuthProfileLoading)
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
