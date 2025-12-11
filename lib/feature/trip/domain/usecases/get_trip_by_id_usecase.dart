import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/trip_entity.dart';
import '../repositories/trip_repository.dart';

// [이재은] 여행 Id로 여행 정보 가져오기 UseCase (라우팅)
@lazySingleton
class GetTripByIdUseCase {
  final TripRepository _repository;

  GetTripByIdUseCase(this._repository);

  Future<Result<TripEntity>> call(int tripId) {
    return _repository.getTripById(tripId);
  }
}
