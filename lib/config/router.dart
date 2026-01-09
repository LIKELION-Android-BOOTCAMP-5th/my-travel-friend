import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/config/router_observer.dart';
import 'package:my_travel_friend/config/router_refresh_stream.dart';
import 'package:my_travel_friend/core/service/internal/deep_link_service.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_bloc_widget.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import 'package:my_travel_friend/feature/schedule/presentation/screens/schedule_bloc_widget.dart';
import 'package:my_travel_friend/feature/setting/presentation/screens/menu/menu_bloc_widget.dart';
import 'package:my_travel_friend/feature/setting/presentation/screens/permission/permission_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/create_trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_home_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart';
import 'package:my_travel_friend/splash.dart';

import '../feature/alarm/presentation/screens/alarm_bloc_widget.dart';
import '../feature/chat/presentation/screens/chat_bloc_widget.dart';
import '../feature/checklist/presentation/screens/lists_bloc_widget.dart';
import '../feature/diary/domain/entities/diary_entity.dart';
import '../feature/diary/presentation/screens/diary/diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/edit_diary/edit_diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/new_diary/new_diary_bloc_widget.dart';
import '../feature/diary/presentation/viewmodels/diary/diary_bloc.dart';
import '../feature/diary/presentation/viewmodels/new_diary/new_diary_bloc.dart';
import '../feature/friend/presentation/screen/friend_bloc_widget.dart';
import '../feature/friend/presentation/screen/friend_request_bloc_widget.dart';
import '../feature/friend/presentation/screen/recevice_list_bloc_widget.dart';
import '../feature/friend/presentation/screen/recevice_trip_bloc_widget.dart';
import '../feature/onboarding/presentation/screens/onboarding_bloc_widget.dart';
import '../feature/onboarding/presentation/viewmodels/onboarding_bloc.dart';
import '../feature/onboarding/presentation/viewmodels/onboarding_state.dart';
import '../feature/schedule/domain/entities/schedule_entity.dart';
import '../feature/schedule/presentation/screens/create_schedule_bloc_widget.dart';
import '../feature/schedule/presentation/screens/edit_schedule_bloc_widget.dart';
import '../feature/schedule/presentation/screens/map_search_bloc_widget.dart';
import '../feature/schedule/presentation/widgets/route_type.dart';
import '../feature/setting/presentation/screens/alarm/alarm_setting_bloc_widget.dart';
import '../feature/setting/presentation/screens/home_widget/widget_settings_bloc_widget.dart';
import '../feature/setting/presentation/screens/profile/profile_bloc_widget.dart';
import '../feature/setting/presentation/screens/theme/theme_bloc_widget.dart';
import '../feature/trip/domain/entities/trip_entity.dart';
import '../feature/trip/presentation/screens/edit_trip_bloc_widget.dart';
import '../feature/trip/presentation/screens/trip_shell_scaffold.dart';
import '../feature/trip/presentation/viewmodels/trip_detail/trip_detail_bloc.dart';
import '../feature/trip/presentation/viewmodels/trip_detail/trip_detail_event.dart';

final getIt = GetIt.instance;

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  static AppRouter get instance => _instance;

  AppRouter._internal();

  late final GoRouter router = GoRouter(
    observers: [RouterObserver()],
    refreshListenable: Listenable.merge([
      GoRouterRefreshStream(GetIt.I<AuthProfileBloc>().stream),
      GetIt.I<
        DeepLinkService
      >(), // 딥링크 서비스 등록 (notifyListeners 호출 시 redirect 실행)
    ]),
    initialLocation: '/splash',

    // 예외 처리
    onException: (context, state, router) {
      debugPrint('[GoRouter Exception] ${state.uri}');

      // custom scheme이면 직접 네비게이션
      final uriString = state.uri.toString();
      if (uriString.contains('mytravelfriend://')) {
        final path = _parseWidgetScheme(uriString);
        if (path != null) {
          debugPrint('[GoRouter] Widget -> $path');
          // 직접 이동 (notifyListeners 사용 안 함)
          WidgetsBinding.instance.addPostFrameCallback((_) {
            router.go(path);
          });
        }
        return;
      }

      router.go('/home');
    },

    redirect: (context, state) {
      final authState = GetIt.I<AuthProfileBloc>().state;
      final deepLinkService = GetIt.I<DeepLinkService>();
      final onboardingState = GetIt.I<OnboardingBloc>().state;
      // 1. 비인증 사용자 처리
      if (authState is AuthProfileUnauthenticated) {
        // 1. 비로그인인데 온보딩도 안 봤다면? -> 무조건 온보딩이 1순위
        if (onboardingState.pageState != OnboardingPageState.completed) {
          return state.matchedLocation == '/onboarding' ? null : '/onboarding';
        }

        // 2. 비로그인인데 온보딩은 이미 봤다면? -> 로그인으로
        return state.matchedLocation == '/login' ? null : '/login';
      }

      // 2. 인증 로딩 중 (판단 유보)
      if (authState is AuthProfileInitial || authState is AuthProfileLoading) {
        return null;
      }

      // 3. 인증 완료 사용자
      if (authState is AuthProfileAuthenticated) {
        // 혹시라도 로그인은 됐는데 온보딩 기록이 없는 기기라면? (예외 처리)
        if (onboardingState.pageState != OnboardingPageState.completed) {
          return state.matchedLocation == '/onboarding' ? null : '/onboarding';
        }

        // 초기 진입로(/, /login, /splash)에 있을 때만 홈으로 보냄
        final initialPaths = ['/', '/login', '/splash'];
        final target = deepLinkService.pendingPath;
        if (initialPaths.contains(state.matchedLocation) && target == null) {
          print("[Redirect] 초기 진입로 감지, 홈으로 이동");
          return '/home';
        }

        // [핵심] 딥링크 대기 중인 경로가 있다면 그곳으로 안내
        // 옵저버에서 지워주기 전까지는 target이 유지되므로 유연하게 대처 가능합니다.
        if (target != null && state.matchedLocation != target) {
          print("[Redirect] 딥링크 목적지로 경로 안내: $target");
          return target;
        }
      }

      return null;
    },

    routes: [
      // --- 비인증 영역 ---
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => TripBlocWidget()),

      // 온보딩 화면 (새로 추가)
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingBlocWidget(),
      ),

      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => BlocProvider.value(
          //bloc 제공자
          value: getIt<AuthBloc>(),
          child: const AuthBlocWidget(),
        ),
      ),

      // --- 인증 영역 (Home 및 하위 계층) ---
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const TripBlocWidget(),
        routes: [
          // 여행 생성/수정
          GoRoute(
            path: 'trip/create',
            name: 'tripCreate',
            builder: (context, state) {
              debugPrint('🔥 [Router] tripCreate entered');
              debugPrint('🔥 [Router] extra = ${state.extra}');
              final authState = context.read<AuthProfileBloc>().state;
              final userId = (authState is AuthProfileAuthenticated)
                  ? authState.userInfo.id!
                  : 0;
              final extra = state.extra as Map<String, dynamic>?;
              final int? friendId = extra?['friendId'] as int?;

              debugPrint('🔥 tripCreate friendId = $friendId');
              return BlocProvider(
                create: (context) => GetIt.instance<CreateTripBloc>(),
                child: CreateTripBlocWidget(userId: userId, friendId: friendId),
              );
            },
          ),
          GoRoute(
            path: 'trip/edit',
            name: 'tripEdit',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              return EditTripBlocWidget(trip: extra['trip'] as TripEntity);
            },
          ),

          // 알림
          GoRoute(
            path: 'alarm',
            name: 'alarm',
            builder: (context, state) => const AlarmBlocWidget(),
          ),

          // 설정 계층
          GoRoute(
            path: 'setting',
            name: 'setting',
            builder: (context, state) => const MenuBlocWidget(),
            routes: [
              GoRoute(
                path: 'settingAlarm',
                name: 'settingAlarm',
                builder: (context, state) => const AlarmSettingBlocWidget(),
              ),
              GoRoute(
                path: 'profile',
                name: 'profile',
                builder: (context, state) => const ProfileBlocWidget(),
              ),
              GoRoute(
                path: 'permission',
                name: 'permission',
                builder: (context, state) => const PermissionBlocWidget(),
              ),
              GoRoute(
                path: 'theme',
                name: 'theme',
                builder: (context, state) => const ThemeBlocWidget(),
              ),
              GoRoute(
                path: 'widget',
                name: 'widget',
                builder: (context, state) => const WidgetSettingsBlocWidget(),
              ),
              // 친구 계층
              GoRoute(
                path: 'friend',
                name: 'friend',
                builder: (context, state) {
                  final authState = context.read<AuthProfileBloc>().state;
                  return FriendBlocWidget(
                    userId: (authState is AuthProfileAuthenticated)
                        ? authState.userInfo.id!
                        : 0,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'friend-request',
                    name: 'friendRequest',
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;
                      return FriendRequestBlocWidget(
                        requestId: extra['requestId'] as int,
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'friend-receive',
                name: 'friendReceive',
                builder: (context, state) => BlocProvider(
                  create: (context) => GetIt.instance<FriendRequestBloc>(),
                  child: ReceviceListBlocWidget(
                    userId:
                        (context.read<AuthProfileBloc>().state
                                as AuthProfileAuthenticated)
                            .userInfo
                            .id!,
                  ),
                ),
              ),
              GoRoute(
                path: 'receive_trip',
                name: 'tripReceive',
                builder: (context, state) {
                  final authState = context.read<AuthProfileBloc>().state;
                  final userId = (authState is AuthProfileAuthenticated)
                      ? authState.userInfo.id!
                      : 0;
                  return ReceviceTripBlocWidget(myId: userId);
                },
              ),
            ],
          ),

          // 여행 상세 (ShellRoute)
          ShellRoute(
            builder: (context, state, child) {
              final tripId =
                  int.tryParse(state.pathParameters['tripId'] ?? '0') ?? 0;
              final tripDetailBloc = getIt<TripDetailBloc>();
              tripDetailBloc.add(
                TripDetailEvent.loadTripDetail(tripId: tripId),
              );
              return BlocProvider(
                create: (context) => tripDetailBloc,
                child: TripShellScaffold(child: child),
              );
            },
            routes: [
              GoRoute(
                path: 'trip/:tripId/trip_home',
                name: 'tripHome',
                builder: (context, state) => TripHomeBlocWidget(
                  tripId: int.parse(state.pathParameters['tripId']!),
                ),
              ),
              GoRoute(
                path: 'trip/:tripId/schedule',
                name: 'tripSchedule',
                builder: (context, state) => ScheduleBlocWidget(
                  tripId: int.parse(state.pathParameters['tripId']!),
                ),
              ),
              GoRoute(
                path: 'trip/:tripId/checklist',
                name: 'tripChecklist',
                builder: (context, state) => ListsBlocWidget(
                  tripId: int.parse(state.pathParameters['tripId']!),
                ),
              ),
              GoRoute(
                path: 'trip/:tripId/diary',
                name: 'tripDiary',
                builder: (context, state) => BlocProvider(
                  create: (context) => GetIt.instance<DiaryBloc>(),
                  child: DiaryBlocWidget(
                    tripId: int.parse(state.pathParameters['tripId']!),
                  ),
                ),
              ),
              GoRoute(
                path: 'trip/:tripId/talk',
                name: 'tripTalk',
                builder: (context, state) {
                  final tripId = int.parse(state.pathParameters['tripId']!);
                  return ChatBlocWidget(tripId: tripId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/trip/:tripId/diary/new',
            name: 'tripDiaryNew',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return BlocProvider(
                create: (context) => GetIt.instance<NewDiaryBloc>(),
                child: NewDiaryBlocWidget(tripId: tripId),
              );
            },
          ),
          GoRoute(
            path: '/trip/:tripId/diary/edit',
            name: 'tripDiaryEdit',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final diary = extra['diary'] as DiaryEntity;
              return EditDiaryBlocWidget(diary: diary);
            },
          ),
          GoRoute(
            path: '/trip/:tripId/map-search',
            name: 'tripMapSearch',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);

              final extra = state.extra as Map<String, dynamic>?;

              final mode =
                  extra?['mode'] as MapSearchMode? ?? MapSearchMode.aiSearch;

              return MapSearchBlocWidget(
                tripId: tripId,
                mode: mode,
                initialLat: extra?['lat'],
                initialLng: extra?['lng'],
                initialAddress: extra?['address'],
              );
            },
          ),
          GoRoute(
            path: '/trip/:tripId/schedule/create',
            name: 'ScheduleCreate',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);

              return CreateScheduleBlocWidget(tripId: tripId);
            },
          ),
          GoRoute(
            path: '/trip/:tripId/schedule/edit',
            name: 'ScheduleEdit',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              final schedule = state.extra as ScheduleEntity;

              return EditScheduleBlocWidget(tripId: tripId, schedule: schedule);
            },
          ),
        ],
      ),
    ],
  );

  // 위젯 scheme을 경로로 변환
  static String? _parseWidgetScheme(String uriString) {
    final regex = RegExp(r'trip/(\d+)(/schedule)?');
    final match = regex.firstMatch(uriString);

    if (match != null) {
      final tripId = match.group(1);
      final isSchedule = match.group(2) != null;

      if (tripId != null) {
        if (isSchedule) {
          return '/home/trip/$tripId/schedule';
        } else {
          return '/home/trip/$tripId/trip_home';
        }
      }
    }
    return null;
  }
}
