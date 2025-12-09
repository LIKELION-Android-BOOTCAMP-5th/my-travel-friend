import '../../../../core/result/result.dart';
import '../entities/todo_list_entity.dart';

// [이재은] 투두리스트 관련 domain repositories
abstract class TodoListRepository {
  // 투두리스트 목록 가져오기
  // -> 여행아이디, 유저아이디로 가져오기
  // 페이지네이션 없음
  Future<Result<List<TodoListEntity>>> getMyTodoLists(int tripId, int userId);

  // 투두리스트 추가
  Future<Result<TodoListEntity>> createTodoList(TodoListEntity todolist);

  // 투두리스트 삭제
  Future<Result<void>> deleteTodoList(int id);
}
