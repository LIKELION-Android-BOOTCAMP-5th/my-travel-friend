import 'package:my_travel_friend/feature/diary/domain/entities/diary_entity.dart';

// [이재은] 다이어리 관련
abstract class DiaryRepository {
  // 공유 다이어리 목록 조회(가져오기)
  // -> 여행 아이디로 다이어리 조회, 단 비공개 처리된 게시물은 가져오지 않음
  Future<List<DiaryEntity>> getOurDiaries(String tripId);

  // 내 다이어리 목록 조회 (가져오기)
  // -> 여행 아이디, 내 아이디로 조회, 비공개 처리 게시물 포함
  Future<List<DiaryEntity>> getMyDiaries(String tripId, String userId);

  // 다이어리 상세 조회 (가져오기)
  // -> 다이어리 아이디로 조회
  Future<DiaryEntity> getDiaryById(String id);

  // 다이어리 생성
  Future<DiaryEntity> createDiary(DiaryEntity DiaryEntity);

  // 다이어리 수정
  Future<DiaryEntity> updateDiary(DiaryEntity DiaryEntity);

  // 다이어리 삭제
  Future<void> deleteDiary(String id);
}
