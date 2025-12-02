import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/diary_entity.dart';
import '../repositories/diary_repository.dart';

// [이재은] 내 다이어리 목록 조회 usecase
@LazySingleton()
class GetMyDiariesUseCase {
  final DiaryRepository _diaryRepository;

  GetMyDiariesUseCase(this._diaryRepository);

  // 다이어리 목록 가져오기
  Future<Result<List<DiaryEntity>>> call(int tripId, int userId) {
    return _diaryRepository.getMyDiaries(tripId, userId);
  }
}
