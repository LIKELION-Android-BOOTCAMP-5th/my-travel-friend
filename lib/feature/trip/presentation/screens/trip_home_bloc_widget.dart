import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/trip_home/trip_home_bloc.dart';
import '../viewmodels/trip_home/trip_home_event.dart';
import '../viewmodels/trip_request/trip_request_bloc.dart';
import 'trip_home_screen.dart';

class TripHomeBlocWidget extends StatelessWidget {
  final int tripId;

  const TripHomeBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text('로그인이 필요합니다'));
    }

    final myId = authState.userInfo.id!;

    return MultiBlocProvider(
      providers: [
        BlocProvider<TripHomeBloc>(
          create: (_) {
            final bloc = sl<TripHomeBloc>();
            bloc.add(TripHomeEvent.loadTripHome(tripId: tripId, myId: myId));
            return bloc;
          },
        ),

        BlocProvider<TripRequestBloc>(create: (_) => sl<TripRequestBloc>()),
      ],
      child: const TripHomeScreen(),
    );
  }
}
