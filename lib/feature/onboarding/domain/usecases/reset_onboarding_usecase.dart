import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/onboarding/domain/repositories/onboarding_repository.dart';

import '../../../../core/result/result.dart';

@LazySingleton()
class ResetOnboardingUseCase {
  final OnboardingRepository _onboardingRepository;

  ResetOnboardingUseCase(this._onboardingRepository);

  Future<Result<void>> call() async {
    return await _onboardingRepository.resetOnboarding();
  }
}
