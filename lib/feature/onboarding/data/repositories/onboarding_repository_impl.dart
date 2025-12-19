import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_data_source.dart';

// [이재은] 온보딩 repository 구현체
@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource _dataSource;

  OnboardingRepositoryImpl(this._dataSource);

  @override
  Future<Result<bool>> isOnboardingCompleted() async {
    return await _dataSource.isOnboardingCompleted();
  }

  @override
  Future<Result<void>> setOnboardingCompleted() async {
    return await _dataSource.setOnboardingCompleted();
  }

  @override
  Future<Result<void>> resetOnboarding() async {
    return await _dataSource.resetOnboarding();
  }

  @override
  Future<Result<List<OnboardingEntity>>> getOnboardingPages() async {
    return await _dataSource.getOnboardingPages();
  }
}
