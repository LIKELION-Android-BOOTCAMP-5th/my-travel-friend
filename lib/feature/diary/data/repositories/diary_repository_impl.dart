import '../../domain/entities/diary_entity.dart';
import '../../domain/repositories/diary_repository.dart';
import '../datasources/diary_data_source.dart';
import '../dtos/diary_dto.dart';

// [이재은] 다이어리 repository
class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryDataSource _dataSource;
  DiaryRepositoryImpl(this._dataSource);

  // 공유 다이어리 목록 가져오기
  @override
  Future<List<DiaryEntity>> getOurDiaries(int tripId) async {
    try {
      final res = await _dataSource.getOurDiaries(tripId);
      return res.map((dto) => dto.toEntity()).toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // 내 다이어리 목록 가져오기
  @override
  Future<List<DiaryEntity>> getMyDiaries(int tripId, int userId) async {
    try {
      final res = await _dataSource.getMyDiaries(tripId, userId);
      return res.map((dto) => dto.toEntity()).toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // 다이어리 상세 조회 (아이디로)
  Future<DiaryEntity> getDiaryById(int id) async {
    try {
      final res = await _dataSource.getDiaryById(id);
      return res.toEntity();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // 다이어리 생성
  Future<DiaryEntity> createDiary(DiaryEntity diary) async {
    try {
      final res = DiaryDTO(
        tripId: diary.tripId,
        userId: diary.userId,
        isPublic: diary.isPublic,
        type: diary.type,
        title: diary.title,
        scheduleId: diary.scheduleId,
        img: diary.img,
        rating: diary.rating,
        content: diary.content,
        cost: diary.cost,
      );

      final result = await _dataSource.createDiary(res);
      return result.toEntity();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // 다이어리 수정
  Future<DiaryEntity> updateDiary(DiaryEntity diary) async {
    try {
      final res = DiaryDTO(
        tripId: diary.tripId,
        userId: diary.userId,
        isPublic: diary.isPublic,
        type: diary.type,
        title: diary.title,
        scheduleId: diary.scheduleId,
        img: diary.img,
        rating: diary.rating,
        content: diary.content,
        cost: diary.cost,
      );

      final result = await _dataSource.updateDiary(res);
      return result.toEntity();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // 다이어리 삭제
  Future<void> deleteDiary(int id) async {
    try {
      await _dataSource.deleteDiary(id);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
