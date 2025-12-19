// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingDTO _$OnboardingDTOFromJson(Map<String, dynamic> json) =>
    _OnboardingDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      index: (json['index'] as num).toInt(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$OnboardingDTOToJson(_OnboardingDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_path': instance.imagePath,
      'index': instance.index,
      'is_active': instance.isActive,
    };
