import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/onboarding_entity.dart';

part 'onboarding_state.freezed.dart';

// [이재은] 온보딩 state

enum OnboardingPageState {
  initial,
  loading,
  loaded,
  completing,
  completed,
  error,
}

// 온보딩 화면 상태
@freezed
abstract class OnboardingState with _$OnboardingState {
  const OnboardingState._();

  const factory OnboardingState({
    // 현재 페이지 인덱스 (0부터)
    @Default(0) int currentPage,

    // 온보딩 페이지 목록
    @Default([]) List<OnboardingEntity> pages,

    // 페이지 상태
    @Default(OnboardingPageState.initial) OnboardingPageState pageState,

    // 에러메세지
    String? errorMessage,
  }) = _OnboardingState;

  // 마지막 페이지인가?
  bool get isLastPage => pages.isNotEmpty && currentPage == pages.length - 1;

  // 첫번째 페이지인가
  bool get isFirstPage => currentPage == 0;

  // 전체 페이지 수
  int get totalPages => pages.length;

  // 진행률
  double get progress => pages.isEmpty ? 0.0 : (currentPage + 1) / pages.length;

  // 현재 페이지 entity
  OnboardingEntity? get currentPageEntity =>
      pages.isNotEmpty && currentPage < pages.length
      ? pages[currentPage]
      : null;

  // 온보딩 완료됨(화면 이동 트리거)
  bool get shouldNavigateToLogin => pageState == OnboardingPageState.completed;
}
