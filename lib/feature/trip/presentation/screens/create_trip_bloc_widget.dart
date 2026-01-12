import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_event.dart';

import '../../../../core/DI/injection.dart';
import 'create_trip_screen.dart';

class CreateTripBlocWidget extends StatelessWidget {
  final int userId;
  final int? friendId; // 함께 여행하기 진입 시

  const CreateTripBlocWidget({super.key, required this.userId, this.friendId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<CreateTripBloc>();

        bloc.add(
          CreateTripEvent.initialized(userId: userId, friendId: friendId),
        );

        return bloc;
      },
      child: CreateTripScreen(userId: userId, friendId: friendId),
    );
  }
}
