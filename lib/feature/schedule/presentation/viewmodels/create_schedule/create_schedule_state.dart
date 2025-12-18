import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'create_schedule_state.freezed.dart';

@freezed
abstract class CreateScheduleState with _$CreateScheduleState {
  const factory CreateScheduleState({
    @Default(1) int tripId,
    String? title,

    //시간용
    DateTime? date, //날짜
    TimeOfDay? time, //시간
    DateTime? startAt, //날짜 시간 합쳐서 올릴용
    //  장소 (optional)
    String? place,
    String? address,
    double? lat,
    double? lng,
    bool? isPlaceSelected,

    //  메모
    String? description,
    @Default(false) bool isValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isDirty,
    // 카테고리
    int? selectedCategoryId,
    @Default(false) bool isPlaceFromMap,
    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,
    @Default(CreateSchedulepageState.init) CreateSchedulepageState pageState,
    @Default([]) List<UserEntity> tripMembers,
    // 참여자
    @Default([]) List<UserEntity> selectedScheduleCrew,

    DateTime? tripStartDate,
    DateTime? tripEndDate,
  }) = _CreateScheduleState;
}

enum CreateSchedulepageState {
  init, // 초기 상태
  loading, // 로딩 중
  loaded, // 목록 로드 완료
  success, // 생성/수정/삭제 성공
  error, // 에러
}
