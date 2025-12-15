import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/toast_pop.dart';
import 'package:my_travel_friend/feature/schedule/presentation/screens/schedule_screen.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/schedule/schedule_state.dart';

import '../../../../core/DI/injection.dart';
import '../viewmodels/schedule/schedule_bloc.dart';
import '../viewmodels/schedule/schedule_event.dart';

class ScheduleBlocWidget extends StatelessWidget {
  final int tripId;

  const ScheduleBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<ScheduleBloc>();
        bloc.add(ScheduleEvent.fetchSchedules(tripId: tripId));

        return bloc;
      },
      child: _ScheduleBlocContent(tripId: tripId),
    );
  }
}

class _ScheduleBlocContent extends StatelessWidget {
  final int tripId;

  const _ScheduleBlocContent({required this.tripId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        // 성공 / 에러 메시지
        if (state.pageState == SchedulepageState.error) {
          ToastPop.show(state.message ?? "오류 발생");
        } else if (state.pageState == SchedulepageState.success) {
          ToastPop.show("처리되었습니다");
        }

        // 화면 이동
        if (state.navigateToCreate) {
          context.push('/schedule/create/$tripId');

          context.read<ScheduleBloc>().add(
            const ScheduleEvent.resetNavigation(),
          );
        }

        if (state.navigateToEdit) {
          final schedule = state.schedules.firstWhere(
            (e) => e.id == state.selectedCategoryId,
          );
          context.push('/schedule/edit?scheduleId=${schedule.id}');
          context.read<ScheduleBloc>().add(
            const ScheduleEvent.resetNavigation(),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.pageState == SchedulepageState.loading;

        return Stack(
          children: [
            ScheduleScreen(tripId: tripId),

            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
