import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_dto.freezed.dart';
part 'diary_dto.g.dart';

// [이재은] 다이어리 DTO
// -> 추후에 혹 다른 테이블에서 Join 해서 가져오는 데이터가 있을 경우, 편집 필요

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
