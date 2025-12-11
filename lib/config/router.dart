import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_bloc_widget.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/setting/presentation/screens/permission/permission_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/create_trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_bloc.dart';
import 'package:my_travel_friend/splash.dart';
import 'package:my_travel_friend/temp_screen.dart';

import '../feature/alarm/presentation/screens/alarm_bloc_widget.dart';
import '../feature/checklist/presentation/screens/lists_bloc_widget.dart';
import '../feature/diary/domain/entities/diary_entity.dart';
import '../feature/diary/presentation/screens/diary/diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/edit_diary/edit_diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/new_diary/new_diary_bloc_widget.dart';
import '../feature/diary/presentation/viewmodels/diary/diary_bloc.dart';
import '../feature/diary/presentation/viewmodels/new_diary/new_diary_bloc.dart';
import '../feature/setting/presentation/screens/alarm/alarm_setting_bloc_widget.dart';
import '../feature/setting/presentation/screens/profile/profile_bloc_widget.dart';
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

      // 로그인 상태가 필요한 경로 목록
      const lockedPaths = [
        '/friend',
        '/setting',
        '/alarm',
        '/setting',
        '/diary',
        '/trip',
        '/home',
      ];

      final isGoingToLockedPath = lockedPaths.any(
        (path) => currentPath.startsWith(path),
      );

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
      GoRoute(path: '/', builder: (context, state) => const TempScreen()),

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
        builder: (context, state) => BlocProvider(
          //bloc 제공자
          create: (context) => GetIt.instance<TripBloc>(),
          child: const TripBlocWidget(),
        ),
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
        path: '/alarmSetting',
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
              return Center(child: Text('Trip $tripId Home'));
            },
          ),
          // [1] 여행 스케줄
          GoRoute(
            path: '/trip/:tripId/schedule',
            builder: (context, state) {
              final tripId = int.parse(state.pathParameters['tripId']!);
              return Center(child: Text('Trip $tripId Schedule'));
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
    ],
  );
}
