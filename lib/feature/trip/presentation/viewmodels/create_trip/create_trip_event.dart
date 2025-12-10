import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_trip_event.freezed.dart';

// 여행 생성 관련 이벤트
@freezed
abstract class CreateTripEvent with _$CreateTripEvent {
  // 여행 제목 변경
  const factory CreateTripEvent.changeTitle({required String title}) =
      ChangeTitle;

  // 여행 장소 변경 (도시/지역명)
  const factory CreateTripEvent.changePlace({required String place}) =
      ChangePlace;

  //Gemini API 로 얻은 국가 결과 처리
  const factory CreateTripEvent.placeAIResult({required String country}) =
      PlaceAIResult;

  // 날짜 입력 후 검증
  const factory CreateTripEvent.validateDate() = ValidateDate;

  const factory CreateTripEvent.dismissSameDayDialog() = DismissSameDayDialog;
  // 날짜가 동일함을 Bloc에서 감지했을 때
  const factory CreateTripEvent.sameDayDetected() = SameDayDetected;

  // 여행 시작일 변경
  const factory CreateTripEvent.changeStartAt({required String startAt}) =
      ChangeStartAt;

  // 여행 종료일 변경
  const factory CreateTripEvent.changeEndAt({required String endAt}) =
      ChangeEndAt;

  // 스타일 타입 (COLOR / IMAGE)
  const factory CreateTripEvent.changeCoverStyle({required String style}) =
      ChangeCoverStyle;

  // 실제 컬러 선택
  const factory CreateTripEvent.changeCoverColor({required String color}) =
      ChangeCoverColor;

  // 커버 이미지 선택
  const factory CreateTripEvent.selectCoverImg({required File file}) =
      SelectCoverImg;

  // 커버 이미지 제거
  const factory CreateTripEvent.removeCoverImg() = RemoveCoverImg;

  // 여행 생성 실행
  // → "만들기" 버튼 클릭 시 호출
  const factory CreateTripEvent.createTrip() = CreateTrip;

  //친구와 함께 여행만들기 할때 필요 할거 같이 일단 넣었음
  const factory CreateTripEvent.setFriend({required int friendId}) = SetFriend;

  //초기화 (상태 리셋)
  const factory CreateTripEvent.reset() = Reset;
}
