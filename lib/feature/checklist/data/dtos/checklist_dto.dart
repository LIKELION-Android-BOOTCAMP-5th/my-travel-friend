import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/checklist_entity.dart';

part 'checklist_dto.freezed.dart';
part 'checklist_dto.g.dart';

// [이재은] 체크리스트 DTO
@freezed
abstract class ChecklistDTO with _$ChecklistDTO {
  const ChecklistDTO._();

  const factory ChecklistDTO({
    required int id,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    required String content,
    @JsonKey(name: 'is_checked') required bool isChecked,
  }) = _ChecklistDTO;

  factory ChecklistDTO.fromJson(Map<String, dynamic> json) =>
      _$ChecklistDTOFromJson(json);

  factory ChecklistDTO.fromEntity(ChecklistEntity entity) {
    return ChecklistDTO(
      id: entity.id,
      tripId: entity.tripId,
      userId: entity.userId,
      content: entity.content,
      isChecked: entity.isChecked,
    );
  }

  ChecklistEntity toEntity() {
    return ChecklistEntity(
      id: id,
      tripId: tripId,
      userId: userId,
      content: content,
      isChecked: isChecked,
    );
  }
}
