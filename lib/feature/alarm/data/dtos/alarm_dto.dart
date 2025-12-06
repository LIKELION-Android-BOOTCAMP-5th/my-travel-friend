import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/alarm_entity.dart';

part 'alarm_dto.freezed.dart';
part 'alarm_dto.g.dart';

// [이재은] 알림 DTO

@freezed
abstract class AlarmDTO with _$AlarmDTO {
  const AlarmDTO._();

  const factory AlarmDTO({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'user_id') required int userId,
    required String type,
    required String content,
    @JsonKey(name: 'is_checked') required bool isChecked,
    required Map<String, dynamic>? data,
  }) = _AlarmDTO;

  factory AlarmDTO.fromJson(Map<String, dynamic> json) =>
      _$AlarmDTOFromJson(json);

  AlarmEntity toEntity() {
    return AlarmEntity(
      id: id,
      createdAt: createdAt,
      userId: userId,
      type: type,
      content: content,
      isChecked: isChecked,
      data: data,
    );
  }
}
