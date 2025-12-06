import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_list_screen.dart'
    show TripListScreen;

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/trip_bloc.dart';
import '../viewmodels/trip_event.dart';
import '../viewmodels/trip_state.dart';

class TripBlocWidget extends StatelessWidget {
  final int userId;

  const TripBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<TripBloc>();
        bloc.add(TripEvent.getMyTrips(userId: userId));
        return bloc;
      },
      child: _TripBlocConsumer(userId: userId),
    );
  }
}

class _TripBlocConsumer extends StatelessWidget {
  final int userId;

  const _TripBlocConsumer({required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripBloc, TripState>(
      listener: (context, state) {
        // ===== Toast 처리 =====
        if (state.pageState == TripPageState.error) {
          ToastPop.show('오류가 발생했습니다');
        } else if (state.pageState == TripPageState.success) {
          ToastPop.show('처리되었습니다');
        }

        // ===== 여행 선택 시 상세 화면으로 이동 =====
        /*
  if (state.selectedTrip != null &&
      state.pageState == TripPageState.loaded) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TripMainHomePage(trip: state.selectedTrip!),
      ),
    );

    // 선택 초기화 (중복 이동 방지)
    context.read<TripBloc>().add(const TripEvent.createNewTrip());
  }
  */
      },

      builder: (context, state) {
        if (state.pageState == TripPageState.loading) {
          return Stack(
            children: [
              TripListScreen(userId: userId),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return TripListScreen(userId: userId);
      },
    );
  }
}
