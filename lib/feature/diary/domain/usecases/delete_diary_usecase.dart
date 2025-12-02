import 'package:injectable/injectable.dart';

import '../repositories/diary_repository.dart';

// [이재은] 다이어리 삭제 usecase
@LazySingleton()
class DeleteDiaryUseCase {
  final DiaryRepository _diaryRepository;

  DeleteDiaryUseCase(this._diaryRepository);

  // 다이어리 삭제
  Future<void> call(int id) {
    return _diaryRepository.deleteDiary(id);
  }
}
