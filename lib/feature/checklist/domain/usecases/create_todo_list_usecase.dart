import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/checklist/domain/entities/todo_list_entity.dart';
import 'package:my_travel_friend/feature/checklist/domain/repositories/todo_list_repository.dart';

// [이재은] 투두리스트 생성 usecase
@LazySingleton()
class CreateTodoListUseCase {
  final TodoListRepository _todoListRepository;

  CreateTodoListUseCase(this._todoListRepository);

  // 투두리스트 생성
  Future<Result<TodoListEntity>> call(TodoListEntity todolist) {
    return _todoListRepository.createTodoList(todolist);
  }
}
