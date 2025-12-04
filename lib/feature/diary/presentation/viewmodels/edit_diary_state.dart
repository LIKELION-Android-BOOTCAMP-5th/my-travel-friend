import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'edit_diary_state.freezed.dart';

// [이재은] 다이어리 수정 상태

@freezed
abstract class EditDiaryState with _$EditDiaryState {
  const factory EditDiaryState({
    DiaryEntity? updatedDiary,
    String? message,
    String? errorType,
    @Default(EditDiaryPageState.init) EditDiaryPageState pageState,
  }) = _EditDiaryState;
}

enum EditDiaryPageState { init, loading, success, error }
