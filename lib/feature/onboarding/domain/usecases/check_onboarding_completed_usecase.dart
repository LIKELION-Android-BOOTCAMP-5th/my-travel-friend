import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../repositories/onboarding_repository.dart';

// [이재은] 온보딩 완료 여부를 확인하는 UseCase
@LazySingleton()
class CheckOnboardingCompletedUseCase {
  final OnboardingRepository _onboardingRepository;

  CheckOnboardingCompletedUseCase(this._onboardingRepository);

  Future<Result<bool>> call() async {
    return await _onboardingRepository.isOnboardingCompleted();
  }
}
