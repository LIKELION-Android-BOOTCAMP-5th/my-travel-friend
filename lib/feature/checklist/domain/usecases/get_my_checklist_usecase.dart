import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/checklist_entity.dart';
import '../repositories/checklist_repository.dart';

// [이재은] 내 체크리스트 목록 조회 usecase
@LazySingleton()
class GetMyChecklistUseCase {
  final ChecklistRepository _checklistRepository;

  GetMyChecklistUseCase(this._checklistRepository);

  // 체크리스트 목록 가져오기
  Future<Result<List<ChecklistEntity>>> call({
    required int tripId,
    required int userId,
  }) {
    return _checklistRepository.getMyChecklists(tripId, userId);
  }
}
