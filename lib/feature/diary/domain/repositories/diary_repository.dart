import '../entities/diary_entity.dart';

// [이재은] 다이어리 관련 domain repositories
abstract class DiaryRepository {
  // 다이어리 목록 조회(가져오기)
  // -> 여행 아이디로 다이어리 조회
  Future<List<DiaryEntity>> getDiaries(int tripId);

  // 다이어리 상세 조회 (가져오기)
  // -> 다이어리 아이디로 조회
  Future<DiaryEntity> getDiaryById(int id);

  // 다이어리 생성
  Future<DiaryEntity> createDiary(DiaryEntity diary);

  // 다이어리 수정
  Future<DiaryEntity> updateDiary(DiaryEntity diary);

  // 다이어리 삭제
  Future<void> deleteDiary(int id);
}
