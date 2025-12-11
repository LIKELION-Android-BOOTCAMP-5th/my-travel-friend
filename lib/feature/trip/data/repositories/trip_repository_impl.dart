import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/data/datasources/trip_data_source.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/trip_dto.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

import '../../../../core/result/failures.dart';

//신강현
//여행 레포지터리 임플리먼트

@LazySingleton(as: TripRepository)
class TripRepositoryImpl implements TripRepository {
  final TripDataSource _dataSource;
  TripRepositoryImpl(this._dataSource);

  //여행가져오기
  @override
  Future<Result<List<TripEntity>>> getMyTrips(int userId, int page) async {
    final res = await _dataSource.getMyTrips(userId, page);
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<TripEntity>> editTrip(TripEntity trip) async {
    final dto = TripDto(
      id: trip.id,
      title: trip.title,
      place: trip.place,
      startAt: trip.startAt,
      endAt: trip.endAt,
      coverType: trip.coverType,
      userId: trip.userId,
      country: trip.country,
      coverImg: trip.coverImg,
    );
    final res = await _dataSource.editTrip(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<int>> countTripCrew(int tripId) async {
    final res = await _dataSource.countTripCrew(tripId);
    return res.when(
      success: (data) => Result.success(data),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<TripEntity>> createTrip(TripEntity trip) async {
    final dto = TripDto(
      title: trip.title,
      place: trip.place,
      startAt: trip.startAt,
      endAt: trip.endAt,
      coverType: trip.coverType,
      userId: trip.userId,
      country: trip.country,
      coverImg: trip.coverImg,
    );
    final res = await _dataSource.createTrip(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  @override
  Future<Result<void>> deleteTrip(int tripId) async {
    return await _dataSource.deleteTrip(tripId);
  }

  @override
  Future<Result<void>> giveUpTrip(int userId, int id) async {
    return await _dataSource.giveUpTrip(userId, id);
  }

  @override
  Future<Result<List<TripEntity>>> searchTrips(
    int userId,
    String keyword,
    int page,
  ) async {
    final res = await _dataSource.searchTrips(userId, keyword, page);
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 이미지 업로드
  @override
  Future<Result<String>> uploadImg({required File file}) async {
    return await _dataSource.uploadImg(
      file: file,
      bucketName: 'trip_cover_image',
    );
  }

  // 이미지 삭제
  @override
  Future<Result<void>> deleteImg(String imgUrl) async {
    return await _dataSource.deleteImg(imgUrl, bucketName: 'trip_cover_image');
  }

  // 아이디로 여행정보 가져오기
  @override
  Future<Result<TripEntity>> getTripById(int tripId) async {
    try {
      final response = await _dataSource.getTripById(tripId);
      return Result.success(response.toEntity());
    } catch (e) {
      return Result.failure(ServerFailure(message: e.toString()));
    }
  }
}
