import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../domain/entities/todo_list_entity.dart';
import '../../domain/repositories/todo_list_repository.dart';
import '../datasources/todo_list_data_source.dart';
import '../dtos/todo_list_dto.dart';

@LazySingleton(as: TodoListRepository)
class TodoListRepositoryImpl implements TodoListRepository {
  final TodoListDataSource _dataSource;

  TodoListRepositoryImpl(this._dataSource);

  // 나의 투두리스트 가져오기
  @override
  Future<Result<List<TodoListEntity>>> getMyTodoLists(
    int tripId,
    int userId,
  ) async {
    final res = await _dataSource.getMyTodoLists(
      tripId: tripId,
      userId: userId,
    );
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 투두리스트 생성
  @override
  Future<Result<TodoListEntity>> createTodoList(TodoListEntity todolist) async {
    final dto = TodoListDTO.fromEntity(todolist);

    final res = await _dataSource.createTodoList(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 투두리스트 삭제
  @override
  Future<Result<void>> deleteTodoList(int id) async {
    return await _dataSource.deleteTodoList(id);
  }

  // 투두리스트 체크 토글
  @override
  Future<Result<TodoListEntity>> toggleTodoList(int id, bool isChecked) async {
    final res = await _dataSource.toggleTodoList(id: id, isChecked: isChecked);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }
}
