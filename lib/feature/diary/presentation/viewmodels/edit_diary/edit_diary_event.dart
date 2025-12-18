import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/diary_entity.dart';

part 'edit_diary_event.freezed.dart';

// [이재은] 다이어리 수정 관련 이벤트

@freezed
abstract class EditDiaryEvent with _$EditDiaryEvent {
  // 다이어리 수정
  // - 바텀시트 -> 수정버튼 -> 수정화면 -> 저장 버튼 클릭시 호출
  // - 기존 다이어리 내용 업데이트
  // 기존 다이어리 로드 (초기화)
  const factory EditDiaryEvent.loadDiary({required DiaryEntity diary}) =
      LoadDiary;

  // 다이어리 수정 (저장 버튼)
  const factory EditDiaryEvent.updateDiary() = UpdateDiary;

  // 타입 변경
  const factory EditDiaryEvent.changeType({required String type}) = ChangeType;

  // 제목 변경
  const factory EditDiaryEvent.changeTitle({required String title}) =
      ChangeTitle;

  // 내용 변경
  const factory EditDiaryEvent.changeContent({required String content}) =
      ChangeContent;

  // 별점 변경 (리뷰용)
  const factory EditDiaryEvent.changeRating({required double rating}) =
      ChangeRating;

  // 로컬 이미지 선택
  const factory EditDiaryEvent.selectImg({required File file}) = SelectImg;

  // 이미지 제거
  const factory EditDiaryEvent.removeImg() = RemoveImg;

  // 금액 변경(소비용)
  const factory EditDiaryEvent.changeCost({required int? cost}) = ChangeCost;

  // 통화 변경 (소비용)
  const factory EditDiaryEvent.changeCurrency({required String currency}) =
      ChangeCurrency;

  // 결제 수단 변경 (소비용)
  const factory EditDiaryEvent.changePayment({required String payment}) =
      ChangePayment;

  // 공개 여부 변경
  const factory EditDiaryEvent.changePublic({required bool isPublic}) =
      ChangePublic;

  // 상태 초기화
  const factory EditDiaryEvent.reset() = Reset;
}
