import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/schedule_entity.dart';

part 'schedule_event.freezed.dart';

@freezed
abstract class ScheduleEvent with _$ScheduleEvent {
  // 스케줄 전체 불러오기(첫 페이지)
  const factory ScheduleEvent.fetchSchedules({
    required int tripId,
    @Default(false) bool isRefresh,
  }) = FetchSchedules;

  // 날짜 선택
  const factory ScheduleEvent.selectDate({required String date}) = SelectDate;

  // 카테고리 선택
  const factory ScheduleEvent.selectCategory({required int categoryId}) =
      SelectCategory;

  // 필터 제거
  const factory ScheduleEvent.clearFilter() = ClearFilter;

  // 작성 화면 이동 요청
  const factory ScheduleEvent.navigateToCreate() = NavigateToCreate;

  // 스케줄 삭제
  const factory ScheduleEvent.deleteSchedule(int scheduleId) = DeleteSchedule;

  // 수정 화면 이동 요청
  const factory ScheduleEvent.navigateToEdit({
    required ScheduleEntity schedule,
  }) = NavigateToEdit;

  // 스케줄 참여 멤버 가져오기
  const factory ScheduleEvent.fetchScheduleMembers({required int scheduleId}) =
      FetchScheduleMembers;

  // 메모 토글
  const factory ScheduleEvent.toggleMemo() = ToggleMemo;

  // 다음 페이지 로드
  const factory ScheduleEvent.loadMore({required int tripId}) = LoadMore;

  // 네비게이션 플래그 초기화
  const factory ScheduleEvent.resetNavigation() = ResetNavigation;

  // 메시지 초기화
  const factory ScheduleEvent.clearMessage() = ClearMessage;
}
