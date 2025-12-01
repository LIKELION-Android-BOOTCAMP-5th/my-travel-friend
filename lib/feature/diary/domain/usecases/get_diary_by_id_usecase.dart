import 'package:injectable/injectable.dart';

import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

// [이재은] 다아어리 상세조회(아이디로) usecase
@LazySingleton()
class GetDiaryByIdUseCase {
  final DiaryRepository _diaryRepository;

  GetDiaryByIdUseCase(this._diaryRepository);

  // 다이어리 상세 조회(아이디로 가져오기)
  Future<DiaryEntity> call(String id) {
    return _diaryRepository.getDiaryById(id);
  }
}
