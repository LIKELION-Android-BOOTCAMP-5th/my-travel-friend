import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/diary/presentation/viewmodels/diary_page_state.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_state.freezed.dart';

// [이재은] 다이어리 전체 상태
// - 조회 정보(tripId, userId, isMyDiaries)
// - 페이지 상태(DiaryPageState)

@freezed
abstract class DiaryState with _$DiaryState {
  const factory DiaryState({
    // 조회 정보
    @Default(0) int tripId,
    int? userId,
    @Default(false) bool isMyDiaries,

    // 페이지 상태
    @Default(DiaryPageState.initial()) DiaryPageState pageState,
  }) = _DiaryState;

  // 초기 상태
  static const initial = DiaryState();
}
