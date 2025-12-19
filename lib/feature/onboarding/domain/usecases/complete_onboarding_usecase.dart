import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/onboarding_repository.dart';

// [이재은] 온보딩 완료 상태 저장
@LazySingleton()
class CompleteOnboardingUseCase {
  final OnboardingRepository _onboardingRepository;

  CompleteOnboardingUseCase(this._onboardingRepository);

  Future<Result<void>> call() async {
    return await _onboardingRepository.setOnboardingCompleted();
  }
}
