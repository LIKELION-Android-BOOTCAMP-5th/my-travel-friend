import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_entity.freezed.dart';

// [이재은] : Checklist Entity

@freezed
abstract class ChecklistEntity with _$ChecklistEntity {
  const factory ChecklistEntity({
    required int id,
    String? createdAt,
    required int tripId,
    required int userId,
    required String content,
    required bool isChecked,
  }) = _ChecklistEntity;
}
