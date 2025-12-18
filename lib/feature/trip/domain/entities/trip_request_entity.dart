import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_request_entity.freezed.dart';

@freezed
abstract class TripRequestEntity with _$TripRequestEntity {
  const factory TripRequestEntity({
    int? id,
    String? createdAt,
    required int requestId,
    required int targetId,
    int? tripId,
    String? answeredAt,
  }) = _TripRequestEntity;
}
