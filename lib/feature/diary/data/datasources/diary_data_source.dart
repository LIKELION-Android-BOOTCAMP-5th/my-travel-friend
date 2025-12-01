import '../dtos/diary_dto.dart';

// [이재은] 다이어리 관련 데이터 소스 (추상)
abstract class DiaryDataSource {
  // 공유 다이어리 목록 조회 (여행 ID로)
  Future<List<DiaryDTO>> getOurDiaries(int tripId);

  // 내 다이어리 목록 조회 (여행 ID, 내 ID)
  Future<List<DiaryDTO>> getMyDiaries(int tripId, int userId);

  // 다이어리 상세 조회 (다이어리 ID)로
  Future<DiaryDTO> getDiaryById(int id);

  // 다이어리 생성
  Future<DiaryDTO> createDiary(DiaryDTO diary);

  // 다이어리 수정
  Future<DiaryDTO> updateDiary(DiaryDTO diary);

  // 다이어리 삭제
  Future<void> deleteDiary(int id);
}
