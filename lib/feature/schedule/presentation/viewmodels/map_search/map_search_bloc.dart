import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'map_search_event.dart';
import 'map_search_state.dart';

@injectable
class MapSearchBloc extends Bloc<MapSearchEvent, MapSearchState> {
  final String _apiKey = dotenv.get('Google_Maps_Api_Key');
  final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );

  MapSearchBloc() : super(const MapSearchState()) {
    on<Initialized>(_onInitialized);
    on<QueryChanged>(_onQueryChanged);
    on<SearchRequested>(_onSearchRequested);
    on<PlaceSelected>(_onPlaceSelected);
    on<ConfirmPressed>(_onConfirmPressed);
    on<PlaceFocused>(_onPlaceFocused);
  }

  // 초기 진입

  void _onInitialized(Initialized event, Emitter<MapSearchState> emit) {
    if (event.lat != null && event.lng != null) {
      emit(
        state.copyWith(
          tripId: event.tripId,
          initialLat: event.lat,
          initialLng: event.lng,
          initialAddress: event.address,
          selectedLat: event.lat,
          selectedLng: event.lng,
          hasInitialLocation: true,
        ),
      );
    }
  }

  // 검색어 입력

  void _onQueryChanged(QueryChanged event, Emitter<MapSearchState> emit) {
    emit(state.copyWith(query: event.query));
  }

  // 검색 실행

  Future<void> _onSearchRequested(
    SearchRequested event,
    Emitter<MapSearchState> emit,
  ) async {
    final query = state.query.trim();
    if (query.isEmpty) return;

    emit(state.copyWith(isSearching: true));

    try {
      final prompt =
          '''
"$query" 와 관련된 실제 방문 가능한 장소를 최대 5개 추천해줘.
지역는 반드시 검색어에 포함된 지역과 일치해야한다.
장소의 주소 또한 지역안에 있어야한다.
다른지역이면 추천하지 마라.

결과는 반드시 아래 형식으로만 답해줘.

장소명: 추천 이유
장소명: 추천 이유
''';

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      final placePairs = text.split('\n').where((e) => e.contains(':')).map((
        e,
      ) {
        final parts = e.split(':');
        return {
          'name': parts.first.trim(),
          'reason': parts.sublist(1).join(':').trim(),
        };
      }).toList();

      if (placePairs.isEmpty) {
        emit(state.copyWith(isSearching: false, message: '추천 장소를 찾지 못했어요'));
        return;
      }

      final futures = placePairs.take(5).map((pair) async {
        try {
          final name = pair['name']!;
          final reason = pair['reason']!;

          final url =
              'https://maps.googleapis.com/maps/api/place/textsearch/json'
              '?query=${Uri.encodeQueryComponent(name)}'
              '&language=ko'
              '&key=$_apiKey';

          final res = await http.get(Uri.parse(url));
          final data = jsonDecode(res.body);

          if (data['status'] != 'OK' || data['results'].isEmpty) return null;

          final r = data['results'][0];

          return PlaceCandidate(
            place: r['name'],
            address: r['formatted_address'] ?? '',
            lat: r['geometry']['location']['lat'],
            lng: r['geometry']['location']['lng'],
            rating: r['rating'] != null
                ? (r['rating'] as num).toDouble()
                : null,
            aiReason: reason,
          );
        } catch (_) {
          return null;
        }
      }).toList();

      final results = (await Future.wait(
        futures,
      )).whereType<PlaceCandidate>().toList();

      if (results.isEmpty) {
        emit(
          state.copyWith(isSearching: false, message: '지도에서 찾을 수 있는 장소가 없어요'),
        );
        return;
      }

      emit(
        state.copyWith(
          candidates: results,
          isSearching: false,
          showBottomSheet: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isSearching: false, message: '검색 중 오류가 발생했어요'));
    }
  }

  // 장소 선택

  void _onPlaceSelected(PlaceSelected event, Emitter<MapSearchState> emit) {
    emit(
      state.copyWith(
        selectedPlace: event.place,
        selectedLat: event.place.lat,
        selectedLng: event.place.lng,
      ),
    );
  }

  void _onPlaceFocused(PlaceFocused event, Emitter<MapSearchState> emit) {
    emit(state.copyWith(focusedPlace: event.place));
  }

  // 선택 확정

  void _onConfirmPressed(ConfirmPressed event, Emitter<MapSearchState> emit) {
    if (state.selectedPlace == null) {
      emit(state.copyWith(message: '장소를 선택해주세요'));
    }
  }
}
