import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/todo_list_dto.dart';
import 'todo_list_data_source.dart';

// [이재은] 투두리스트 관련 데이터 소스(구현화)
@LazySingleton(as: TodoListDataSource)
class TodoListDataSourceImpl implements TodoListDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  TodoListDataSourceImpl(this._supabaseClient);

  // 내 투두리스트 가져오기
  Future<Result<List<TodoListDTO>>> getMyTodoLists({
    required int tripId,
    required int userId,
  }) async {
    try {
      final res = await _supabaseClient
          .from('todo_list')
          .select()
          .eq('trip_id', tripId)
          .eq('user_id', userId)
          .order('created_at');

      final list = (res as List)
          .map((json) => TodoListDTO.fromJson(json))
          .toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 투두리스트 생성
  @override
  Future<Result<TodoListDTO>> createTodoList(TodoListDTO todolist) async {
    try {
      final insertData = todolist.toJson()
        ..remove('id')
        ..remove('trip_id')
        ..remove('user_id')
        ..remove('created_at')
        ..remove('is_checked');

      final res = await _supabaseClient
          .from('todo_list')
          .insert(insertData)
          .select()
          .single();

      final list = TodoListDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 투두리스트 삭제
  @override
  Future<Result<void>> deleteTodoList(int id) async {
    try {
      await _supabaseClient.from('todo_list').delete().eq('id', id);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
