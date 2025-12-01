import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entity.freezed.dart';

// [이재은] : Diary Entity 생성

@freezed
abstract class DiaryEntity with _$DiaryEntity {
  const factory DiaryEntity({
    required int id,
    String? createdAt,
    required int tripId,
    required int userId,
    required bool isPublic,
    required String type,
    String? title,
    int? scheduleId,
    String? img,
    int? rating,
    String? content,
    int? cost,
  }) = _DiaryEntity;
}
