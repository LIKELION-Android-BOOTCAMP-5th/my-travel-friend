import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'create_schedule_event.freezed.dart';

@freezed
abstract class CreateScheduleEvent with _$CreateScheduleEvent {
  //일정 제목 변경
  const factory CreateScheduleEvent.titleChanged(String title) = TitleChanged;
  //일정 메모 변경
  const factory CreateScheduleEvent.descriptionChanged(String description) =
      DescriptionChanged;
  //날짜 선택
  const factory CreateScheduleEvent.dateSelected(DateTime date) = DateSelected;
  //시간 선택
  const factory CreateScheduleEvent.timeSelected(TimeOfDay time) = TimeSelected;

  // 장소 직접 타이핑
  const factory CreateScheduleEvent.placeTextChanged(String text) =
      PlaceTextChanged;

  //장소검색 화면 열기
  const factory CreateScheduleEvent.placeSearchRequested() =
      PlaceSearchRequested;
  //장소 선택완료 -> 선택하면 화면돌아오고
  //장소에 선택한 장소이름 들어가고 자동으로 db에 넣어줄 데이터 저장
  const factory CreateScheduleEvent.placeSelected({
    required String place,
    required String address,
    required double lat,
    required double lng,
  }) = PlaceSelected;
  //선택된 장소 제거
  const factory CreateScheduleEvent.placeCleared() = PlaceCleared;
  //카테고리 선택
  const factory CreateScheduleEvent.categorySelected(int categoryId) =
      CategorySelected;
  const factory CreateScheduleEvent.initialized({required int tripId}) =
      Initialized;
  //참여자 전체 가져오기
  const factory CreateScheduleEvent.loadTripMembers() = LoadTripMembers;

  //참여자 선택
  const factory CreateScheduleEvent.crewAdded(UserEntity user) = CrewAdded;
  //참여자 선택해제
  const factory CreateScheduleEvent.crewRemoved(int userId) = CrewRemoved;
  //일정 생성 -> 유효성 검사후 가능
  const factory CreateScheduleEvent.submitPressed() = SubmitPressed;
  //뒤로가기
  const factory CreateScheduleEvent.exitRequested() = ExitRequested;
  //쓰다가 나가기
  const factory CreateScheduleEvent.exitConfirmed() = ExitConfirmed;
  // 메시지 초기화
  const factory CreateScheduleEvent.clearMessage() = ClearMessage;
}
