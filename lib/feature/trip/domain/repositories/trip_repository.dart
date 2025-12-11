import 'dart:io';

import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

// 신강현
// 트립 레포지터리 완성했습니다

abstract class TripRepository {
  //내가 참여한 여행 목록 가져오기
  Future<Result<List<TripEntity>>> getMyTrips(int userId, int page);

  // 여행 생성
  Future<Result<TripEntity>> createTrip(TripEntity trip);

  // 여행 수정
  Future<Result<TripEntity>> editTrip(TripEntity trip);

  //여행 포기
  Future<Result<void>> giveUpTrip(int userId, int id);

  //트립 크루 인원수 (여행 삭제를 위한)
  Future<Result<int>> countTripCrew(int tripId);

  //여행 삭제
  Future<Result<void>> deleteTrip(int tripId);
  // 이미지 업로드
  Future<Result<String>> uploadImg({required File file});

  // 이미지 삭제
  Future<Result<void>> deleteImg(String imgUrl);
  //여행 검색
  Future<Result<List<TripEntity>>> searchTrips(
    int userId,
    String keyword,
    int page,
  );

  // 아이디로 여행 정보 가져오기(라우팅)
  Future<Result<TripEntity>> getTripById(int tripId);
}
