import 'package:injectable/injectable.dart';

import '../repositories/diary_repository.dart';

@LazySingleton()
class DeleteDiaryUseCase {
  final DiaryRepository _diaryRepository;

  DeleteDiaryUseCase(this._diaryRepository);

  // 다이어리 삭제
  Future<void> call(String id) {
    return _diaryRepository.deleteDiary(id);
  }
}
