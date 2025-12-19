import 'package:my_travel_friend/feature/onboarding/domain/entities/onboarding_entity.dart';

import '../../../../core/result/result.dart';

abstract class OnboardingDataSource {
  // 온보딩 완료 여부 확인
  Future<Result<bool>> isOnboardingCompleted();

  // 온보딩 완료 상태 확인
  Future<Result<void>> setOnboardingCompleted();

  // 온보딩 상태 초기화
  Future<Result<void>> resetOnboarding();

  // 온보딩 페이지 목록 조회
  Future<Result<List<OnboardingEntity>>> getOnboardingPages();
}
