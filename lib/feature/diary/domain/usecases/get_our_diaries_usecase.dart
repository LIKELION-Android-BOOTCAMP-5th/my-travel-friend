import 'package:injectable/injectable.dart';

import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

// [이재은] 공유 다이어리 목록 조회 usecase
@LazySingleton()
class GetOurDiariesUseCase {
  final DiaryRepository _diaryRepository;

  GetOurDiariesUseCase(this._diaryRepository);

  // 다이어리 목록 가져오기
  Future<List<DiaryEntity>> call(int tripId) {
    return _diaryRepository.getOurDiaries(tripId);
  }
}
