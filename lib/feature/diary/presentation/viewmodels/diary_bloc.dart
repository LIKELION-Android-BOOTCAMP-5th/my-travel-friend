import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/entities/diary_entity.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/delete_diary_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_diary_by_id_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_my_diaries_usecase.dart';
import 'package:my_travel_friend/feature/diary/domain/usecases/get_our_diaries_usecase.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import 'diary_event.dart';
import 'diary_state.dart';

// [이재은] 다이어리 조회 및 삭제 bloc

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  // usecase 주입
  final GetOurDiariesUseCase _getOurDiariesUseCase;
  final GetMyDiariesUseCase _getMyDiariesUseCase;
  final GetDiaryByIdUseCase _getDiaryByIdUseCase;
  final DeleteDiaryUseCase _deleteDiaryUseCase;

  static const int _pageLimit = 7;

  DiaryBloc(
    this._getOurDiariesUseCase,
    this._getMyDiariesUseCase,
    this._getDiaryByIdUseCase,
    this._deleteDiaryUseCase,
  ) : super(const DiaryState()) {
    on<GetOurDiaries>(_onGetOurDiaries);
    on<GetMyDiaries>(_onGetMyDiaries);
    on<GetDiaryById>(_onGetDiaryById);
    on<DeleteDiary>(_onDeleteDiary);
    on<FilterByType>(_onFilterByType);
    on<LoadMore>(_onLoadMore);
    on<Refresh>(_onRefresh);
    on<RequestCreate>(_onRequestCreate);
    on<RequestEdit>(_onRequestEdit);
    on<NavigationHandled>(_onNavigationHandled);
    on<OnCreateCompleted>(_onCreateCompleted);
    on<OnEditCompleted>(_onEditCompleted);
  }

  // 핸들러
  // 자동 새로고침
  void _refreshList() {
    if (state.tripId == 0) return;

    if (state.isMyDiaries && state.userId != null) {
      add(DiaryEvent.getMyDiaries(tripId: state.tripId, userId: state.userId!));
    } else {
      add(DiaryEvent.getOurDiaries(tripId: state.tripId));
    }
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

  // 작성 화면으로 이동 요청
  void _onRequestCreate(RequestCreate event, Emitter<DiaryState> emit) {
    emit(state.copyWith(navigateToCreate: true));
  }

  // 수정 화면으로 이동 요청
  void _onRequestEdit(RequestEdit event, Emitter<DiaryState> emit) {
    emit(
      state.copyWith(
        navigateToEdit: true,
        selectedDiary: event.diary, // 수정할 다이어리 저장
      ),
    );
  }

  // 네비게이션 플래그 리셋
  void _onNavigationHandled(NavigationHandled event, Emitter<DiaryState> emit) {
    emit(state.copyWith(navigateToCreate: false));
    emit(state.copyWith(navigateToEdit: false));
  }

  // 작성 완료
  void _onCreateCompleted(OnCreateCompleted event, Emitter<DiaryState> emit) {
    if (event.success) {
      _refreshList();
    }
  }

  // 수정 완료
  void _onEditCompleted(OnEditCompleted event, Emitter<DiaryState> emit) {
    if (event.success) {
      _refreshList();
    }
  }

  // 공유 다이어리 가져오기 (첫 페이지)
  Future<void> _onGetOurDiaries(
    GetOurDiaries event,
    Emitter<DiaryState> emit,
  ) async {
    emit(
      state.copyWith(
        tripId: event.tripId,
        userId: null,
        isMyDiaries: false,
        pageState: DiaryPageState.loading,
      ),
    );

    final res = await _getOurDiariesUseCase.call(
      tripId: event.tripId,
      page: 0,
      limit: _pageLimit,
    );

    res.when(
      success: (diaries) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.loaded,
            diaries: diaries,
            allDiaries: diaries,
            currentFilter: null,
            currentPage: 0,
            hasMore: diaries.length >= _pageLimit,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.error,
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 내 다이어리 가져오기 (첫 페이지)
  Future<void> _onGetMyDiaries(
    GetMyDiaries event,
    Emitter<DiaryState> emit,
  ) async {
    emit(
      state.copyWith(
        tripId: event.tripId,
        userId: event.userId,
        isMyDiaries: true,
        pageState: DiaryPageState.loading,
      ),
    );

    final res = await _getMyDiariesUseCase.call(
      tripId: event.tripId,
      userId: event.userId,
      page: 0,
      limit: _pageLimit,
    );

    res.when(
      success: (diaries) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.loaded,
            diaries: diaries,
            allDiaries: diaries,
            currentFilter: null,
            currentPage: 0,
            hasMore: diaries.length >= _pageLimit,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.error,
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 다음 페이지 로드 (무한 스크롤)
  // -Screen에서는 스크롤 위치만 감지 & 이벤트 발생
  // - 여기에서 실제 조건 체크
  Future<void> _onLoadMore(LoadMore event, Emitter<DiaryState> emit) async {
    if (state.pageState != DiaryPageState.loaded) return;
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;

    final res = state.isMyDiaries
        ? await _getMyDiariesUseCase.call(
            tripId: state.tripId,
            userId: state.userId!,
            page: nextPage,
            limit: _pageLimit,
          )
        : await _getOurDiariesUseCase.call(
            tripId: state.tripId,
            page: nextPage,
            limit: _pageLimit,
          );

    res.when(
      success: (newDiaries) {
        final List<DiaryEntity> updatedAllDiaries = [];
        updatedAllDiaries.addAll(state.allDiaries);
        updatedAllDiaries.addAll(newDiaries);

        List<DiaryEntity> updatedDiaries;
        if (state.currentFilter != null) {
          updatedDiaries = updatedAllDiaries
              .where((diary) => diary.type == state.currentFilter)
              .toList();
        } else {
          updatedDiaries = updatedAllDiaries;
        }

        emit(
          state.copyWith(
            diaries: updatedDiaries,
            allDiaries: updatedAllDiaries,
            currentPage: nextPage,
            hasMore: newDiaries.length >= _pageLimit,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(state.copyWith(isLoadingMore: false));
      },
    );
  }

  // 다이어리 상세보기
  Future<void> _onGetDiaryById(
    GetDiaryById event,
    Emitter<DiaryState> emit,
  ) async {
    emit(state.copyWith(pageState: DiaryPageState.loading));

    final res = await _getDiaryByIdUseCase.call(event.diaryId);

    res.when(
      success: (diary) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.detailLoaded,
            selectedDiary: diary,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.error,
            message: failure.message,
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
    emit(state.copyWith(pageState: DiaryPageState.loading));

    final res = await _deleteDiaryUseCase.call(event.diaryId);

    res.when(
      success: (_) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.success,
            message: '다이어리가 삭제되었습니다',
            actionType: 'delete',
          ),
        );
        _refreshList();
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: DiaryPageState.error,
            message: '다이어리 삭제 실패 : ${failure.message}',
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
    if (state.pageState != DiaryPageState.loaded) return;

    final source = state.allDiaries;

    if (event.type == null) {
      emit(state.copyWith(diaries: source, currentFilter: null));
      return;
    }

    final filtered = source.where((diary) => diary.type == event.type).toList();

    emit(state.copyWith(diaries: filtered, currentFilter: event.type));
  }

  // 새로고침
  Future<void> _onRefresh(Refresh event, Emitter<DiaryState> emit) async {
    _refreshList();
  }
}
