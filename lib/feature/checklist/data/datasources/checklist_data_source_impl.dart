import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../dtos/checklist_dto.dart';
import 'checklist_data_source.dart';

// [이재은] 체크리스트 관련 데이터 소스(구현화)
@LazySingleton(as: ChecklistDataSource)
class ChecklistDataSourceImpl implements ChecklistDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  ChecklistDataSourceImpl(this._supabaseClient);

  // 내 체크리스트 가져오기
  Future<Result<List<ChecklistDTO>>> getMyChecklists({
    required int tripId,
    required int userId,
  }) async {
    try {
      final res = await _supabaseClient
          .from('checklist')
          .select()
          .eq('trip_id', tripId)
          .eq('user_id', userId)
          .order('created_at');

      final list = (res as List)
          .map((json) => ChecklistDTO.fromJson(json))
          .toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 체크리스트 생성
  @override
  Future<Result<ChecklistDTO>> createChecklist(ChecklistDTO checklist) async {
    try {
      final insertData = checklist.toJson()
        ..remove('id')
        ..remove('created_at');

      final res = await _supabaseClient
          .from('checklist')
          .insert(insertData)
          .select()
          .single();

      final list = ChecklistDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 체크리스트 삭제
  @override
  Future<Result<void>> deleteChecklist(int id) async {
    try {
      await _supabaseClient.from('checklist').delete().eq('id', id);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 체크리스트 토글
  @override
  Future<Result<ChecklistDTO>> toggleChecklist({
    required int id,
    required bool isChecked,
  }) async {
    try {
      final res = await _supabaseClient
          .from('checklist')
          .update({'is_checked': isChecked})
          .eq('id', id)
          .select()
          .single();

      return Result.success(ChecklistDTO.fromJson(res));
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
