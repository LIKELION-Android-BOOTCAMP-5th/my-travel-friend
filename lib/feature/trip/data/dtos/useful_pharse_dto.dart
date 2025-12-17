import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/useful_pharse_entity.dart';

part 'useful_pharse_dto.freezed.dart';
part 'useful_pharse_dto.g.dart';

@freezed
abstract class UsefulPharseDTO with _$UsefulPharseDTO {
  const UsefulPharseDTO._();

  const factory UsefulPharseDTO({
    required int id,
    required String country,
    required String native,
    required String korean,
    required String mean,
  }) = _UsefulPharseDTO;

  factory UsefulPharseDTO.fromJson(Map<String, dynamic> json) =>
      _$UsefulPharseDTOFromJson(json);

  UsefulPharseEntity toEntity() {
    return UsefulPharseEntity(
      id: id,
      country: country,
      native: native,
      korean: korean,
      mean: mean,
    );
  }
}
