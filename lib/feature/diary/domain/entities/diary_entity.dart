import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';

part 'diary_entity.freezed.dart';

// [이재은] : Diary Entity

@freezed
abstract class DiaryEntity with _$DiaryEntity {
  const factory DiaryEntity({
    int? id,
    String? createdAt,
    required int tripId,
    required int userId,
    UserEntity? user,
    required bool isPublic,
    required String type,
    String? title,
    int? scheduleId,
    String? img,
    double? rating,
    String? content,
    int? cost,
    String? currency,
    String? payment,
  }) = _DiaryEntity;
}
