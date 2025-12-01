import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/diary/domain/entities/diary_entity.dart';

import '../repositories/diary_repository.dart';

@LazySingleton()
class CreateDiaryUseCase {
  final DiaryRepository _diaryRepository;

  CreateDiaryUseCase(this._diaryRepository);

  // 다이어리 생성
  Future<DiaryEntity> call(DiaryEntity diary) {
    return _diaryRepository.createDiary(diary);
  }
}
