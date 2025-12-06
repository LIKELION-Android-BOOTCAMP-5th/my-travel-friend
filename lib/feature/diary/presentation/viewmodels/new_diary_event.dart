import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'new_diary_event.freezed.dart';

// [이재은] 다이어리 작성 관련 이벤트 (사용자의 행동, 시스템에서 발생하는 일)
@freezed
abstract class NewDiaryEvent with _$NewDiaryEvent {
  // 다이어리 생성
  // - 플로팅 버튼 -> 작성 화면 -> 저장 버튼 클릭시 호출
  // - 성공하면 목록 재 로드 필요
  const factory NewDiaryEvent.createDiary() = CreateDiary;

  // 타입 변경
  const factory NewDiaryEvent.changeType({required String type}) = ChangeType;

  // 제목 변경
  const factory NewDiaryEvent.changeTitle({required String title}) =
      ChangeTitle;

  // 내용 변경
  const factory NewDiaryEvent.changeContent({required String content}) =
      ChangeContent;

  // 별점 변경 (리뷰용)
  const factory NewDiaryEvent.changeRating({required double rating}) =
      ChangeRating;

  // 로컬 이미지 선택
  const factory NewDiaryEvent.selectImg({required File file}) = SelectImg;

  // 이미지 제거
  const factory NewDiaryEvent.removeImg() = RemoveImg;

  // 금액 변경(소비용)
  const factory NewDiaryEvent.changeCost({required int? cost}) = ChangeCost;

  // 공개 여부 변경
  const factory NewDiaryEvent.changePublic({required bool isPublic}) =
      ChangePublic;

  // 일정 선택
  const factory NewDiaryEvent.chooseSchedule({required int? scheduleId}) =
      ChooseSchedule;

  // 상태 초기화
  const factory NewDiaryEvent.reset() = Reset;
}
