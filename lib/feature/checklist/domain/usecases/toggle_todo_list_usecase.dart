import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/todo_list_entity.dart';
import '../repositories/todo_list_repository.dart';

// [이재은] 투두리스트 체크 표시
@LazySingleton()
class ToggleTodoListUseCase {
  final TodoListRepository _todoListRepository;

  ToggleTodoListUseCase(this._todoListRepository);

  // 투두리스트 체크 표시
  Future<Result<TodoListEntity>> call({
    required int id,
    required bool isChecked,
  }) {
    return _todoListRepository.toggleTodoList(id, isChecked);
  }
}
