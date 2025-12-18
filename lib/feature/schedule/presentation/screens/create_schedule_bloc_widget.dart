import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/DI/injection.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/create_schedule/create_schedule_blco.dart';
import '../viewmodels/create_schedule/create_schedule_event.dart';
import 'create_schedule_screen.dart';

class CreateScheduleBlocWidget extends StatelessWidget {
  final int tripId;

  const CreateScheduleBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = authState.userInfo.id!;

    return BlocProvider(
      create: (_) {
        final bloc = sl<CreateScheduleBloc>();

        bloc.emit(bloc.state.copyWith(tripId: tripId));

        bloc.add(CreateScheduleEvent.initialized(tripId: tripId));

        return bloc;
      },
      child: CreateScheduleScreen(tripId: tripId, userId: userId),
    );
  }
}
