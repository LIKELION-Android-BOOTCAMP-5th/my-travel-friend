import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_state.freezed.dart';

// [이재은] 다이어리 전체 상태

@freezed
abstract class DiaryState with _$DiaryState {
  const factory DiaryState({
    // 조회 정보
    @Default(0) int tripId,
    int? userId,
    @Default(false) bool isMyDiaries,

    // 다이어리 목록 데이터
    @Default([]) List<DiaryEntity> diaries,
    @Default([]) List<DiaryEntity> allDiaries,
    String? currentFilter,

    // 상세 조회 데이터
    DiaryEntity? selectedDiary,

    // 페이지네이션
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,

    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,

    // 페이지 상태
    @Default(DiaryPageState.init) DiaryPageState pageState,
  }) = _DiaryState;
}

// [이재은] 다이어리 페이지 상태 (UI 상태)
enum DiaryPageState {
  init, // 초기 상태
  loading, // 로딩 중
  loaded, // 목록 로드 완료
  detailLoaded, // 상세 조회 완료
  success, // 생성/수정/삭제 성공
  error, // 에러
}
