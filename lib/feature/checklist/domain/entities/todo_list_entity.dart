import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_entity.freezed.dart';

// [이재은] : To do List Entity
@freezed
abstract class TodoListEntity with _$TodoListEntity {
  const factory TodoListEntity({
    required int id,
    String? createdAt,
    required int tripId,
    required int userId,
    required String content,
    required bool isChecked,
  }) = _TodoListEntity;
}
