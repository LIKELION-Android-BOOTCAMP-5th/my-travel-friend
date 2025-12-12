import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/checklist/domain/entities/todo_list_entity.dart';

import '../repositories/todo_list_repository.dart';

// [이재은] 내 투두리스트 목록 조회 usecase
@LazySingleton()
class GetMyTodoListUseCase {
  final TodoListRepository _todolistRepository;

  GetMyTodoListUseCase(this._todolistRepository);

  // 체크리스트 목록 가져오기
  Future<Result<List<TodoListEntity>>> call({
    required int tripId,
    required int userId,
  }) {
    return _todolistRepository.getMyTodoLists(tripId, userId);
  }
}
