import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/create_diary_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/delete_diary_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_diary_by_id_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_my_diaries_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_our_diaries_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/update_diary_usecase.dart';

import '../../../../core/result/result.dart';
import 'diary_event.dart';
import 'diary_state.dart';

// [이재은] 다이어리 bloc
@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  // usecase 주입
  final GetOurDiariesUseCase _getOurDiariesUseCase;
  final GetMyDiariesUseCase _getMyDiariesUseCase;
  final GetDiaryByIdUseCase _getDiaryByIdUseCase;
  final CreateDiaryUseCase _createDiaryUseCase;
  final UpdateDiaryUseCase _updateDiaryUseCase;
  final DeleteDiaryUseCase _deleteDiaryUseCase;

  // 새로고침을 위한 로컬 캐시
  int? _lastTripId;
  int? _lastUserId;
  bool _wasMyDiaries = false;

  // 자동 새로고침
  void _refreshList() {
    if (_lastTripId == null) return;

    if (_wasMyDiaries && _lastUserId != null) {
      add(DiaryEvent.getMyDiaries(tripId: _lastTripId!, userId: _lastUserId!));
    } else {
      add(DiaryEvent.getOurDiaries(tripId: _lastTripId!));
    }
  }

  // 새로고침
  Future<void> _onRefresh(Refresh event, Emitter<DiaryState> emit) async {
    if (event.isMyDiaries && event.userId != null) {
      add(DiaryEvent.getMyDiaries(tripId: event.tripId, userId: event.userId!));
    } else {
      add(DiaryEvent.getOurDiaries(tripId: event.tripId));
    }
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

  DiaryBloc(
    this._getOurDiariesUseCase,
    this._getMyDiariesUseCase,
    this._getDiaryByIdUseCase,
    this._createDiaryUseCase,
    this._updateDiaryUseCase,
    this._deleteDiaryUseCase,
  ) : super(const DiaryState.initial()) {
    on<GetOurDiaries>(_onGetOurDiaries);
    on<GetMyDiaries>(_onGetMyDiaries);
    on<GetDiaryDetail>(_onGetDiaryDetail);
    on<CreateDiary>(_onCreateDiary);
    on<UpdateDiary>(_onUpdateDiary);
    on<DeleteDiary>(_onDeleteDiary);
    on<FilterByType>(_onFilterByType);
    on<Refresh>(_onRefresh);
  }

  // 핸들러
  // 공유 다이어리 가져오기
  Future<void> _onGetOurDiaries(
    GetOurDiaries event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());
    _lastTripId = event.tripId;
    _lastUserId = null;
    _wasMyDiaries = false;

    final res = await _getOurDiariesUseCase.call(event.tripId);

    res.when(
      success: (diaries) {
        emit(DiaryState.loaded(diaries: diaries));
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 내 다이어리 가져오기
  Future<void> _onGetMyDiaries(
    GetMyDiaries event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());

    _lastTripId = event.tripId;
    _lastUserId = event.userId;
    _wasMyDiaries = true;

    final res = await _getMyDiariesUseCase.call(event.tripId, event.userId);

    res.when(
      success: (diaries) {
        emit(DiaryState.loaded(diaries: diaries));
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 다이어리 상세보기
  Future<void> _onGetDiaryDetail(
    GetDiaryDetail event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());

    final res = await _getDiaryByIdUseCase.call(event.diaryId);

    res.when(
      success: (diary) {
        emit(DiaryState.detailLoaded(diary: diary));
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 다이어리 생성
  Future<void> _onCreateDiary(
    CreateDiary event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());

    final res = await _createDiaryUseCase.call(event.diary);

    res.when(
      success: (createdDiary) {
        emit(
          const DiaryState.success(
            message: "다이어리를 작성헀습니다",
            actionType: 'create',
          ),
        );
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: '다이어리 작성 실패 : ${failure.message}',
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 다이어리 수정
  Future<void> _onUpdateDiary(
    UpdateDiary event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());

    if (event.diary.id == null) {
      emit(
        const DiaryState.error(
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
          const DiaryState.success(
            message: '다이어리가 수정되었습니다',
            actionType: 'update',
          ),
        );

        _refreshList();
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: '다이어리 수정 실패: ${failure.message}',
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 다이어리 삭제
  Future<void> _onDeleteDiary(
    DeleteDiary event,
    Emitter<DiaryState> emit,
  ) async {
    emit(const DiaryState.loading());

    final res = await _deleteDiaryUseCase.call(event.diaryId);

    res.when(
      success: (_) {
        emit(
          const DiaryState.success(
            message: '다이어리가 삭제되었습니다',
            actionType: 'delete',
          ),
        );

        _refreshList();
      },
      failure: (failure) {
        emit(
          DiaryState.error(
            message: '다이어리 삭제 실패: ${failure.message}',
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 타입별 필터링
  Future<void> _onFilterByType(
    FilterByType event,
    Emitter<DiaryState> emit,
  ) async {
    final currentState = state;
    if (currentState is! DiaryLoaded) {
      return;
    }

    if (event.type == null) {
      _refreshList();
      return;
    }

    final filteredDiaries = currentState.diaries
        .where((diary) => diary.type == event.type)
        .toList();

    emit(
      DiaryState.loaded(diaries: filteredDiaries, currentFilter: event.type),
    );
  }
}
