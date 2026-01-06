import 'package:freezed_annotation/freezed_annotation.dart';

import '../../widgets/route_type.dart';

part 'map_search_state.freezed.dart';

@freezed
abstract class MapSearchState with _$MapSearchState {
  const factory MapSearchState({
    int? tripId,
    @Default(MapSearchMode.aiSearch) MapSearchMode mode,
    double? initialLat,
    double? initialLng,
    String? initialAddress,
    @Default(false) bool hasInitialLocation,

    double? selectedLat,
    double? selectedLng,

    @Default('') String query,
    @Default(false) bool isSearching,

    @Default([]) List<PlaceCandidate> candidates,

    PlaceCandidate? selectedPlace,
    PlaceCandidate? focusedPlace,
    @Default(false) bool showBottomSheet,
    String? message,
  }) = _MapSearchState;
}

class PlaceCandidate {
  final String place;
  final String address;
  final double lat;
  final double lng;
  final double? rating;
  final String aiReason;

  PlaceCandidate({
    required this.place,
    required this.address,
    required this.lat,
    required this.lng,
    this.rating,
    required this.aiReason,
  });
}
