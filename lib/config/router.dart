import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_bloc_widget.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_bloc.dart';
import 'package:my_travel_friend/splash.dart';
import 'package:my_travel_friend/temp_screen.dart';

import '../feature/diary/presentation/screens/diary_bloc_widget.dart';
import '../feature/diary/presentation/viewmodels/diary_bloc.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  static AppRouter get instance => _instance;

  AppRouter._internal();

  // 🔔 GoRouter 인스턴스 정의
  final GoRouter router = GoRouter(
    initialLocation: '/',

    /*
    // AuthManager가 상태 변경을 알릴 때마다 redirect를 다시 평가하도록 설정
    refreshListenable: AuthManager.shared,
    redirect: (context, state) {
      final isLoggedIn = AuthManager.shared.userInfo != null;
      final currentPath = state.matchedLocation;

      // 1. 초기화 대기 및 스플래시 처리 (AuthManager 초기화가 완료될 때까지 대기)
      if (!AuthManager.shared.isInitialized || currentPath == '/splash') {
        return null;
      }

      // 로그인 상태가 필요한 경로 목록
      final lockedPaths = const [
        '/friend',
        '/my-feed',
        '/setting',
        '/post_detail_page',
        '/alarm_list_page',
        '/setting_alarm_page',
        // '/post_detail_page'와 같이 앱바가 없는 전체 화면 경로도 포함
      ];

      final isGoingToLockedPath = lockedPaths.any((path) => currentPath.startsWith(path));

      // 2. 미인증 시 접근 불가 경로 차단
      if (!isLoggedIn && isGoingToLockedPath) {
        return '/login';
      }

      // 3. 인증 완료 시 로그인/온보딩 화면 접근 차단 (선택 사항)
      // 로그인했는데 로그인/온보딩 화면으로 가려고 할 때 홈으로 돌려보냄
      final isGoingToAuthPath = currentPath == '/' || currentPath == '/login';
      if (isLoggedIn && isGoingToAuthPath) {
        return '/home';
      }

      return null;
    },*/
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
          create: (context) => GetIt.instance<AuthBloc>(),
          child: const AuthBlocWidget(),
        ),
      ),
      GoRoute(
        path: '/diary',
        builder: (context, state) => BlocProvider(
          //bloc 제공자
          create: (context) => GetIt.instance<DiaryBloc>(),
          child: const DiaryBlocWidget(tripId: 1, userId: 1),
        ),
      ),
      /*
      // Shell Route: 앱바 + 하단 네비게이션이 있는 메인 구조
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          // 1. 홈 탭 (/home)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  // ... (topicId 파싱 로직 유지)
                  final topicIdString = state.uri.queryParameters['topicId'];
                  final topicId = topicIdString != null ? int.tryParse(topicIdString) : null;
                  return HomeScreen(key: ValueKey(topicId), topicId: topicId);
                },
                routes: [
                  // /home/feed/:id (홈 탭 내 피드)
                  GoRoute(
                    path: 'feed/:id',
                    builder: (context, state) {
                      final userId = int.parse(state.pathParameters['id']!);
                      return ChangeNotifierProvider(
                        create: (_) => FeedViewModel(),
                        child: FeedScreen(userId: userId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // 2. 친구 탭 (/friend) - (구조 유지)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/friend',
                builder: (context, state) {
                  return ChangeNotifierProvider(
                    create: (_) => FriendViewModel(),
                    child: FriendScreen(),
                  );
                },
                routes: [
                  // /friend/feed/:id (친구 탭 내 피드)
                  GoRoute(
                    path: 'feed/:id',
                    builder: (context, state) {
                      final userId = int.parse(state.pathParameters['id']!);
                      return ChangeNotifierProvider(
                        create: (_) => FeedViewModel(),
                        child: FeedScreen(userId: userId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // 3. 내 피드 탭 (/my-feed)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-feed',
                builder: (context, state) {
                  final loginUserId = AuthManager.shared.userInfo?.id ?? 0;
                  return ChangeNotifierProvider(
                    create: (_) => FeedViewModel(),
                    child: FeedScreen(userId: loginUserId),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'report/:postId', // /my-feed/report/:postId
                    builder: (context, state) {
                      final postId = int.parse(state.pathParameters['postId']!);
                      return PostReportScreen(postId: postId);
                    },
                  ),
                ],
              ),
            ],
          ),
          // 4. 설정 탭 (/setting)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/setting',
                builder: (context, state) => SettingScreen(),
              ),
            ],
          ),
        ],
      ),*/

      /* GoRoute(
        path: '/post_detail_page/:id',
        builder: (context, state) {
          final postId = int.parse(state.pathParameters['id']!);
          return PostDetailScreen(postId: postId);
        },
        // 💡 Nested GoRoute를 사용하여 댓글/다른 서브 페이지를 처리하기 용이
        // routes: [ GoRoute(...) ]
      ),
      GoRoute(
        path: '/alarm_list_page',
        builder: (context, state) => AlarmListScreen(),
      ),
      GoRoute(
        path: '/setting_alarm_page',
        builder: (context, state) => SettingAlarmScreen(),
      ),*/
    ],
  );
}
