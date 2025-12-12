import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/bottom_navigation.dart';
import '../../../../core/widget/bottom_sheat.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../domain/entities/trip_entity.dart';
import '../viewmodels/trip_detail/trip_detail_bloc.dart';
import '../viewmodels/trip_detail/trip_detail_event.dart';
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

    return BlocConsumer<TripDetailBloc, TripDetailState>(
      listenWhen: (prev, curr) => prev.pageState != curr.pageState,
      listener: (context, state) {
        // 여행 포기 성공 시
        if (state.pageState == TripDetailPageState.left) {
          ToastPop.show('여행을 포기했습니다');
          context.go('/home');
        }
      },
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
                    onPressed: () => context.go('/home'),
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
              onTap: () => context.go('/home'),
            ),
            actions: [
              Button(
                icon: Icon(AppIcon.threeDots),
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                onTap: () => _showBottomSheet(context, trip),
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

  // 바텀시트 오픈
  void _showBottomSheet(BuildContext context, TripEntity trip) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) return;

    final userId = authState.userInfo.id!;

    CommonBottomSheet.show(
      context,
      sheetTitle: "여행 관리",
      actions: [
        BottomSheetAction(
          icon: Icon(AppIcon.edit),
          iconBgColor: AppColors.primaryLight,
          title: "여행계획 수정하기",
          onTap: () async {
            // push 결과로 받기
            final result = await context.push<bool>(
              '/trip/edit',
              extra: {'trip': trip},
            );

            // 수정 완료 시 새로고침
            if (result == true && context.mounted) {
              context.read<TripDetailBloc>().add(
                const TripDetailEvent.refreshTripDetail(),
              );
            }
          },
        ),
        BottomSheetAction(
          icon: Icon(AppIcon.delete),
          iconBgColor: AppColors.secondary,
          title: "여행 포기하기",
          onTap: () {
            _showLeavePopUp(context, trip, userId);
          },
        ),
      ],
    );
  }

  // 여행 포기 PopUp
  void _showLeavePopUp(BuildContext context, TripEntity trip, int userId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopUpBox(
        title: "여행을 포기하시겠어요?",
        message: "참여 중인 여행에서 제외됩니다.",
        rightText: "포기하기",
        onRight: () {
          context.read<TripDetailBloc>().add(
            TripDetailEvent.leaveTrip(tripId: trip.id!, userId: userId),
          );
        },
      ),
    );
  }
}
