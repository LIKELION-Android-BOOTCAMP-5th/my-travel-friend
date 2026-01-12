import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/trip_entity.dart';

part 'edit_trip_event.freezed.dart';

@freezed
abstract class EditTripEvent with _$EditTripEvent {
  // 기존 데이터 로드 (초기값 세팅)
  const factory EditTripEvent.loadTrip({required TripEntity trip}) = LoadTrip;

  // 여행 제목 변경
  const factory EditTripEvent.changeTitle({required String title}) =
      ChangeTitle;

  // 여행 장소 변경
  const factory EditTripEvent.changePlace({required String place}) =
      ChangePlace;

  // Gemini API 로 얻은 국가 설정
  const factory EditTripEvent.placeAIResult({required String country}) =
      PlaceAIResult;

  // 날짜 검증
  const factory EditTripEvent.validateDate() = ValidateDate;

  // 날짜가 동일할 때 보여줄 팝업
  const factory EditTripEvent.sameDayDetected() = SameDayDetected;
  const factory EditTripEvent.dismissSameDayDialog() = DismissSameDayDialog;

  // 시작/종료 날짜 변경
  const factory EditTripEvent.changeStartAt({required String startAt}) =
      ChangeStartAt;
  const factory EditTripEvent.changeEndAt({required String endAt}) =
      ChangeEndAt;

  // 커버 스타일 변경 (COLOR / IMAGE)
  const factory EditTripEvent.changeCoverStyle({required String style}) =
      ChangeCoverStyle;

  // 커버 컬러 선택
  const factory EditTripEvent.changeCoverColor({required String color}) =
      ChangeCoverColor;

  // 커버 이미지 선택 (로컬 이미지)
  const factory EditTripEvent.selectCoverImg({required File file}) =
      SelectCoverImg;

  // 커버 이미지 제거 (기존 및 새 이미지 둘 다 고려)
  const factory EditTripEvent.removeCoverImg() = RemoveCoverImg;

  // 상태 초기화
  const factory EditTripEvent.reset() = Reset;

  // 여행 수정 저장
  const factory EditTripEvent.saveTrip() = SaveTrip;

  // 수정 취소 → 원본값 복귀
  const factory EditTripEvent.cancelEdit() = CancelEdit;
}
