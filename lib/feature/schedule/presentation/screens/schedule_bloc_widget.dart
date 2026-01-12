import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/toast_pop.dart';
import 'package:my_travel_friend/feature/schedule/presentation/screens/schedule_screen.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/schedule/schedule_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/DI/injection.dart';
import '../viewmodels/schedule/schedule_bloc.dart';
import '../viewmodels/schedule/schedule_event.dart';
import '../widgets/route_type.dart';

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
      listener: (context, state) async {
        // 성공 / 에러 메시지
        if (state.pageState == SchedulepageState.error) {
          ToastPop.show(state.message ?? "오류 발생");
        } else if (state.pageState == SchedulepageState.success) {
          ToastPop.show("처리되었습니다");
        }

        // 화면 이동
        if (state.navigateToCreate) {
          final result = await context.pushNamed<bool>(
            'ScheduleCreate',
            pathParameters: {'tripId': '$tripId'},
          );

          context.read<ScheduleBloc>().add(
            const ScheduleEvent.resetNavigation(),
          );

          if (result == true) {
            context.read<ScheduleBloc>().add(
              ScheduleEvent.refresh(tripId: tripId),
            );
          }
        }

        if (state.navigateToEdit && state.editingSchedule != null) {
          final result = await context.pushNamed<bool>(
            'ScheduleEdit',
            pathParameters: {'tripId': '$tripId'},
            extra: state.editingSchedule,
          );

          context.read<ScheduleBloc>().add(
            const ScheduleEvent.resetNavigation(),
          );

          if (result == true) {
            context.read<ScheduleBloc>().add(
              ScheduleEvent.refresh(tripId: tripId),
            );
          }
        }

        if (state.routeRequested && state.routeUrl != null) {
          final primaryUri = Uri.parse(state.routeUrl!);

          final launched = await launchUrl(
            primaryUri,
            mode: LaunchMode.externalApplication,
          );

          if (!launched) {
            final from = state.routeFrom;
            final to = state.routeTo;
            final type = state.routeType ?? RouteType.car;

            if (from != null && to != null) {
              final isKorea = (state.trip?.country ?? '').trim().contains('한국');

              final bloc = context.read<ScheduleBloc>();

              final fallbackUrl = isKorea
                  ? bloc.buildNaverWebUrl(from: from, to: to)
                  : bloc.buildGoogleWebUrl(from: from, to: to, type: type);

              await launchUrl(
                Uri.parse(fallbackUrl),
                mode: LaunchMode.externalApplication,
              );

              ToastPop.show('지도 앱이 없어 웹 지도로 이동합니다');
            }
          }

          context.read<ScheduleBloc>().add(const ScheduleEvent.clearRoute());
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
