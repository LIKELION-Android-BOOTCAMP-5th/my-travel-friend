import 'dart:io';

import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/trip_dto.dart';

abstract class TripDataSource {
  //유저 아이디로 본인이 참가하고 있는 여행 목록 가져오기
  Future<Result<List<TripDto>>> getMyTrips(int userId, int page);

  // 여행 생성
  Future<Result<TripDto>> createTrip(TripDto trip);

  // 여행 수정
  Future<Result<TripDto>> editTrip(TripDto trip);

  //여행 포기
  Future<Result<void>> giveUpTrip(int tripId, int userId);

  //트립 크루 인원수 (여행 삭제를 위한)
  Future<Result<int>> countTripCrew(int tripId);

  //여행 삭제
  Future<Result<void>> deleteTrip(int tripId);
  // 이미지 업로드
  Future<Result<String>> uploadImg({
    required File file,
    required String bucketName,
  });

  // 이미지 삭제
  Future<Result<void>> deleteImg(String imgUrl, {required String bucketName});
  //여행 검색
  Future<Result<List<TripDto>>> searchTrips(
    int userId,
    String keyword,
    int page,
  );

  // 아이디로 여행정보 가져오기(라우팅)
  Future<TripDto> getTripById(int tripId);
}
