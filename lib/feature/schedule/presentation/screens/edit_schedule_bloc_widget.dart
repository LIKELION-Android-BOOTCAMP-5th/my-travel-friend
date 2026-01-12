import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/DI/injection.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../domain/entities/schedule_entity.dart';
import '../screens/edit_schedule_screen.dart';
import '../viewmodels/edit_schedule/edit_schedule_bloc.dart';

class EditScheduleBlocWidget extends StatelessWidget {
  final int tripId;
  final ScheduleEntity schedule;

  const EditScheduleBlocWidget({
    super.key,
    required this.schedule,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Scaffold(body: Center(child: Text('로그인이 필요합니다')));
    }

    return BlocProvider(
      create: (_) => sl<EditScheduleBloc>(),
      child: EditScheduleScreen(schedule: schedule),
    );
  }
}
