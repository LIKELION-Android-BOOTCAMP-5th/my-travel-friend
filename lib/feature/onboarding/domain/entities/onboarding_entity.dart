import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_entity.freezed.dart';

// [이재은] 온보딩 페이지 entity
@freezed
abstract class OnboardingEntity with _$OnboardingEntity {
  const factory OnboardingEntity({
    required int id,
    required String title,
    required String description,
    required String imagePath,
  }) = _OnboardingEntity;
}
