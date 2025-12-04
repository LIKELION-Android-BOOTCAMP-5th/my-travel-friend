import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/update_diary_usecase.dart';

import '../../../../core/result/result.dart';
import 'edit_diary_event.dart';
import 'edit_diary_state.dart';

@injectable
class EditDiaryBloc extends Bloc<EditDiaryEvent, EditDiaryState> {
  final UpdateDiaryUseCase _updateDiaryUseCase;

  EditDiaryBloc(this._updateDiaryUseCase) : super(const EditDiaryState()) {
    on<UpdateDiary>(_onUpdateDiary);
    on<ResetEditDiary>(_onReset);
  }

  String _getErrorType(dynamic failure) {
    return failure.map(
      serverFailure: (_) => 'server',
      networkFailure: (_) => 'network',
      authFailure: (_) => 'auth',
      undefined: (_) => 'unknown',
    );
  }

  // 다이어리 수정
  Future<void> _onUpdateDiary(
    UpdateDiary event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(pageState: EditDiaryPageState.loading));

    if (event.diary.id == null) {
      emit(
        state.copyWith(
          pageState: EditDiaryPageState.error,
          message: '수정할 다이어리 ID가 없습니다',
          errorType: 'validation',
        ),
      );
      return;
    }

    final res = await _updateDiaryUseCase.call(event.diary);

    res.when(
      success: (updatedDiary) {
        emit(
          state.copyWith(
            pageState: EditDiaryPageState.success,
            updatedDiary: updatedDiary,
            message: '다이어리가 수정되었습니다',
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: EditDiaryPageState.error,
            message: '다이어리 수정 실패: ${failure.message}',
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  Future<void> _onReset(
    ResetEditDiary event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(const EditDiaryState());
  }
}
