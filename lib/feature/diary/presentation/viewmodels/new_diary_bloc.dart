import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/create_diary_usecase.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../../domain/repositories/diary_repository.dart';
import 'new_diary_event.dart';
import 'new_diary_state.dart';

// [이재은] 다이어리 작성 bloc
@injectable
class NewDiaryBloc extends Bloc<NewDiaryEvent, NewDiaryState> {
  // usecase 주입
  final CreateDiaryUseCase _createDiaryUseCase;
  final DiaryRepository _diaryRepository;
  // schedule 관련 필요

  NewDiaryBloc(
    this._createDiaryUseCase,
    this._diaryRepository,
    // schedule 관련 필요
  ) : super(const NewDiaryState()) {
    on<CreateDiary>(_onCreateDiary);
    on<ChangeType>(_onChangeType);
    on<ChangeTitle>(_onChangeTitle);
    on<ChangeContent>(_onChangeContent);
    on<ChangeRating>(_onChangeRating);
    on<SelectImg>(_onSelectImg);
    on<RemoveImg>(_onRemoveImg);
    on<ChangeCost>(_onChangeCost);
    on<ChangePublic>(_onChangePublic);
    on<ChooseSchedule>(_onChooseSchedule);
    on<Reset>(_onReset);
    // 일정 관련
  }

  // 핸들러

  // tripId, userId 초기화 메서드
  void initialize({required int tripId, required int userId}) {
    emit(state.copyWith(tripId: tripId, userId: userId));
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

  // 다이어리 생성
  Future<void> _onCreateDiary(
    CreateDiary event,
    Emitter<NewDiaryState> emit,
  ) async {
    print('>>> [1] _onCreateDiary 호출됨!');
    print('>>> type: ${state.type}');
    emit(state.copyWith(pageState: NewDiaryPageState.loading));

    String? uploadedImgUrl = state.imgUrl;

    // PHOTO 타입이고 로컬 이미지가 있으면 업로드
    if (state.type == 'PHOTO' && state.localImgFile != null) {
      emit(state.copyWith(isUploading: true));

      final uploadResult = await _diaryRepository.uploadImg(
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
              pageState: NewDiaryPageState.error,
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

    // state에서 entity 생성 (업로드된 이미지 URL 포함)
    final diary = state.copyWith(imgUrl: uploadedImgUrl).toEntity();

    final res = await _createDiaryUseCase.call(diary);

    res.when(
      success: (createdDiary) {
        emit(
          state.copyWith(
            pageState: NewDiaryPageState.success,
            createdDiary: createdDiary,
            message: '다이어리를 작성했습니다',
            actionType: 'create',
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: NewDiaryPageState.error,
            message: '다이어리 작성 실패: ${failure.message}',
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 타입 변경
  Future<void> _onChangeType(
    ChangeType event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(
      state.copyWith(
        type: event.type,
        rating: 0.0,
        imgUrl: null,
        cost: null,
        localImgFile: null,
      ),
    );
  }

  // 제목 변경
  Future<void> _onChangeTitle(
    ChangeTitle event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(title: event.title));
  }

  // 내용 변경
  Future<void> _onChangeContent(
    ChangeContent event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(content: event.content));
  }

  // 별점 변경
  Future<void> _onChangeRating(
    ChangeRating event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(rating: event.rating));
  }

  // 로컬 이미지 선택
  Future<void> _onSelectImg(
    SelectImg event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(localImgFile: event.file, imgUrl: null));
  }

  // 이미지 제거
  Future<void> _onRemoveImg(
    RemoveImg event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(localImgFile: null, imgUrl: null));
  }

  // 금액 변경
  Future<void> _onChangeCost(
    ChangeCost event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(cost: event.cost));
  }

  // 공개 여부 변경
  Future<void> _onChangePublic(
    ChangePublic event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(isPublic: event.isPublic));
  }

  // 일정 선택
  Future<void> _onChooseSchedule(
    ChooseSchedule event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(scheduleId: event.scheduleId));
  }

  // 초기화
  Future<void> _onReset(Reset event, Emitter<NewDiaryState> emit) async {
    emit(const NewDiaryState());
  }

  // 일정 목록 로드
}
