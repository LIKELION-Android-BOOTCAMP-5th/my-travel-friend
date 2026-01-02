import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/service/internal/deep_link_service.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_list_screen.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_state.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/trip/trip_bloc.dart';

class TripBlocWidget extends StatefulWidget {
  const TripBlocWidget({super.key});

  @override
  State<TripBlocWidget> createState() => _TripBlocWidgetState();
}

class _TripBlocWidgetState extends State<TripBlocWidget> {
  late final TripBloc _tripBloc;
  bool _isTripDataFetched = false;

  @override
  void initState() {
    super.initState();
    _tripBloc = getIt<TripBloc>();

    _checkInitialAuthAndFetch();
  }

  void _checkInitialAuthAndFetch() {
    // context.read를 안전하게 호출하기 위해 microtask 사용
    //코드 실행 예약이라고 생각하면될거같습니다
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      final authState = context.read<AuthProfileBloc>().state;

      if (authState is AuthProfileAuthenticated && !_isTripDataFetched) {
        final userId = authState.userInfo.id!;

        print("여행정보 가져오기");
        _tripBloc.add(TripEvent.getMyTrips(userId: userId));
        _isTripDataFetched = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tripBloc,

      child: BlocListener<AuthProfileBloc, AuthProfileState>(
        listener: (context, authState) {
          if (authState is AuthProfileAuthenticated && !_isTripDataFetched) {
            final userId = authState.userInfo.id!;

            print("상태 변화 감지 후 여행 정보 로드 이벤트 추가");
            _tripBloc.add(TripEvent.getMyTrips(userId: userId));
            _isTripDataFetched = true;
          }
          // 로그아웃 시 플래그 초기화
          if (authState is AuthProfileUnauthenticated) {
            _isTripDataFetched = false;
          }
        },

        child: BlocListener<TripBloc, TripState>(
          listenWhen: (prev, curr) => prev.pageState != curr.pageState,
          listener: (context, state) {
            if (state.pageState == TripPageState.error) {
              ToastPop.show('오류가 발생했습니다');
            } else if (state.pageState == TripPageState.success) {
              ToastPop.show('처리되었습니다');
            }
          },

          child: BlocSelector<TripBloc, TripState, bool>(
            selector: (state) => state.pageState == TripPageState.loading,
            builder: (context, isLoading) {
              final authState = context.watch<AuthProfileBloc>().state;
              final isAuthenticated = authState is AuthProfileAuthenticated;

              final shouldShowOverlay = !isAuthenticated || isLoading;

              if (shouldShowOverlay) {
                return Stack(
                  children: [
                    const TripListScreen(), // 하위 위젯
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                );
              }

              return const TripListScreen();
            },
          ),
        ),
      ),
    );
  }
}
