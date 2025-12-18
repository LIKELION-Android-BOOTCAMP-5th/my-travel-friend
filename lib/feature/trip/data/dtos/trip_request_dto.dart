import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/trip_request_entity.dart';

part 'trip_request_dto.freezed.dart';
part 'trip_request_dto.g.dart';

// [엄수빈] 여행 초대 dto

@freezed
abstract class TripRequestDto with _$TripRequestDto {
  const TripRequestDto._();

  const factory TripRequestDto({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'request_id') required int requestId,
    @JsonKey(name: 'target_id') required int targetId,
    @JsonKey(name: 'trip_id') int? tripId,
    @JsonKey(name: 'answered_at') String? answeredAt,
  }) = _TripRequestDto;

  factory TripRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TripRequestDtoFromJson(json);

  TripRequestEntity toEntity() {
    return TripRequestEntity(
      id: id,
      createdAt: createdAt,
      requestId: requestId,
      targetId: targetId,
      tripId: tripId,
      answeredAt: answeredAt,
    );
  }
}
