import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/checklist/domain/entities/checklist_entity.dart';

import '../../../../core/result/result.dart';
import '../repositories/checklist_repository.dart';

// [이재은] 체크리스트 체크 표시
@LazySingleton()
class ToggleChecklistUseCase {
  final ChecklistRepository _checklistRepository;

  ToggleChecklistUseCase(this._checklistRepository);

  // 체크리스트 체크 표시
  Future<Result<ChecklistEntity>> call({
    required int id,
    required bool isChecked,
  }) {
    return _checklistRepository.toggleChecklist(id, isChecked);
  }
}
