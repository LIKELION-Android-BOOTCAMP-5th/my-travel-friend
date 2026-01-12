import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/checklist/domain/repositories/checklist_repository.dart';

// [이재은] 체크리스트 삭제 usecase
@LazySingleton()
class DeleteChecklistUseCase {
  final ChecklistRepository _checklistRepository;
  DeleteChecklistUseCase(this._checklistRepository);

  // 체크리스트 삭제
  Future<Result<void>> call(int id) {
    return _checklistRepository.deleteChecklist(id);
  }
}
