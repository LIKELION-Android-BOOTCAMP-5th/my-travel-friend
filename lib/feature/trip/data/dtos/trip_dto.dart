import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

part 'trip_dto.freezed.dart';
part 'trip_dto.g.dart';

//신강현
//dto 파일에 fromEntity 추가
@freezed
abstract class TripDto with _$TripDto {
  const TripDto._();

  const factory TripDto({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    required String title,
    required String place,
    @JsonKey(name: 'start_at') required String startAt,
    @JsonKey(name: 'end_at') required String endAt,
    @JsonKey(name: 'cover_type') required String coverType,
    @JsonKey(name: 'cover_img') String? coverImg,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    required String country,
  }) = _TripDto;

  factory TripDto.fromJson(Map<String, dynamic> json) =>
      _$TripDtoFromJson(json);

  TripEntity toEntity() {
    return TripEntity(
      id: id,
      createdAt: createdAt,
      title: title,
      place: place,
      startAt: startAt,
      endAt: endAt,
      coverType: coverType,
      userId: userId,
      country: country,
      coverImg: coverImg,
      deletedAt: deletedAt,
    );
  }

  TripDto formEntity(TripEntity entity) {
    return TripDto(
      id: entity.id,
      createdAt: entity.createdAt,
      title: entity.title,
      place: entity.place,
      startAt: entity.startAt,
      endAt: entity.endAt,
      coverType: entity.coverType,
      userId: entity.userId,
      country: entity.country,
      coverImg: entity.coverImg,
      deletedAt: entity.deletedAt,
    );
  }
}
