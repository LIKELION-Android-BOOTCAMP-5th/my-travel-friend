import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo_list_entity.dart';

part 'todo_list_dto.freezed.dart';
part 'todo_list_dto.g.dart';

// [이재은] 투두리스트 DTO
@freezed
abstract class TodoListDTO with _$TodoListDTO {
  const TodoListDTO._();

  const factory TodoListDTO({
    required int id,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    required String content,
    @JsonKey(name: 'is_checked') required bool isChecked,
  }) = _TodoListDTO;

  factory TodoListDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoListDTOFromJson(json);

  factory TodoListDTO.fromEntity(TodoListEntity entity) {
    return TodoListDTO(
      id: entity.id,
      tripId: entity.tripId,
      userId: entity.userId,
      content: entity.content,
      isChecked: entity.isChecked,
    );
  }

  TodoListEntity toEntity() {
    return TodoListEntity(
      id: id,
      tripId: tripId,
      userId: userId,
      content: content,
      isChecked: isChecked,
    );
  }
}
