import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/diary_entity.dart';

part 'diary_dto.freezed.dart';
part 'diary_dto.g.dart';

// [이재은] 다이어리 DTO

@freezed
abstract class DiaryDTO with _$DiaryDTO {
  const DiaryDTO._();

  const factory DiaryDTO({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'user') Map<String, dynamic>? userJson,
    @JsonKey(name: 'is_public') required bool isPublic,
    required String type,
    String? title,
    @JsonKey(name: 'schedule_id') int? scheduleId,
    String? img,
    double? rating,
    String? content,
    int? cost,
    String? currency,
  }) = _DiaryDTO;

  factory DiaryDTO.fromJson(Map<String, dynamic> json) =>
      _$DiaryDTOFromJson(json);

  factory DiaryDTO.fromEntity(DiaryEntity entity) {
    return DiaryDTO(
      id: entity.id,
      createdAt: entity.createdAt,
      tripId: entity.tripId,
      userId: entity.userId,
      isPublic: entity.isPublic,
      type: entity.type,
      title: entity.title,
      scheduleId: entity.scheduleId,
      img: entity.img,
      rating: entity.rating,
      content: entity.content,
      cost: entity.cost,
      currency: entity.currency,
    );
  }

  DiaryEntity toEntity() {
    UserEntity? userEntity;
    if (userJson != null) {
      userEntity = UserDTO.fromJson(userJson!).toEntity();
    }

    return DiaryEntity(
      id: id,
      createdAt: createdAt,
      tripId: tripId,
      userId: userId,
      user: userEntity,
      isPublic: isPublic,
      type: type,
      title: title,
      scheduleId: scheduleId,
      img: img,
      rating: rating,
      content: content,
      cost: cost,
      currency: currency,
    );
  }
}
