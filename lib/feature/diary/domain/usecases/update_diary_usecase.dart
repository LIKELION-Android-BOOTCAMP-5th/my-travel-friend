import 'package:injectable/injectable.dart';

import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

@LazySingleton()
class UpdateDiaryUseCase {
  final DiaryRepository _diaryRepository;

  UpdateDiaryUseCase(this._diaryRepository);

  // 다이어리 수정
  Future<DiaryEntity> call(DiaryEntity diary) {
    return _diaryRepository.updateDiary(diary);
  }
}
