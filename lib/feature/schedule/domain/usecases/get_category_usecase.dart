import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/category_entity.dart';

import '../repositories/schedule_repository.dart';

@LazySingleton()
class GetCategoryUsecase {
  final ScheduleRepository _repository;

  GetCategoryUsecase(this._repository);

  Future<Result<List<CategoryEntity>>> call() {
    return _repository.getCategory();
  }
}
