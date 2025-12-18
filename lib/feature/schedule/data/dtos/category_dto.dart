import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDTO with _$CategoryDTO {
  const CategoryDTO._();

  const factory CategoryDTO({required int id, required String content}) =
      _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, content: content);
  }
}
