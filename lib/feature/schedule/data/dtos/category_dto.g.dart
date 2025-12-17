// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => _CategoryDTO(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$CategoryDTOToJson(_CategoryDTO instance) =>
    <String, dynamic>{'id': instance.id, 'content': instance.content};
