import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/trip_request_entity.dart';
import '../../domain/repositories/trip_request_repository.dart';
import '../datasources/trip_request_data_source.dart';

@LazySingleton(as: TripRequestRepository)
class TripRequestRepositoryImpl implements TripRequestRepository {
  final TripRequestDataSource _dataSource;

  TripRequestRepositoryImpl(this._dataSource);

  // 목록 조회
  @override
  Future<Result<List<TripRequestEntity>>> getTripRequest(int myId) async {
    final result = await _dataSource.getTripRequest(myId);

    return result.when(
      success: (dtoList) {
        final entities = dtoList.map((dto) => dto.toEntity()).toList();
        return Result.success(entities);
      },
      failure: (failure) {
        return Result.failure(failure);
      },
    );
  }

  //trip
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

  /// 여행 초대하기
  @override
  Future<Result<TripRequestEntity>> createTripRequest(
    int requestId,
    int targetId,
    int tripId,
  ) async {
    final result = await _dataSource.createTripRequest(
      requestId,
      targetId,
      tripId,
    );

    return result.when(
      success: (dto) {
        return Result.success(dto.toEntity());
      },
      failure: (failure) {
        return Result.failure(failure);
      },
    );
  }

  /// 초대 받은 여행 수락
  @override
  Future<Result<void>> acceptTripRequest(int id) async {
    final result = await _dataSource.acceptTripRequest(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }

  /// 초대 거절
  @override
  Future<Result<void>> deleteTripRequst(int id) async {
    final result = await _dataSource.deleteTripRequst(id);

    return result.when(
      success: (_) => const Result.success(null),
      failure: (failure) => Result.failure(failure),
    );
  }
}
