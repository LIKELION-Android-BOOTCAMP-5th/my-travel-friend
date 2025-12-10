import 'package:my_travel_friend/core/result/result.dart';

import '../dtos/todo_list_dto.dart';

// [이재은] 투두리스트 관련 데이터 소스 (추상)
abstract class TodoListDataSource {
  // 투두리스트 목록 조회
  Future<Result<List<TodoListDTO>>> getMyTodoLists({
    required int tripId,
    required int userId,
  });

  // 투두리스트 생성
  Future<Result<TodoListDTO>> createTodoList(TodoListDTO todolist);

  // 투두리스트 삭제
  Future<Result<void>> deleteTodoList(int id);

  // 투두리스트 체크 토글
  Future<Result<TodoListDTO>> toggleTodoList({
    required int id,
    required bool isChecked,
  });
}
