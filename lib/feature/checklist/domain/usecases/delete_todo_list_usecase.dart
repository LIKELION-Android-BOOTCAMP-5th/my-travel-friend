import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/checklist/domain/repositories/todo_list_repository.dart';

// [이재은] 투두리스트 삭제 usecase
@LazySingleton()
class DeleteTodoListUseCase {
  final TodoListRepository _todoListRepository;

  DeleteTodoListUseCase(this._todoListRepository);

  // 투두리스트 삭제
  Future<Result<void>> call(int id) {
    return _todoListRepository.deleteTodoList(id);
  }
}
