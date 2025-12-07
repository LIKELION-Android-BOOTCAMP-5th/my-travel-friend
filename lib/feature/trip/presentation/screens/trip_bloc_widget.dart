import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final authState = context.read<AuthProfileBloc>().state;

    late final int userId;

    if (authState is AuthProfileAuthenticated) {
      userId = authState.userInfo.id!;
    } else {
      // 로그인 상태가 아니라면 예외 처리
      return const Center(child: Text("로그인이 필요합니다"));
    }

    return BlocProvider(
      create: (_) {
        final bloc = sl<TripBloc>();
        bloc.add(TripEvent.getMyTrips(userId: userId));
        return bloc;
      },
      child: const _TripBlocScreen(),
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
      return const Center(child: Text("로그인이 필요합니다"));
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
