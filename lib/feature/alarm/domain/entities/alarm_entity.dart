import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_entity.freezed.dart';

// [이재은] : Alarm Entity

@freezed
abstract class AlarmEntity with _$AlarmEntity {
  const factory AlarmEntity({
    int? id,
    String? createdAt,
    required int userId,
    required String type,
    required String content,
    required bool isChecked,
    required Map<String, dynamic>? data,
  }) = _AlarmEntity;
}
