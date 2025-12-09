import '../../../../core/result/result.dart';
import '../entities/checklist_entity.dart';

// [이재은] 체크리스트 관련 domain repositories
abstract class ChecklistRepository {
  // 체크리스트 목록 가져오기
  // -> 여행아이디, 유저아이디로 가져오기
  // 페이지네이션 없음
  Future<Result<List<ChecklistEntity>>> getMyChecklists(int tripId, int userId);

  // 체크리스트 추가
  Future<Result<ChecklistEntity>> createChecklist(ChecklistEntity checklist);

  // 체크리스트 삭제
  Future<Result<void>> deleteChecklist(int id);

  // 체크리스트 체크 토글
  Future<Result<ChecklistEntity>> toggleChecklist(int id, bool isChecked);
}
