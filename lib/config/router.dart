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
import '../feature/diary/presentation/screens/diary/diary_bloc_widget.dart';
import '../feature/diary/presentation/viewmodels/diary/diary_bloc.dart';
import '../feature/friend/presentation/screen/friend_bloc_widget.dart';
import '../feature/friend/presentation/screen/friend_request_bloc_widget.dart';
import '../feature/friend/presentation/screen/recevice_list_bloc_widget.dart';
import '../feature/friend/presentation/screen/recevice_trip_bloc_widget.dart';
import '../feature/onboarding/presentation/screens/onboarding_bloc_widget.dart';
import '../feature/setting/presentation/screens/alarm/alarm_setting_bloc_widget.dart';
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
    redirect: (context, state) {
      final authState = GetIt.I<AuthProfileBloc>().state;
      final deepLinkService = GetIt.I<DeepLinkService>();

      // 1. 비인증 사용자 처리
      if (authState is AuthProfileUnauthenticated) {
        return state.matchedLocation == '/login' ? null : '/login';
      }

      // 2. 인증 로딩 중 (판단 유보)
      if (authState is AuthProfileInitial || authState is AuthProfileLoading) {
        return null;
      }

      // 3. 인증 완료 사용자
      if (authState is AuthProfileAuthenticated) {
        final target = deepLinkService.pendingPath;

        // [핵심] 딥링크 대기 중인 경로가 있다면 그곳으로 안내
        // 옵저버에서 지워주기 전까지는 target이 유지되므로 유연하게 대처 가능합니다.
        if (target != null && state.matchedLocation != target) {
          print("[Redirect] 딥링크 목적지로 경로 안내: $target");
          return target;
        }

        // 초기 진입로(/, /login, /splash)에 있을 때만 홈으로 보냄
        final initialPaths = ['/', '/login', '/splash'];
        if (initialPaths.contains(state.matchedLocation)) {
          print("[Redirect] 초기 진입로 감지, 홈으로 이동");
          return '/home';
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
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingBlocWidget(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => BlocProvider.value(
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
              final authState = context.read<AuthProfileBloc>().state;
              final userId = (authState is AuthProfileAuthenticated)
                  ? authState.userInfo.id!
                  : 0;
              return BlocProvider(
                create: (context) => GetIt.instance<CreateTripBloc>(),
                child: CreateTripBlocWidget(userId: userId),
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
        ],
      ),
    ],
  );
}
