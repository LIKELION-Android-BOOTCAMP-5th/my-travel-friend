import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/onboarding_entity.dart';

part 'onboarding_dto.freezed.dart';
part 'onboarding_dto.g.dart';

// [이재은] 온보딩 DTO

@freezed
abstract class OnboardingDTO with _$OnboardingDTO {
  const OnboardingDTO._();

  const factory OnboardingDTO({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'image_path') required String imagePath,
    required int index,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _OnboardingDTO;

  factory OnboardingDTO.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDTOFromJson(json);

  OnboardingEntity toEntity() {
    return OnboardingEntity(
      title: title,
      description: description,
      imagePath: imagePath,
      isActive: isActive,
      id: id,
      index: index,
    );
  }
}
