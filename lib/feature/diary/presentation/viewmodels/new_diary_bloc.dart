import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/create_diary_usecase.dart';

import '../../../../core/result/result.dart';
import 'new_diary_event.dart';
import 'new_diary_state.dart';

// [이재은] 다이어리 작성 bloc
@injectable
class NewDiaryBloc extends Bloc<NewDiaryEvent, NewDiaryState> {
  // usecase 주입
  final CreateDiaryUseCase _createDiaryUseCase;

  NewDiaryBloc(this._createDiaryUseCase) : super(const NewDiaryState()) {
    on<CreateDiary>(_onCreateDiary);
    on<ChangeType>(_onChangeType);
    on<ChangeTitle>(_onChangeTitle);
    on<ChangeContent>(_onChangeContent);
    on<ChangeRating>(_onChangeRating);
    on<ChangePhoto>(_onChangePhoto);
    on<ChangeCost>(_onChangeCost);
    on<ChangePublic>(_onChangePublic);
    on<ChooseSchedule>(_onChooseSchedule);
    on<Reset>(_onReset);
  }

  // 핸들러

  // tripId, userId 초기화 메서드
  void initialize({required int tripId, required int userId}) {
    emit(state.copyWith(tripId: tripId, userId: userId));
  }

  // 에러타입 추출
  String _getErrorType(dynamic failure) {
    return failure.map(
      serverFailure: (_) => 'server',
      networkFailure: (_) => 'network',
      authFailure: (_) => 'auth',
      undefined: (_) => 'unknown',
    );
  }

  // 다이어리 생성
  Future<void> _onCreateDiary(
    CreateDiary event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(pageState: NewDiaryPageState.loading));

    final res = await _createDiaryUseCase.call(event.diary);

    res.when(
      success: (createdDiary) {
        emit(
          state.copyWith(
            pageState: NewDiaryPageState.success,
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
      state.copyWith(type: event.type, rating: 0.0, imgUrl: null, cost: null),
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

  // 이미지 변경
  Future<void> _onChangePhoto(
    ChangePhoto event,
    Emitter<NewDiaryState> emit,
  ) async {
    emit(state.copyWith(imgUrl: event.imgUrl));
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

  // 새로고침
  Future<void> _onReset(Reset event, Emitter<NewDiaryState> emit) async {
    emit(const NewDiaryState());
  }
}
