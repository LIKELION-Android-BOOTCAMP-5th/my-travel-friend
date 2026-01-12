import 'dart:io';

import '../../../../core/result/result.dart';
import '../dtos/diary_dto.dart';

// [이재은] 다이어리 관련 데이터 소스 (추상)
abstract class DiaryDataSource {
  // 공유 다이어리 목록 조회 (여행 ID로)
  Future<Result<List<DiaryDTO>>> getOurDiaries({
    required int tripId,
    required int page,
    required int limit,
  });

  // 내 다이어리 목록 조회 (여행 ID, 내 ID)
  Future<Result<List<DiaryDTO>>> getMyDiaries({
    required int tripId,
    required int userId,
    required int page,
    required int limit,
  });

  // 다이어리 상세 조회 (다이어리 ID)로
  Future<Result<DiaryDTO>> getDiaryById(int id);

  // 다이어리 생성
  Future<Result<DiaryDTO>> createDiary(DiaryDTO diary);

  // 다이어리 수정
  Future<Result<DiaryDTO>> updateDiary(DiaryDTO diary);

  // 다이어리 삭제
  Future<Result<void>> deleteDiary(int id);

  // 이미지 업로드
  Future<Result<String>> uploadImg({required File file, required int userId});

  // 이미지 삭제
  Future<Result<void>> deleteImg(String imgUrl);
}
