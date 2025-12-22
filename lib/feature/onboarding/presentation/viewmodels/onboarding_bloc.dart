import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';
import '../../domain/usecases/get_onboarding_pages_usecase.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingPagesUseCase _getOnboardingPagesUseCase;
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnboardingBloc(
    this._getOnboardingPagesUseCase,
    this._completeOnboardingUseCase,
  ) : super(const OnboardingState()) {
    on<Initialize>(_onInitialize);
    on<NextPage>(_onNextPage);
    on<PrevPage>(_onPrevPage);
    on<GoToPage>(_onGoToPage);
    on<Skip>(_onSkip);
    on<Complete>(_onComplete);
  }

  // 온보딩 초기화
  Future<void> _onInitialize(
    Initialize event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(pageState: OnboardingPageState.loading));

    final res = await _getOnboardingPagesUseCase();

    res.when(
      success: (pages) {
        if (pages.isEmpty) {
          emit(
            state.copyWith(
              pageState: OnboardingPageState.error,
              errorMessage: '온보딩 페이지가 없습니다.',
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            pages: pages,
            currentPage: 0,
            pageState: OnboardingPageState.loaded,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: OnboardingPageState.error,
            errorMessage: failure.message ?? '온보딩을 불러오는데 실패했습니다.',
          ),
        );
      },
    );
  }

  // 다음 페이지로 이동
  // 마지막 페이지면 완료처리
  void _onNextPage(NextPage event, Emitter<OnboardingState> emit) {
    if (state.isLastPage) {
      add(const Complete());
    } else {
      // 다음페이지로 이동
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  // 이전 페이지로 이동
  void _onPrevPage(PrevPage event, Emitter<OnboardingState> emit) {
    if (!state.isFirstPage) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  // 특정 페이지로 이동
  void _onGoToPage(GoToPage event, Emitter<OnboardingState> emit) {
    final pageIndex = event.pageIndex;

    if (pageIndex >= 0 && pageIndex < state.pages.length) {
      emit(state.copyWith(currentPage: pageIndex));
    }
  }

  // 온보딩 건너뛰기
  Future<void> _onSkip(Skip event, Emitter<OnboardingState> emit) async {
    add(const Complete());
  }

  // 온보딩 완료
  Future<void> _onComplete(
    Complete event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(pageState: OnboardingPageState.completing));

    final res = await _completeOnboardingUseCase();

    res.when(
      success: (_) {
        emit(state.copyWith(pageState: OnboardingPageState.completed));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: OnboardingPageState.error,
            errorMessage: failure.message ?? '온보딩 완료 저장에 실패했습니다',
          ),
        );
      },
    );
  }
}
