import 'package:my_travel_friend/feature/diary/domain/entities/diary_entity.dart';

import '../repositories/diary_repository.dart';

class CreateDiaryUsecase {
  final DiaryRepository _diaryRepository;

  CreateDiaryUsecase(this._diaryRepository);

  // 다이어리 생성
  Future<DiaryEntity> call(DiaryEntity diary) {
    return _diaryRepository.createDiary(diary);
  }
}
