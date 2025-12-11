import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/schedule_entity.dart';

part 'schedule_dto.freezed.dart';
part 'schedule_dto.g.dart';

// 신강현  스케줄 dto
@freezed
abstract class ScheduleDTO with _$ScheduleDTO {
  const ScheduleDTO._();

  const factory ScheduleDTO({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user') Map<String, dynamic>? userJson,
    required String title,
    String? place,
    @JsonKey(name: 'adress') String? address,
    double? lat,
    double? lng,
    required String date,
    String? description,
    @JsonKey(name: 'category_id') required int categoryId,
  }) = _ScheduleDTO;

  factory ScheduleDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDTOFromJson(json);

  factory ScheduleDTO.fromEntity(ScheduleEntity entity) => ScheduleDTO(
    id: entity.id,
    createdAt: entity.createdAt,
    tripId: entity.tripId,
    title: entity.title,
    place: entity.place,
    address: entity.address,
    lat: entity.lat,
    lng: entity.lng,
    date: entity.date,
    description: entity.description,
    categoryId: entity.categoryId,
  );

  ScheduleEntity toEntity() {
    UserEntity? userEntity;
    if (userJson != null) {
      userEntity = UserDTO.fromJson(userJson!).toEntity();
    }

    return ScheduleEntity(
      id: id,
      createdAt: createdAt,
      tripId: tripId,
      title: title,
      place: place,
      address: address,
      lat: lat,
      lng: lng,
      date: date,
      description: description,
      categoryId: categoryId,
      user: userEntity,
    );
  }
}
