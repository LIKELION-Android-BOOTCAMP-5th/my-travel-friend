import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/DI/injection.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/map_search/map_search_bloc.dart';

import '../viewmodels/map_search/map_search_event.dart';
import 'map_search_screen.dart';

class MapSearchBlocWidget extends StatelessWidget {
  final int tripId;
  final double? initialLat;
  final double? initialLng;
  final String? initialAddress;

  const MapSearchBlocWidget({
    super.key,
    this.initialLat,
    this.initialLng,
    this.initialAddress,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('enker 🧩 MapSearchBlocWidget build');

    return BlocProvider(
      create: (_) {
        debugPrint('enker 🧩 MapSearchBloc created');
        final bloc = sl<MapSearchBloc>();

        debugPrint(
          'enker 🧩 send Initialized '
          'lat=$initialLat lng=$initialLng address=$initialAddress',
        );

        bloc.add(
          MapSearchEvent.initialized(
            tripId: tripId,
            lat: initialLat,
            lng: initialLng,
            address: initialAddress,
          ),
        );

        return bloc;
      },
      child: const MapSearchScreen(),
    );
  }
}
