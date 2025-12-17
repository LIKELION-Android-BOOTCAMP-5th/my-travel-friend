import 'package:freezed_annotation/freezed_annotation.dart';

import 'map_search_state.dart';

part 'map_search_event.freezed.dart';

@freezed
class MapSearchEvent with _$MapSearchEvent {
  // 초기 진입
  const factory MapSearchEvent.initialized({
    required int tripId,
    double? lat,
    double? lng,
    String? address,
  }) = Initialized;

  // 검색어 입력
  const factory MapSearchEvent.queryChanged(String query) = QueryChanged;

  // 검색 실행 (Gemini → GoogleMap 검증)
  const factory MapSearchEvent.searchRequested() = SearchRequested;
  // 아이템 누르면 해당 마커로 이동
  const factory MapSearchEvent.placeFocused(PlaceCandidate place) =
      PlaceFocused;

  // 장소 선택
  const factory MapSearchEvent.placeSelected(PlaceCandidate place) =
      PlaceSelected;

  // 일정 추가 버튼
  const factory MapSearchEvent.confirmPressed() = ConfirmPressed;
}
