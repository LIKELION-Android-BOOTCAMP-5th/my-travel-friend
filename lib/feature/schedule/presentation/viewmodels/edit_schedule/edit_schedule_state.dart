import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/entities/schedule_entity.dart';

part 'edit_schedule_state.freezed.dart';

@freezed
abstract class EditScheduleState with _$EditScheduleState {
  const factory EditScheduleState({
    int? tripId,
    int? scheduleId,

    ScheduleEntity? originalSchedule,

    String? title,

    DateTime? date,
    TimeOfDay? time,
    DateTime? startAt,

    String? place,
    String? address,
    double? lat,
    double? lng,
    @Default(false) bool isPlaceFromMap,

    String? description,

    // 카테고리
    int? selectedCategoryId,

    // 참여자
    @Default([]) List<UserEntity> tripMembers,
    @Default([]) List<UserEntity> selectedScheduleCrew,

    // ===== 상태 =====
    @Default(false) bool isValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isDirty,

    // UI 상태
    @Default(EditSchedulePageState.init) EditSchedulePageState pageState,
    DateTime? tripStartDate,
    DateTime? tripEndDate,
    // 메시지
    String? message,
    String? errorType,
    String? actionType,
  }) = _EditScheduleState;
}

enum EditSchedulePageState {
  init, // 초기
  loading, // 로딩
  loaded, // 데이터 세팅 완료
  success, // 수정 성공
  error, // 에러
}
