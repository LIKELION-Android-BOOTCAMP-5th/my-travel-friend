import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/checklist/domain/entities/checklist_entity.dart';
import 'package:my_travel_friend/feature/checklist/domain/repositories/checklist_repository.dart';

// [이재은] 체크리스트 생성 usecase
@LazySingleton()
class CreateChecklistUseCase {
  final ChecklistRepository _checklistRepository;

  CreateChecklistUseCase(this._checklistRepository);

  // 체크리스트 생성
  Future<Result<ChecklistEntity>> call(ChecklistEntity checklist) {
    return _checklistRepository.createChecklist(checklist);
  }
}
