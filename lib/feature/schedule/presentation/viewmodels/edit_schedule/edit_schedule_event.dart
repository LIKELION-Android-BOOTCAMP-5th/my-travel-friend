import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/entities/schedule_entity.dart';

part 'edit_schedule_event.freezed.dart';

@freezed
abstract class EditScheduleEvent with _$EditScheduleEvent {
  // 수정 화면 진입 시 기존 스케줄 세팅
  const factory EditScheduleEvent.initialized({
    required ScheduleEntity schedule,
  }) = Initialized;
  // 스케줄 참여한 사람 가져오기
  const factory EditScheduleEvent.loadScheduleMembers() = LoadScheduleMembers;

  // 일정 제목 변경
  const factory EditScheduleEvent.titleChanged(String title) = TitleChanged;

  // 일정 메모 변경
  const factory EditScheduleEvent.descriptionChanged(String description) =
      DescriptionChanged;

  // 날짜 선택
  const factory EditScheduleEvent.dateSelected(DateTime date) = DateSelected;

  // 시간 선택
  const factory EditScheduleEvent.timeSelected(TimeOfDay time) = TimeSelected;

  // 장소 직접 타이핑
  const factory EditScheduleEvent.placeTextChanged(String text) =
      PlaceTextChanged;

  // 장소 검색 화면 요청
  const factory EditScheduleEvent.placeSearchRequested() = PlaceSearchRequested;

  // 장소 선택 완료 (지도)
  const factory EditScheduleEvent.placeSelected({
    required String place,
    required String address,
    required double lat,
    required double lng,
  }) = PlaceSelected;

  // 선택된 장소 제거
  const factory EditScheduleEvent.placeCleared() = PlaceCleared;

  // 카테고리 선택
  const factory EditScheduleEvent.categorySelected(int categoryId) =
      CategorySelected;

  // 여행 참여자 전체 불러오기
  const factory EditScheduleEvent.loadTripMembers() = LoadTripMembers;

  // 참여자 추가
  const factory EditScheduleEvent.crewAdded(UserEntity user) = CrewAdded;

  // 참여자 제거
  const factory EditScheduleEvent.crewRemoved(int userId) = CrewRemoved;

  // 일정 수정 (update)
  const factory EditScheduleEvent.submitPressed() = SubmitPressed;

  // 뒤로가기
  const factory EditScheduleEvent.exitRequested() = ExitRequested;

  // 수정 취소 확정 (원본으로 복구 후 pop)
  const factory EditScheduleEvent.exitConfirmed() = ExitConfirmed;

  // 메시지 초기화
  const factory EditScheduleEvent.clearMessage() = ClearMessage;
}
