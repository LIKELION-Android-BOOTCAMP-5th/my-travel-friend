import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

class GetDiariesUseCase {
  final DiaryRepository _diaryRepository;

  GetDiariesUseCase(this._diaryRepository);

  // 다이어리 목록 가져오기
  Future<List<DiaryEntity>> call(String tripId) {
    return _diaryRepository.getDiaries(tripId);
  }
}
