import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/update_diary_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/upload_diary_img_usecase.dart';

import '../../../../../core/result/failures.dart';
import '../../../../../core/result/result.dart';
import '../../../domain/usecases/delete_diary_img_usecase.dart';
import 'edit_diary_event.dart';
import 'edit_diary_state.dart';

@injectable
class EditDiaryBloc extends Bloc<EditDiaryEvent, EditDiaryState> {
  final UpdateDiaryUseCase _updateDiaryUseCase;
  final UploadDiaryImgUseCase _uploadDiaryImgUseCase;
  final DeleteDiaryImgUseCase _deleteDiaryImgUseCase;

  EditDiaryBloc(
    this._updateDiaryUseCase,
    this._uploadDiaryImgUseCase,
    this._deleteDiaryImgUseCase,
  ) : super(const EditDiaryState()) {
    on<LoadDiary>(_onLoadDiary);
    on<UpdateDiary>(_onUpdateDiary);
    on<ChangeType>(_onChangeType);
    on<ChangeTitle>(_onChangeTitle);
    on<ChangeContent>(_onChangeContent);
    on<ChangeRating>(_onChangeRating);
    on<SelectImg>(_onSelectImg);
    on<RemoveImg>(_onRemoveImg);
    on<ChangeCost>(_onChangeCost);
    on<ChangePublic>(_onChangePublic);
    on<Reset>(_onReset);
  }

  // 에러타입 추출
  String _getErrorType(Failure failure) {
    return switch (failure) {
      ServerFailure() => 'server',
      NetworkFailure() => 'network',
      AuthFailure() => 'auth',
      UndefinedFailure() => 'unknown',
      // TODO: Handle this case.
      Failure() => throw UnimplementedError(),
    };
  }

  // 기존 다이어리 데이터 로드
  Future<void> _onLoadDiary(
    LoadDiary event,
    Emitter<EditDiaryState> emit,
  ) async {
    final diary = event.diary;

    emit(
      state.copyWith(
        diaryId: diary.id,
        tripId: diary.tripId,
        userId: diary.userId,
        originalDiary: diary,
        type: diary.type,
        title: diary.title ?? '',
        content: diary.content ?? '',
        rating: diary.rating?.toDouble() ?? 0.0,
        imgUrl: diary.img,
        cost: diary.cost,
        isPublic: diary.isPublic,
        scheduleId: diary.scheduleId,
      ),
    );
  }

  // 다이어리 수정 (저장)
  Future<void> _onUpdateDiary(
    UpdateDiary event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(pageState: EditDiaryPageState.loading));

    String? uploadedImgUrl = state.imgUrl;

    // PHOTO 타입이고 새 로컬 이미지가 있으면 업로드
    if (state.type == 'PHOTO' && state.localImgFile != null) {
      emit(state.copyWith(isUploading: true));

      // 기존 이미지가 있으면 삭제
      if (state.originalDiary?.img != null &&
          state.originalDiary!.img!.isNotEmpty) {
        await _deleteDiaryImgUseCase(state.originalDiary!.img!);
      }

      final uploadResult = await await _uploadDiaryImgUseCase(
        file: state.localImgFile!,
        userId: state.userId,
      );

      final uploadFailed = uploadResult.when(
        success: (url) {
          uploadedImgUrl = url;
          return false;
        },
        failure: (failure) {
          emit(
            state.copyWith(
              pageState: EditDiaryPageState.error,
              message: '이미지 업로드 실패: ${failure.message}',
              errorType: _getErrorType(failure),
              isUploading: false,
            ),
          );
          return true;
        },
      );

      if (uploadFailed) return;

      emit(state.copyWith(isUploading: false, imgUrl: uploadedImgUrl));
    }

    // diaryId 확인
    if (state.diaryId == null) {
      emit(
        state.copyWith(
          pageState: EditDiaryPageState.error,
          message: '수정할 다이어리 ID가 없습니다',
          errorType: 'validation',
        ),
      );
      return;
    }

    // Entity 생성 후 업데이트
    final diary = state.copyWith(imgUrl: uploadedImgUrl).toEntity();

    final res = await _updateDiaryUseCase.call(diary);

    res.when(
      success: (updatedDiary) {
        emit(
          state.copyWith(
            pageState: EditDiaryPageState.success,
            updatedDiary: updatedDiary,
            message: '다이어리가 수정되었습니다',
            actionType: 'update',
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

  // 타입 변경
  Future<void> _onChangeType(
    ChangeType event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(
      state.copyWith(
        type: event.type,
        rating: 0.0,
        imgUrl: null,
        localImgFile: null,
        cost: null,
      ),
    );
  }

  // 제목 변경
  Future<void> _onChangeTitle(
    ChangeTitle event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(title: event.title));
  }

  // 내용 변경
  Future<void> _onChangeContent(
    ChangeContent event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(content: event.content));
  }

  // 별점 변경
  Future<void> _onChangeRating(
    ChangeRating event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(rating: event.rating));
  }

  // 로컬 이미지 선택
  Future<void> _onSelectImg(
    SelectImg event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(localImgFile: event.file, imgUrl: null));
  }

  // 이미지 제거
  Future<void> _onRemoveImg(
    RemoveImg event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(localImgFile: null, imgUrl: null));
  }

  // 금액 변경
  Future<void> _onChangeCost(
    ChangeCost event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(cost: event.cost));
  }

  // 공개 여부 변경
  Future<void> _onChangePublic(
    ChangePublic event,
    Emitter<EditDiaryState> emit,
  ) async {
    emit(state.copyWith(isPublic: event.isPublic));
  }

  // 초기화
  Future<void> _onReset(Reset event, Emitter<EditDiaryState> emit) async {
    emit(const EditDiaryState());
  }
}
