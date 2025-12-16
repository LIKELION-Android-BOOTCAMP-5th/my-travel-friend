import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../trip/domain/entities/trip_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/schedule_entity.dart';

part 'schedule_state.freezed.dart';

@freezed
abstract class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    // 전체 스케줄 원본
    @Default([]) List<ScheduleEntity> schedules,

    // 날짜 필터링 결과
    @Default([]) List<ScheduleEntity> dateFilteredSchedules,

    // 카테고리 필터링 결과
    @Default([]) List<ScheduleEntity> categoryFilteredSchedules,
    @Default({}) Map<int, CategoryEntity> categoryMap,
    // 최종 표시할 스케줄
    @Default([]) List<ScheduleEntity> visibleSchedules,

    // 스케줄별 참여자 map
    @Default({}) Map<int, List<UserEntity>> scheduleMembersMap,

    // 현재 선택된 날짜
    String? selectedDate,

    // 현재 선택된 카테고리
    int? selectedCategoryId,

    // 페이징
    @Default(1) int page,
    @Default(false) bool hasMore,
    //페이지별 상태
    @Default(SchedulepageState.init) SchedulepageState pageState,

    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,

    //메모 펼쳐지는지 아닌지 확인용
    @Default(false) bool memoOpen,

    // 네비게이션 (작성 화면 이동)
    @Default(false) bool navigateToCreate,
    ScheduleEntity? editingSchedule,
    // 네비게이션 (수정 화면 이동)
    @Default(false) bool navigateToEdit,
    //카테고리
    @Default([]) List<CategoryEntity> categories,
    TripEntity? trip,

    @Default(ScheduleFilterType.date) ScheduleFilterType viewMode,
  }) = _ScheduleState;
}

enum SchedulepageState {
  init, // 초기 상태
  loading, // 로딩 중
  loaded, // 목록 로드 완료
  success, // 생성/수정/삭제 성공
  error, // 에러
}

enum ScheduleFilterType { date, category }
