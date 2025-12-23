import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/trip_crew_entity.dart';
import '../../domain/repositories/trip_crew_repository.dart';
import '../datasources/trip_crew_data_source.dart';

//[엄수빈] 여행 크루 레포 구현
@LazySingleton(as: TripCrewRepository)
class TripCrewRepositoryImpl implements TripCrewRepository {
  final TripCrewDataSource _dataSource;

  TripCrewRepositoryImpl(this._dataSource);

  // 크루원 가져오기
  @override
  Future<Result<List<TripCrewEntity>>> getTripCrew(int tripId) async {
    final result = await _dataSource.getTripCrew(tripId);

    return result.when(
      success: (dtoList) =>
          Result.success(dtoList.map((e) => e.toEntity()).toList()),
      failure: (f) => Result.failure(f),
    );
  }

  //trip에 추가하기
  @override
  Future<Result<void>> addTrip(int myId, int tripId) async {
    final result = await _dataSource.addTrip(myId, tripId);

    return result.when(
      success: (_) {
        return Result.success(null);
      },
      failure: (failure) {
        return Result.failure(failure);
      },
    );
  }
}
