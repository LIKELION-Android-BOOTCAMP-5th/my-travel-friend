import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/diary_dto.dart';
import 'diary_data_source.dart';

// [이재은] 다이어리 관련 데이터 소스 (구현체)
@LazySingleton(as: DiaryDataSource)
class DiaryDataSourceImpl implements DiaryDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  DiaryDataSourceImpl(this._supabaseClient);

  // 공유 다이어리 목록 조회 (여행 아이디로 전체 가져오기)
  @override
  Future<Result<List<DiaryDTO>>> getOurDiaries(int tripId) async {
    try {
      final res = await _supabaseClient
          .from('diary')
          .select()
          .eq('trip_id', tripId)
          .eq('is_public', false)
          .order('created_at', ascending: false);

      final list = (res as List)
          .map((json) => DiaryDTO.fromJson(json))
          .toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 내 다이어리 목록 조회 (여행 아이디로 전체 가져오기)
  @override
  Future<Result<List<DiaryDTO>>> getMyDiaries(int tripId, int userId) async {
    try {
      final res = await _supabaseClient
          .from('diary')
          .select()
          .eq('trip_id', tripId)
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final list = (res as List)
          .map((json) => DiaryDTO.fromJson(json))
          .toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 다이어리 상세 조회 (다이어리 아이디로)
  @override
  Future<Result<DiaryDTO>> getDiaryById(int id) async {
    try {
      final res = await _supabaseClient
          .from('diary')
          .select()
          .eq('id', id)
          .single();

      final list = DiaryDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 다이어리 생성
  @override
  Future<Result<DiaryDTO>> createDiary(DiaryDTO diary) async {
    try {
      final res = await _supabaseClient
          .from('diary')
          .insert(diary.toJson())
          .select()
          .single();

      final list = DiaryDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 다이어리 수정
  @override
  Future<Result<DiaryDTO>> updateDiary(DiaryDTO diary) async {
    try {
      final res = await _supabaseClient
          .from('diary')
          .update(diary.toJson())
          .eq('id', diary.id!)
          .select()
          .single();

      final list = DiaryDTO.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 다이어리 삭제
  @override
  Future<Result<void>> deleteDiary(int id) async {
    try {
      await _supabaseClient.from('diary').delete().eq('id', id);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
