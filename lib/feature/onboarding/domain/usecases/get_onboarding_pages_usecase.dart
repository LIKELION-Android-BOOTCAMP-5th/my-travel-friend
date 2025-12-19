import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/onboarding/domain/entities/onboarding_entity.dart';

import '../repositories/onboarding_repository.dart';

// [이재은] 온보딩 페이지 목록 가져오기 usecase
@LazySingleton()
class GetOnboardingPagesUseCase {
  final OnboardingRepository _onboardingRepository;

  GetOnboardingPagesUseCase(this._onboardingRepository);

  Future<List<OnboardingEntity>> call() {
    return _onboardingRepository.getOnboardingPages();
  }
}
