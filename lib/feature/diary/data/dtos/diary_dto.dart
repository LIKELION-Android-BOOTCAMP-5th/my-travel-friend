import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_dto.freezed.dart';
part 'diary_dto.g.dart';

@freezed
abstract class DiaryDTO with _$DiaryDTO {
  const DiaryDTO._();

  const factory DiaryDTO({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'is_public') required bool isPublic,
    required String type,
    String? title,
    @JsonKey(name: 'schedule_id') int? scheduleId,
    String? img,
    int? rating,
    String? content,
    int? cost,
  }) = _DiaryDTO;

  factory DiaryDTO.fromJson(Map<String, dynamic> json) =>
      _$DiaryDTOFromJson(json);

  DiaryEntity toEntity() {
    return DiaryEntity(
      id: id,
      createdAt: createdAt,
      tripId: tripId,
      userId: userId,
      isPublic: isPublic,
      type: type,
      title: title,
      scheduleId: scheduleId,
      img: img,
      content: content,
      cost: cost,
    );
  }
}
