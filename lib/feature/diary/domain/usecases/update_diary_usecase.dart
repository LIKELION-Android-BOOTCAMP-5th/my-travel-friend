import 'package:injectable/injectable.dart';

import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

// [이재은] 다아어리 수정 usecase
@LazySingleton()
class UpdateDiaryUseCase {
  final DiaryRepository _diaryRepository;

  UpdateDiaryUseCase(this._diaryRepository);

  // 다이어리 수정
  Future<DiaryEntity> call(DiaryEntity diary) {
    return _diaryRepository.updateDiary(diary);
  }
}
