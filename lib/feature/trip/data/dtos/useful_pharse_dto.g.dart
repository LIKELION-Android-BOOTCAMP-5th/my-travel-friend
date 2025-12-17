// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_pharse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsefulPharseDTO _$UsefulPharseDTOFromJson(Map<String, dynamic> json) =>
    _UsefulPharseDTO(
      id: (json['id'] as num).toInt(),
      country: json['country'] as String,
      native: json['native'] as String,
      korean: json['korean'] as String,
      mean: json['mean'] as String,
    );

Map<String, dynamic> _$UsefulPharseDTOToJson(_UsefulPharseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'native': instance.native,
      'korean': instance.korean,
      'mean': instance.mean,
    };
