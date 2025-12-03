import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_state.freezed.dart';

// [이재은] 다이어리 관련 상태 정의 - 현재 화면이 어떤 상태인지

@freezed
abstract class DiaryState with _$DiaryState {
  // 초기 상태
  const factory DiaryState.initial() = DiaryInitial;

  // 로딩 상태
  const factory DiaryState.loading() = DiaryLoading;

  // 목록 가져오기 성공 상태
  const factory DiaryState.loaded({
    required List<DiaryEntity> diaries,
    String? currentFilter,
  }) = DiaryLoaded;

  // 상세 조회 성공 상태
  const factory DiaryState.detailLoaded({required DiaryEntity diary}) =
      DiaryDetailLoaded;

  // 생성/수정/삭제 성공시
  const factory DiaryState.success({String? message, String? actionType}) =
      DiarySuccess;

  // 실패 했을 때
  const factory DiaryState.error({required String message, String? errorType}) =
      DiaryError;
}
