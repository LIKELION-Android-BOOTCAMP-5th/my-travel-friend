import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

// 온보딩 화면 이벤트
@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  // 온보딩 초기화 (첫페이지 표시, 페이지 목록 가져오기)
  const factory OnboardingEvent.initialize() = Initialize;

  // 다음 페이지로 이동
  const factory OnboardingEvent.nextPage() = NextPage;

  // 이전 페이지로 이동
  const factory OnboardingEvent.prevPage() = PrevPage;

  // 특정 페이지로 이동
  const factory OnboardingEvent.goToPage({required int pageIndex}) = GoToPage;

  // 건너뛰기
  const factory OnboardingEvent.skip() = Skip;

  // 온보딩 완료
  const factory OnboardingEvent.complete() = Complete;
}
