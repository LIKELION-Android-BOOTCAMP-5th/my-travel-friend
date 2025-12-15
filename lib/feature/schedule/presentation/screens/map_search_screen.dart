import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/map_search/map_search_bloc.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/map_search/map_search_state.dart';

import '../viewmodels/map_search/map_search_event.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({super.key});
  @override
  State<MapSearchScreen> createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapSearchBloc, MapSearchState>(
      listenWhen: (prev, curr) =>
          prev.selectedPlace != curr.selectedPlace &&
          curr.selectedPlace != null,
      listener: (context, state) {
        debugPrint('enker ✅ place confirmed → pop with result');

        Navigator.pop(context, state.selectedPlace);
      },
      child: _buildBody(context),
    );
  }

  void _moveCameraToPlaces(List<PlaceCandidate> places) async {
    if (_mapController == null || places.isEmpty) return;

    debugPrint('enker 🎯 moveCamera places=${places.length}');

    double minLat = places.first.lat;
    double maxLat = places.first.lat;
    double minLng = places.first.lng;
    double maxLng = places.first.lng;

    for (final p in places) {
      minLat = math.min(minLat, p.lat);
      maxLat = math.max(maxLat, p.lat);
      minLng = math.min(minLng, p.lng);
      maxLng = math.max(maxLng, p.lng);
    }

    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    await _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 80),
    );
  }

  Widget _buildBody(BuildContext context) {
    final state = context.watch<MapSearchBloc>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: _initialCamera(state),
              markers: _buildMarkers(context, state),
              onMapCreated: (c) {
                debugPrint('enker 🗺️ GoogleMap CREATED');
                _mapController = c;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
          _SearchBar(),
          _DraggableBottomSheet(state: state),
        ],
      ),
    );
  }

  CameraPosition _initialCamera(MapSearchState state) {
    if (state.hasInitialLocation &&
        state.initialLat != null &&
        state.initialLng != null) {
      return CameraPosition(
        target: LatLng(state.initialLat!, state.initialLng!),
        zoom: 15,
      );
    }
    return const CameraPosition(target: LatLng(37.5665, 126.9780), zoom: 13);
  }

  Set<Marker> _buildMarkers(BuildContext context, MapSearchState state) {
    return state.candidates.map((place) {
      return Marker(
        markerId: MarkerId(place.place),
        position: LatLng(place.lat, place.lng),
        infoWindow: InfoWindow(title: place.place, snippet: place.address),
        onTap: () async {
          context.read<MapSearchBloc>().add(
            MapSearchEvent.placeSelected(place),
          );

          await _mapController?.animateCamera(
            CameraUpdate.newLatLngZoom(LatLng(place.lat, place.lng), 16),
          );
        },
      );
    }).toSet();
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '장소, 주소 검색',
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    context.read<MapSearchBloc>().add(
                      MapSearchEvent.queryChanged(v),
                    );
                  },
                  onSubmitted: (_) {
                    context.read<MapSearchBloc>().add(
                      const MapSearchEvent.searchRequested(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DraggableBottomSheet extends StatelessWidget {
  final MapSearchState state;
  const _DraggableBottomSheet({required this.state});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      minChildSize: 0.12,
      maxChildSize: 0.7,
      snap: true,
      snapSizes: const [0.12, 0.4, 0.7],
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Column(
            children: [
              _Handle(),
              Expanded(
                child: state.candidates.isEmpty
                    ? _EmptyGuide()
                    : _PlaceList(
                        scrollController: scrollController,
                        places: state.candidates,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _EmptyGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('상단 검색창에서 장소를 검색해보세요', style: TextStyle(color: Colors.grey)),
    );
  }
}

class _PlaceList extends StatelessWidget {
  final ScrollController scrollController;
  final List<PlaceCandidate> places;
  const _PlaceList({required this.scrollController, required this.places});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: places.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final p = places[index];
        return _PlaceItem(place: p);
      },
    );
  }
}

class _PlaceItem extends StatelessWidget {
  final PlaceCandidate place;
  const _PlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 상단 정보 영역
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 왼쪽 아이콘 (썸네일 대체)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.place, color: Colors.grey),
              ),

              const SizedBox(width: 12),

              /// 장소 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 장소명
                    Text(
                      place.place,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// 평점 (있을 때만)
                    if (place.rating != null)
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            place.rating!.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                    const SizedBox(height: 4),

                    /// 주소
                    Text(
                      place.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// ✅ AI 추천 이유
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 16,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    place.aiReason,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// 하단 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<MapSearchBloc>().add(
                  MapSearchEvent.placeSelected(place),
                );
                context.read<MapSearchBloc>().add(
                  const MapSearchEvent.confirmPressed(),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('이 장소로 일정 추가'),
            ),
          ),
        ],
      ),
    );
  }
}
