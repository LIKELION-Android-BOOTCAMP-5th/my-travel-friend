import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/bottom_navigation.dart';
import '../../../../core/widget/button.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/trip_detail/trip_detail_bloc.dart';
import '../viewmodels/trip_detail/trip_detail_state.dart';
import 'edit_trip_screen.dart';

// [이재은] Trip 공통 Shell (AppBar + BottomNav)
class TripShellScaffold extends StatelessWidget {
  final Widget child;

  const TripShellScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocBuilder<TripDetailBloc, TripDetailState>(
      builder: (context, state) {
        // 로딩 중
        if (state.pageState == TripDetailPageState.loading ||
            state.pageState == TripDetailPageState.initial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 에러
        if (state.pageState == TripDetailPageState.error) {
          return Scaffold(
            appBar: const CustomButtonAppBar(title: '오류'),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('오류: ${state.errorMessage}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/mainHome'),
                    child: const Text('홈으로 돌아가기'),
                  ),
                ],
              ),
            ),
          );
        }

        // trip 없으면 로딩
        final trip = state.trip;
        if (trip == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 정상
        final tripId = trip.id!;
        final currentIndex = _getSelectedIndex(context);

        return Scaffold(
          appBar: CustomButtonAppBar(
            title: trip.title ?? '여행',
            subtitle: "${formatDate(trip.startAt)} - ${formatDate(trip.endAt)}",
            leading: Button(
              width: 40,
              height: 40,
              icon: Icon(AppIcon.back),
              contentColor: isDark ? colorScheme.onSurface : AppColors.light,
              borderRadius: 20,
              onTap: () => context.pop(),
            ),
            actions: [
              Button(
                icon: Icon(AppIcon.threeDots),
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                onTap: () {},
                width: 40,
                height: 40,
                borderRadius: 20,
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigation(
            currentIndex: currentIndex,
            onTap: (index) => _onNavTap(context, index, tripId),
          ),
        );
      },
    );
  }

  // 현재 경로에서 선택된 인덱스 계산
  int _getSelectedIndex(BuildContext context) {
    final path = GoRouterState.of(context).matchedLocation;

    if (path.contains('/home')) return 0;
    if (path.contains('/schedule')) return 1;
    if (path.contains('/checklist')) return 2;
    if (path.contains('/diary')) return 3;
    if (path.contains('/talk')) return 4;

    return 0;
  }

  // 네비게이션 탭 클릭 처리
  void _onNavTap(BuildContext context, int index, int tripId) {
    final routes = [
      '/trip/$tripId/home',
      '/trip/$tripId/schedule',
      '/trip/$tripId/checklist',
      '/trip/$tripId/diary',
      '/trip/$tripId/talk',
    ];

    if (index < routes.length) {
      context.go(routes[index]);
    }
  }
}
