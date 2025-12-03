import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_page_state.freezed.dart';

// [이재은] 다이어리 페이지 상태 (UI 상태)

@freezed
abstract class DiaryPageState with _$DiaryPageState {
  // 초기 상태
  const factory DiaryPageState.initial() = DiaryPageInitial;

  // 로딩 상태
  const factory DiaryPageState.loading() = DiaryPageLoading;

  // 목록 가져오기 성공 상태
  const factory DiaryPageState.loaded({
    required List<DiaryEntity> diaries,
    required List<DiaryEntity> allDiaries,
    String? currentFilter,
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = DiaryPageLoaded;

  // 상세 조회 성공 상태
  const factory DiaryPageState.detailLoaded({required DiaryEntity diary}) =
      DiaryPageDetailLoaded;

  // 생성/수정/삭제 성공시
  const factory DiaryPageState.success({String? message, String? actionType}) =
      DiaryPageSuccess;

  // 실패 했을 때
  const factory DiaryPageState.error({
    required String message,
    String? errorType,
  }) = DiaryPageError;
}
