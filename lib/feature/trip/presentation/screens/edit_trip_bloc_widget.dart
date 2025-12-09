import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/edit_trip_screen.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/edit_trip/edit_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/edit_trip/edit_trip_event.dart';

class EditTripBlocWidget extends StatelessWidget {
  final TripEntity trip;

  const EditTripBlocWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<EditTripBloc>()..add(EditTripEvent.loadTrip(trip: trip)),
      child: EditTripScreen(trip: trip),
    );
  }
}
