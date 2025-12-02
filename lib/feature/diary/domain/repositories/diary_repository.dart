import '../../../../core/result/result.dart';
import '../entities/diary_entity.dart';

// [이재은] 다이어리 관련 domain repositories
abstract class DiaryRepository {
  // 공유 다이어리 목록 조회(가져오기)
  // -> 여행 아이디로 가져오기, 단 비공개 제외
  Future<Result<List<DiaryEntity>>> getOurDiaries(int tripId);

  // 내 다이어리 목록 조회 (가져오기)
  // -> 여행 아이디로 가져오기, 단 내 아이디만
  Future<Result<List<DiaryEntity>>> getMyDiaries(int tripId, int userId);

  // 다이어리 상세 조회 (가져오기)
  // -> 다이어리 아이디로 조회
  Future<Result<DiaryEntity>> getDiaryById(int id);

  // 다이어리 생성
  Future<Result<DiaryEntity>> createDiary(DiaryEntity diary);

  // 다이어리 수정
  Future<Result<DiaryEntity>> updateDiary(DiaryEntity diary);

  // 다이어리 삭제
  Future<Result<void>> deleteDiary(int id);
}
