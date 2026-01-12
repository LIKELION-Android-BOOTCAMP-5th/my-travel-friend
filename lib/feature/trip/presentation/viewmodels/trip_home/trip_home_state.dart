import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../schedule/domain/entities/schedule_entity.dart';
import '../../../domain/entities/trip_entity.dart';
import '../../../domain/entities/useful_pharse_entity.dart';

part 'trip_home_state.freezed.dart';

@freezed
abstract class TripHomeState with _$TripHomeState {
  const factory TripHomeState({
    int? tripId,
    TripEntity? trip,

    // 로그인 사용자 id
    int? myId,

    // Crew
    @Default([]) List<UserEntity> crewMembers,
    @Default(false) bool isCrewExpanded,

    // 친구 초대
    @Default([]) List<UserEntity> friendCandidates,
    @Default(false) bool isInviteMode,

    // 날짜
    DateTime? selectedDate,

    // 여행기간 (선택 가능 범위)
    DateTime? tripStartDate,
    DateTime? tripEndDate,

    // 일정
    @Default([]) List<ScheduleEntity> allSchedules, // 전체 원본 (페이지1)
    @Default([]) List<ScheduleEntity> schedulesForSelectedDate,

    // 현지표현
    @Default([]) List<UsefulPharseEntity> usefulPhrases,
    @Default(false) bool isUsefulPhraseExpanded,

    @Default([]) List<List<DateTime?>> calendarPages,
    @Default(0) int currentCalendarPage,

    // 상태
    @Default(TripHomePageState.init) TripHomePageState pageState,

    // 메시지/액션
    String? message,
    String? errorType,
    String? actionType,
  }) = _TripHomeState;
}

enum TripHomePageState { init, loading, loaded, error }
