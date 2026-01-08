import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../trip/domain/usecases/get_trip_by_id_usecase.dart';
import '../../widgets/route_type.dart';
import 'map_search_event.dart';
import 'map_search_state.dart';

@injectable
class MapSearchBloc extends Bloc<MapSearchEvent, MapSearchState> {
  final GetTripByIdUseCase _getTripByIdUseCase;
  final String _apiKey = dotenv.get('Google_Maps_Api_Key');
  final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );

  MapSearchBloc(this._getTripByIdUseCase) : super(const MapSearchState()) {
    on<Initialized>(_onInitialized);
    on<QueryChanged>(_onQueryChanged);
    on<SearchRequested>(_onSearchRequested);
    on<PlaceSelected>(_onPlaceSelected);
    on<ConfirmPressed>(_onConfirmPressed);
    on<PlaceFocused>(_onPlaceFocused);
  }

  // 초기 진입

  Future<void> _onInitialized(
    Initialized event,
    Emitter<MapSearchState> emit,
  ) async {
    debugPrint('🟢 [MapSearch:init] tripId=${event.tripId}');
    debugPrint('🟢 [MapSearch:init] lat=${event.lat}, lng=${event.lng}');
    emit(
      state.copyWith(
        tripId: event.tripId,
        mode: event.mode,
        initialLat: event.lat,
        initialLng: event.lng,
        initialAddress: event.address,
        selectedLat: event.lat,
        selectedLng: event.lng,
        hasInitialLocation: event.lat != null && event.lng != null,
      ),
    );
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

    if (state.mode == MapSearchMode.mapSearch) {
      return _runNormalMapSearch(query, emit);
    } else {
      return _runAiSearch(query, emit); // 기존 코드 옮기기
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

  Future<void> _runAiSearch(String query, Emitter<MapSearchState> emit) async {
    emit(state.copyWith(isSearching: true));

    try {
      final tripPlace = (state.tripPlace ?? '').trim();
      final tripCountry = (state.tripCountry ?? '').trim();

      //  Gemini 프롬프트

      final prompt =
          '''
여행 지역은 "$tripPlace"${tripCountry.isNotEmpty ? " ($tripCountry)" : ""} 이다.
사용자 검색어: "$query"

아래 조건을 반드시 지켜라.

- 실제 방문 가능한 장소만 추천
- 최대 5개
- 결과는 반드시 "2줄 1세트" 형식
- 다른 문장, 번호, 설명 절대 금지

출력 형식 예시:
장소명: 하나다코
추천 이유: 오사카역 근처에서 가장 유명한 타코야키 전문점

장소명: 쿠레오루 루쿠아점
추천 이유: 오사카역과 바로 연결된 쇼핑몰 내부에 위치

이 형식을 그대로 사용해라.
''';

      final response = await _model.generateContent([Content.text(prompt)]);
      final rawText = response.text ?? '';

      //  Gemini 응답 파싱

      final lines = rawText
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      final placePairs = <Map<String, String>>[];

      for (int i = 0; i < lines.length - 1; i++) {
        if (lines[i].startsWith('장소명:') && lines[i + 1].startsWith('추천 이유:')) {
          final name = lines[i].replaceFirst('장소명:', '').trim();
          final reason = lines[i + 1].replaceFirst('추천 이유:', '').trim();

          placePairs.add({'name': name, 'reason': reason});
          i++; // 다음 줄 스킵
        }
      }

      if (placePairs.isEmpty) {
        emit(state.copyWith(isSearching: false, message: '추천 장소를 찾지 못했어요'));
        return;
      }

      //  Google Places 정석 루트

      final futures = placePairs.take(5).map((pair) async {
        try {
          final name = pair['name']!;
          final reason = pair['reason']!;

          final searchQuery = tripPlace.isNotEmpty ? '$name $tripPlace' : name;

          // ---- Text Search
          final textSearchUrl =
              'https://maps.googleapis.com/maps/api/place/textsearch/json'
              '?query=${Uri.encodeQueryComponent(searchQuery)}'
              '&language=ko'
              '&key=$_apiKey';

          final textRes = await http.get(Uri.parse(textSearchUrl));
          final textData = jsonDecode(textRes.body);

          if (textData['status'] != 'OK' ||
              (textData['results'] as List).isEmpty) {
            return null;
          }

          final r = textData['results'][0];
          final placeId = r['place_id'];

          // ---- Place Details
          final detailsUrl =
              'https://maps.googleapis.com/maps/api/place/details/json'
              '?place_id=$placeId'
              '&fields=name,geometry,formatted_address,address_components,rating'
              '&language=ko'
              '&key=$_apiKey';

          final detailRes = await http.get(Uri.parse(detailsUrl));
          final detailData = jsonDecode(detailRes.body);

          if (detailData['status'] != 'OK') return null;

          final detail = detailData['result'];
          final address = detail['formatted_address'] ?? '';

          // ---- 국가 필터
          final components = (detail['address_components'] as List?) ?? [];

          final countryComponent = components.firstWhere(
            (c) => (c['types'] as List).contains('country'),
            orElse: () => null,
          );

          final countryName = countryComponent?['long_name'] ?? '';

          if (tripCountry.isNotEmpty && !countryName.contains(tripCountry)) {
            return null;
          }

          return PlaceCandidate(
            place: detail['name'],
            address: address,
            lat: (detail['geometry']['location']['lat'] as num).toDouble(),
            lng: (detail['geometry']['location']['lng'] as num).toDouble(),
            rating: detail['rating'] != null
                ? (detail['rating'] as num).toDouble()
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
    } catch (_) {
      emit(state.copyWith(isSearching: false, message: '검색 중 오류가 발생했어요'));
    }
  }

  Future<void> _runNormalMapSearch(
    String query,
    Emitter<MapSearchState> emit,
  ) async {
    emit(state.copyWith(isSearching: true));

    try {
      final url =
          'https://maps.googleapis.com/maps/api/place/textsearch/json'
          '?query=${Uri.encodeQueryComponent(query)}'
          '&language=ko'
          '&key=$_apiKey';

      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);

      if (data['status'] != 'OK' || (data['results'] as List).isEmpty) {
        emit(state.copyWith(isSearching: false, message: '검색 결과가 없어요'));
        return;
      }

      final results = (data['results'] as List).map((r) {
        return PlaceCandidate(
          place: r['name'],
          address: r['formatted_address'] ?? '',
          lat: (r['geometry']['location']['lat'] as num).toDouble(),
          lng: (r['geometry']['location']['lng'] as num).toDouble(),
          rating: r['rating'] != null ? (r['rating'] as num).toDouble() : null,
          aiReason: '',
        );
      }).toList();

      emit(
        state.copyWith(
          candidates: results,
          isSearching: false,
          showBottomSheet: true,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isSearching: false, message: '검색 중 오류가 발생했어요'));
    }
  }
}
