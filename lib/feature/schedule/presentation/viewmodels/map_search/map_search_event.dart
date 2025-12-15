import 'package:freezed_annotation/freezed_annotation.dart';

import 'map_search_state.dart';

part 'map_search_event.freezed.dart';

@freezed
class MapSearchEvent with _$MapSearchEvent {
  // 초기 진입
  const factory MapSearchEvent.initialized({
    required int tripId, // ✅ 추가
    double? lat,
    double? lng,
    String? address,
  }) = Initialized;

  // 검색어 입력
  const factory MapSearchEvent.queryChanged(String query) = QueryChanged;

  // 검색 실행 (Gemini → GoogleMap 검증)
  const factory MapSearchEvent.searchRequested() = SearchRequested;

  // 장소 선택
  const factory MapSearchEvent.placeSelected(PlaceCandidate place) =
      PlaceSelected;

  // 일정 추가 버튼
  const factory MapSearchEvent.confirmPressed() = ConfirmPressed;
}
