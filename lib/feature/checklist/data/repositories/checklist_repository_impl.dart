import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../domain/entities/checklist_entity.dart';
import '../../domain/repositories/checklist_repository.dart';
import '../datasources/checklist_data_source.dart';
import '../dtos/checklist_dto.dart';

// [이재은] 체크리스트 repository
@LazySingleton(as: ChecklistRepository)
class ChecklistRepositoryImpl implements ChecklistRepository {
  final ChecklistDataSource _dataSource;
  ChecklistRepositoryImpl(this._dataSource);

  // 나의 체크리스트 가져오기
  @override
  Future<Result<List<ChecklistEntity>>> getMyChecklists(
    int tripId,
    int userId,
  ) async {
    final res = await _dataSource.getMyChecklists(
      tripId: tripId,
      userId: userId,
    );
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 체크리스트 생성
  @override
  Future<Result<ChecklistEntity>> createChecklist(
    ChecklistEntity checklist,
  ) async {
    final dto = ChecklistDTO.fromEntity(checklist);

    final res = await _dataSource.createChecklist(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 체크리스트 삭제
  @override
  Future<Result<void>> deleteChecklist(int id) async {
    return await _dataSource.deleteChecklist(id);
  }

  // 체크리스트 토글
  @override
  Future<Result<ChecklistEntity>> toggleChecklist(
    int id,
    bool isChecked,
  ) async {
    final res = await _dataSource.toggleChecklist(id: id, isChecked: isChecked);

    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }
}
