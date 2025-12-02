import 'package:supabase_flutter/supabase_flutter.dart';

import '../dtos/diary_dto.dart';
import 'diary_data_source.dart';

// [이재은] 다이어리 관련 데이터 소스 (구현체)
class DiaryDataSourceImpl implements DiaryDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  DiaryDataSourceImpl(this._supabaseClient);

  // 공유 다이어리 목록 조회 (여행 아이디로 전체 가져오기)
  @override
  Future<List<DiaryDTO>> getOurDiaries(int tripId) async {
    final res = await _supabaseClient
        .from('diary')
        .select()
        .eq('trip_id', tripId)
        .eq('is_public', false)
        .order('created_at', ascending: false);

    return (res as List).map((json) => DiaryDTO.fromJson(json)).toList();
  }

  // 내 다이어리 목록 조회 (여행 아이디로 전체 가져오기)
  @override
  Future<List<DiaryDTO>> getMyDiaries(int tripId, int userId) async {
    final res = await _supabaseClient
        .from('diary')
        .select()
        .eq('trip_id', tripId)
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return (res as List).map((json) => DiaryDTO.fromJson(json)).toList();
  }

  // 다이어리 상세 조회 (다이어리 아이디로)
  @override
  Future<DiaryDTO> getDiaryById(int id) async {
    final res = await _supabaseClient
        .from('diary')
        .select()
        .eq('id', id)
        .single();

    return DiaryDTO.fromJson(res);
  }

  // 다이어리 생성
  @override
  Future<DiaryDTO> createDiary(DiaryDTO diary) async {
    final res = await _supabaseClient
        .from('diary')
        .insert(diary.toJson())
        .select()
        .single();

    return DiaryDTO.fromJson(res);
  }

  // 다이어리 수정
  @override
  Future<DiaryDTO> updateDiary(DiaryDTO diary) async {
    final res = await _supabaseClient
        .from('diary')
        .update(diary.toJson())
        .eq('id', diary.id!)
        .select()
        .single();

    return DiaryDTO.fromJson(res);
  }

  // 다이어리 삭제
  @override
  Future<void> deleteDiary(int id) async {
    await _supabaseClient.from('diary').delete().eq('id', id);
  }
}
