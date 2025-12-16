import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_list_screen.dart'
    show TripListScreen;
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_state.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/trip/trip_bloc.dart';

class TripBlocWidget extends StatelessWidget {
  const TripBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TripBloc _tripBloc = getIt<TripBloc>();
    return BlocProvider.value(
      value: _tripBloc, // GetIt에서 가져온 인스턴스를 하위 트리에 제공
      child: BlocListener<AuthProfileBloc, AuthProfileState>(
        listener: (context, authState) {
          // 1. AuthProfileBloc의 상태 변화를 관찰
          if (authState is AuthProfileAuthenticated) {
            final userId = authState.userInfo.id!;

            // 2. 상태가 Authenticated일 때만 안전하게 userId를 사용하여 이벤트 실행
            _tripBloc.add(TripEvent.getMyTrips(userId: userId));
          }
        },
        // 3. 실제 UI를 담당하는 위젯
        // 이 위젯은 TripBloc의 상태 변화만 관찰하면 됩니다.
        child: const _TripBlocScreen(),
      ),
    );
  }
}

class _TripBlocScreen extends StatelessWidget {
  const _TripBlocScreen();

  @override
  Widget build(BuildContext context) {
    ///  AuthBloc에서 로그인된 사용자 정보 가져오기
    final authState = context.watch<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return Stack(
        children: [
          TripListScreen(),
          Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    final userId = authState.userInfo.id!;

    return BlocConsumer<TripBloc, TripState>(
      listener: (context, state) {
        ///  토스트 처리
        if (state.pageState == TripPageState.error) {
          ToastPop.show('오류가 발생했습니다');
        } else if (state.pageState == TripPageState.success) {
          ToastPop.show('처리되었습니다');
        }

        /// 여행 선택 시 이동 처리 (나중에 사용 가능)
      },

      builder: (context, state) {
        if (state.pageState == TripPageState.loading) {
          return Stack(
            children: [
              TripListScreen(),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return TripListScreen();
      },
    );
  }
}
