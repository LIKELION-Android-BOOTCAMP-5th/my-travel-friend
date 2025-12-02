import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_entity.freezed.dart';

@freezed
abstract class TripEntity with _$TripEntity {
  const factory TripEntity({
    int? id,
    String? createdAt,
    required String title,
    required String place,
    required String startAt,
    required String endAt,
    required String coverType,
    String? coverImg,
    required int userId,
    String? deletedAt,
    required String country,
  }) = _TripEntity;
}
