import 'package:my_travel_friend/core/result/result.dart';

import '../dtos/checklist_dto.dart';

// [이재은] 체크리스트 관련 데이터 소스 (추상)
abstract class ChecklistDataSource {
  // 체크리스트 목록 조회
  Future<Result<List<ChecklistDTO>>> getMyChecklists({
    required int tripId,
    required int userId,
  });

  // 체크리스트 생성
  Future<Result<ChecklistDTO>> createChecklist(ChecklistDTO checklist);

  // 체크리스트 삭제
  Future<Result<void>> deleteChecklist(int id);

  // 체크 토글
  Future<Result<ChecklistDTO>> toggleChecklist({
    required int id,
    required bool isChecked,
  });
}
