import 'package:freezed_annotation/freezed_annotation.dart';

part 'useful_pharse_entity.freezed.dart';

@freezed
abstract class UsefulPharseEntity with _$UsefulPharseEntity {
  const factory UsefulPharseEntity({
    required int id,
    required String country,
    required String native,
    required String korean,
    required String mean,
  }) = _UsefulPharseEntity;
}
