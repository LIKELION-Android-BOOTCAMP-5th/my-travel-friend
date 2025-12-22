import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
import '../feature/schedule/domain/entities/schedule_entity.dart';
import '../feature/schedule/presentation/screens/create_schedule_bloc_widget.dart';
import '../feature/schedule/presentation/screens/edit_schedule_bloc_widget.dart';
import '../feature/schedule/presentation/screens/map_search_bloc_widget.dart';
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

  final GoRouter router = GoRouter(
    initialLocation: '/splash',

    redirect: (BuildContext context, GoRouterState state) {
      // AuthProfileBloc의 상태를 GetIt에서 가져와서 확인
      final AuthProfileState authState = getIt<AuthProfileBloc>().state;
      final bool isLoggedIn = authState is AuthProfileAuthenticated;
      final currentPath = state.matchedLocation;

      if (authState is AuthProfileLoading || currentPath == '/splash') {
        return null;
      }

      if (authState is AuthProfileInitial) {
        return '/splash';
      }

      // 로그인 상태가 필요한 경로 목록
      const lockedPaths = [
        '/friend',
        '/setting',
        '/alarm',
        '/diary',
        '/trip',
        '/home',
      ];

      final isGoingToLockedPath = lockedPaths.any(
        (path) => currentPath.startsWith(path),
      );

      // 초기 상태거나 로딩 중이면 스플래시로
      if (authState is AuthProfileInitial || authState is AuthProfileLoading) {
        return '/splash';
      }

      // 2. 미인증 시 접근 불가 경로 차단
      if (!isLoggedIn && isGoingToLockedPath) {
        return '/login';
      }

      // 3. 인증 완료 시 로그인/온보딩 화면 접근 차단
      final isGoingToAuthPath =
          currentPath == '/onboarding' || currentPath == '/login';
      if (isLoggedIn && isGoingToAuthPath) {
        return '/home';
      }

      return null;
    },

    routes: [
      // 기본 라우트
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => TripBlocWidget()),

      // 온보딩 화면 (새로 추가)
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingBlocWidget(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider.value(
          //bloc 제공자
          value: getIt<AuthBloc>(),
          child: const AuthBlocWidget(),
        ),
      ),

      // 앱 홈
      GoRoute(
        path: '/home',
        builder: (context, state) => const TripBlocWidget(),
      ),

      // Trip 생성 /수정
      GoRoute(
        path: '/trip/create',
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
        path: '/trip/edit',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final trip = extra['trip'] as TripEntity;

          return EditTripBlocWidget(trip: trip);
        },
      ),
      // 설정 관련
      GoRoute(
        path: '/alarm',
        builder: (context, state) => const AlarmBlocWidget(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => const MenuBlocWidget(),
      ),
      GoRoute(
        path: '/setting/alarm',
        builder: (context, state) => const AlarmSettingBlocWidget(),
      ),
      GoRoute(
        path: '/setting/profile',
        builder: (context, state) => const ProfileBlocWidget(),
      ),
      GoRoute(
        path: '/setting/permission',
        builder: (context, state) => const PermissionBlocWidget(),
      ),
      GoRoute(
        path: '/setting/theme',
        builder: (context, state) => const ThemeBlocWidget(),
      ),
      GoRoute(
        path: '/setting/friend',
        builder: (context, state) {
          final authState = context.read<AuthProfileBloc>().state;
          final userId = (authState is AuthProfileAuthenticated)
              ? authState.userInfo.id!
              : 0;
          return FriendBlocWidget(userId: userId);
        },
      ),
      GoRoute(
        path: '/setting/friend/friend-request',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final requestId = extra['requestId'] as int;
          return FriendRequestBlocWidget(requestId: requestId);
        },
      ),
      GoRoute(
        path: '/setting/friend_recevice',
        builder: (context, state) {
          final authState = context.read<AuthProfileBloc>().state;
          final userId = (authState is AuthProfileAuthenticated)
              ? authState.userInfo.id!
              : 0;

          return BlocProvider(
            create: (context) => GetIt.instance<FriendRequestBloc>(),
            child: ReceviceListBlocWidget(userId: userId),
          );
        },
      ),
      GoRoute(
        path: '/setting/recevice_trip',
        builder: (context, state) {
          final authState = context.read<AuthProfileBloc>().state;
          final userId = (authState is AuthProfileAuthenticated)
              ? authState.userInfo.id!
              : 0;
          return ReceviceTripBlocWidget(myId: userId);
        },
      ),
      // Trip ShellRoute
      ShellRoute(
        builder: (context, state, child) {
          final tripIdStr = state.pathParameters['tripId'] ?? '0';
          final tripId = int.tryParse(tripIdStr) ?? 0;

          final tripDetailBloc = getIt<TripDetailBloc>();

          tripDetailBloc.add(TripDetailEvent.loadTripDetail(tripId: tripId));

          return BlocProvider(
            create: (context) => tripDetailBloc,
            child: TripShellScaffold(child: child),
          );
        },
        routes: [
          // [0] 여행 홈
          GoRoute(
            path: '/trip/:tripId/trip_home',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return TripHomeBlocWidget(tripId: tripId);
            },
          ),

          // [1] 여행 스케줄
          GoRoute(
            path: '/trip/:tripId/schedule',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return ScheduleBlocWidget(tripId: tripId);
            },
          ),

          // [2] 여행 체크리스트
          GoRoute(
            path: '/trip/:tripId/checklist',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return ListsBlocWidget(tripId: tripId);
            },
          ),
          // [3] 여행 다이어리
          GoRoute(
            path: '/trip/:tripId/diary',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return BlocProvider(
                //bloc 제공자
                create: (context) => GetIt.instance<DiaryBloc>(),
                child: DiaryBlocWidget(tripId: tripId),
              );
            },
          ),
          // [4] 여행 톡톡
          GoRoute(
            path: '/trip/:tripId/talk',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return ChatBlocWidget(tripId: tripId);
            },
          ),
        ],
      ),
      // [3-1] 다이어리 생성 (쉘라우터 밖)
      GoRoute(
        path: '/diary/new/:tripId',
        builder: (context, state) {
          final tripId = int.parse(state.pathParameters['tripId']!);
          return BlocProvider(
            create: (context) => GetIt.instance<NewDiaryBloc>(),
            child: NewDiaryBlocWidget(tripId: tripId),
          );
        },
      ),
      // [3-2] 다이어리 수정 (쉘라우터 밖)
      GoRoute(
        path: '/diary/edit/:tripId',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final diary = extra['diary'] as DiaryEntity;
          return EditDiaryBlocWidget(diary: diary);
        },
      ),
      GoRoute(
        path: '/schedule/create/:tripId',
        builder: (context, state) {
          final tripId = int.parse(state.pathParameters['tripId']!);

          return CreateScheduleBlocWidget(tripId: tripId);
        },
      ),
      GoRoute(
        path: '/schedule/edit/:tripId',
        builder: (context, state) {
          final tripId = int.parse(state.pathParameters['tripId']!);
          final schedule = state.extra as ScheduleEntity;
          return EditScheduleBlocWidget(schedule: schedule, tripId: tripId);
        },
      ),
      GoRoute(
        path: '/trip/:tripId/map-search',
        builder: (context, state) {
          final tripId = int.parse(state.pathParameters['tripId']!);

          final extra = state.extra as Map<String, dynamic>?;

          return MapSearchBlocWidget(
            tripId: tripId,
            initialLat: extra?['lat'],
            initialLng: extra?['lng'],
            initialAddress: extra?['address'],
          );
        },
      ),
    ],
  );
}
