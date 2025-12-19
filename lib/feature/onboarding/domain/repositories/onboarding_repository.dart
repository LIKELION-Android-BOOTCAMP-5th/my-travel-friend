import '../../../../core/result/result.dart';
import '../entities/onboarding_entity.dart';

// 온보딩 관련 데이터 접근을 위한 repository
abstract class OnboardingRepository {
  // 온보딩 완료 여부 확인
  Future<Result<bool>> isOnboardingCompleted();

  // 온보딩 완료 상태 저장
  Future<Result<void>> setOnboardingCompleted();

  // 온보딩 상태 초기화
  Future<Result<void>> resetOnboarding();

  // 온보딩 페이지 목록 가져오기
  Future<Result<List<OnboardingEntity>>> getOnboardingPages();
}
