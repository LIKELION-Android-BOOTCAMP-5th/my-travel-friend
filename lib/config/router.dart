import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_bloc_widget.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth/auth_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/create_trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_bloc_widget.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_bloc.dart';
import 'package:my_travel_friend/splash.dart';
import 'package:my_travel_friend/temp_screen.dart';

import '../feature/alarm/presentation/screens/alarm_bloc_widget.dart';
import '../feature/checklist/presentation/screens/lists_bloc_widget.dart';
import '../feature/diary/domain/entities/diary_entity.dart';
import '../feature/diary/presentation/screens/diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/edit_diary_bloc_widget.dart';
import '../feature/diary/presentation/screens/new_diary_bloc_widget.dart';
import '../feature/diary/presentation/viewmodels/diary_bloc.dart';
import '../feature/diary/presentation/viewmodels/new_diary_bloc.dart';
import '../feature/setting/presentation/screens/alarm_setting_bloc_widget.dart';
import '../feature/setting/presentation/screens/profile_bloc_widget.dart';
import '../feature/trip/domain/entities/trip_entity.dart';
import '../feature/trip/presentation/screens/edit_trip_bloc_widget.dart';

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
        '/alarm_list_page',
        '/setting_alarm_page',
        '/diary',
        '/diary/new',
        '/diary/edit',
        '/mainHome',
        '/alarm',
        '/checklist',
        '/profile',
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
        return '/mainHome';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => const TempScreen()),

      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          //bloc 제공자
          create: (context) => getIt<AuthBloc>(),
          child: const AuthBlocWidget(),
        ),
      ),

      GoRoute(
        path: '/mainHome',
        builder: (context, state) => BlocProvider(
          //bloc 제공자
          create: (context) => GetIt.instance<TripBloc>(),
          child: const TripBlocWidget(),
        ),
      ),
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
      GoRoute(
        path: '/diary',
        builder: (context, state) => BlocProvider(
          //bloc 제공자
          create: (context) => GetIt.instance<DiaryBloc>(),
          child: const DiaryBlocWidget(tripId: 1),
        ),
      ),

      GoRoute(
        path: '/diary/new',
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.instance<NewDiaryBloc>(),
          child: const NewDiaryBlocWidget(tripId: 1),
        ),
      ),
      GoRoute(
        path: '/diary/edit',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final diary = extra['diary'] as DiaryEntity;
          return EditDiaryBlocWidget(diary: diary);
        },
      ),
      GoRoute(
        path: '/alarm',
        builder: (context, state) => const AlarmBlocWidget(),
      ),
      GoRoute(
        path: '/alarmSetting',
        builder: (context, state) => const AlarmSettingBlocWidget(),
      ),
      GoRoute(
        path: '/checklist',
        builder: (context, state) => const ListsBlocWidget(tripId: 1),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileBlocWidget(),
      ),
    ],
  );
}
