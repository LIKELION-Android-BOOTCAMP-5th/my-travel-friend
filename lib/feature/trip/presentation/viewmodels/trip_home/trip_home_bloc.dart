import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../friend/domain/usecases/get_friend_users_usecase.dart';
import '../../../../schedule/domain/entities/schedule_entity.dart';
import '../../../../schedule/domain/usecases/get_all_schedule_usecase.dart';
import '../../../../schedule/domain/usecases/get_trip_member_usecase.dart';
import '../../../domain/entities/trip_entity.dart';
import '../../../domain/entities/useful_pharse_entity.dart';
import '../../../domain/usecases/get_trip_by_id_usecase.dart';
import '../../../domain/usecases/get_useful_pharse_usecase.dart';
import 'trip_home_event.dart';
import 'trip_home_state.dart';

@injectable
class TripHomeBloc extends Bloc<TripHomeEvent, TripHomeState> {
  final GetTripByIdUseCase _getTripByIdUseCase;
  final GetTripMembersUseCase _getTripMembersUseCase;
  final GetAllScheduleUseCase _getAllScheduleUseCase;
  final GetUsefulPharseUsecase _getUsefulPharseUsecase;
  final GetFriendUsersUsecase _getFriendUsersUsecase;

  TripHomeBloc(
    this._getTripByIdUseCase,
    this._getTripMembersUseCase,
    this._getAllScheduleUseCase,
    this._getUsefulPharseUsecase,
    this._getFriendUsersUsecase,
  ) : super(const TripHomeState(pageState: TripHomePageState.init)) {
    on<LoadTripHome>(_onLoadTripHome);
    on<ToggleCrew>(_onToggleCrew);
    on<SelectDate>(_onSelectDate);
    on<OpenInvite>(_onOpenInvite);
    on<CloseInvite>(_onCloseInvite);
    on<ToggleUsefulPhrase>(_onToggleUsefulPhrase);
    on<RefreshSchedules>(_onRefreshSchedules);
    on<ConsumeMessage>(_onConsumeMessage);
    on<ConsumeAction>(_onConsumeAction);
    on<ChangeCalendarPage>(_onChangeCalendarPage);
  }

  // =========================
  // 여행 홈 최초 로드
  // =========================
  Future<void> _onLoadTripHome(
    LoadTripHome event,
    Emitter<TripHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: TripHomePageState.loading,
        tripId: event.tripId,
        myId: event.myId,
        message: null,
        actionType: null,
      ),
    );

    final tripResult = await _getTripByIdUseCase(event.tripId);

    await tripResult.when(
      success: (TripEntity trip) async {
        // 여행 시작/종료
        final start = DateTime.parse(trip.startAt);
        final end = DateTime.parse(trip.endAt);

        final allDates = buildTripDates(start, end);
        final pages = chunkDates(allDates);

        // 기본 선택 = 시작일
        final startDt = _onlyDate(start);
        final endDt = _onlyDate(end);
        final selected = startDt;

        emit(
          state.copyWith(
            trip: trip,
            tripStartDate: startDt,
            tripEndDate: endDt,
            selectedDate: selected,
            calendarPages: pages,
            currentCalendarPage: 0,
          ),
        );

        // 1) Crew
        final crewResult = await _getTripMembersUseCase(tripId: event.tripId);
        crewResult.when(
          success: (List<UserEntity> members) {
            emit(state.copyWith(crewMembers: members));
          },
          failure: (_) {},
        );

        // 2) Schedules (page=1만)
        final scheduleResult = await _getAllScheduleUseCase(
          tripId: event.tripId,
          page: 1,
        );

        scheduleResult.when(
          success: (List<ScheduleEntity> schedules) {
            final filtered = _filterSchedulesByDate(schedules, selected);
            emit(
              state.copyWith(
                allSchedules: schedules,
                schedulesForSelectedDate: filtered,
              ),
            );
          },
          failure: (_) {},
        );

        // 3) Useful phrases (country 비교해서 가져온다고 했으니, usecase에서 이미 필터/없으면 빈 리스트라고 가정)
        final phraseResult = await _getUsefulPharseUsecase(event.tripId);
        phraseResult.when(
          success: (List<UsefulPharseEntity> phrases) {
            // null/없으면 섹션 자체 안보이게 => 빈 리스트 유지
            emit(state.copyWith(usefulPhrases: phrases));
          },
          failure: (_) {},
        );

        emit(state.copyWith(pageState: TripHomePageState.loaded));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: TripHomePageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // =========================
  // Crew 토글
  // =========================
  void _onToggleCrew(ToggleCrew event, Emitter<TripHomeState> emit) {
    emit(state.copyWith(isCrewExpanded: !state.isCrewExpanded));
  }

  // =========================
  // Useful Phrase 토글
  // =========================
  void _onToggleUsefulPhrase(
    ToggleUsefulPhrase event,
    Emitter<TripHomeState> emit,
  ) {
    emit(state.copyWith(isUsefulPhraseExpanded: !state.isUsefulPhraseExpanded));
  }

  // =========================
  // 날짜 선택
  // =========================
  void _onSelectDate(SelectDate event, Emitter<TripHomeState> emit) {
    final start = state.tripStartDate;
    final end = state.tripEndDate;
    final selected = _onlyDate(event.date);

    // 여행기간 밖이면 무시
    if (start != null && selected.isBefore(start)) return;
    if (end != null && selected.isAfter(end)) return;

    final filtered = _filterSchedulesByDate(state.allSchedules, selected);

    final pageIndex = state.calendarPages.indexWhere(
      (page) => page.any(
        (d) =>
            d != null &&
            d.year == selected.year &&
            d.month == selected.month &&
            d.day == selected.day,
      ),
    );

    emit(
      state.copyWith(
        selectedDate: selected,
        schedulesForSelectedDate: filtered,
        currentCalendarPage: pageIndex >= 0
            ? pageIndex
            : state.currentCalendarPage,
      ),
    );
  }

  void _onChangeCalendarPage(
    ChangeCalendarPage event,
    Emitter<TripHomeState> emit,
  ) {
    emit(state.copyWith(currentCalendarPage: event.pageIndex));
  }

  // =========================
  // 친구 초대 팝업 열기
  // =========================
  Future<void> _onOpenInvite(
    OpenInvite event,
    Emitter<TripHomeState> emit,
  ) async {
    final myId = state.myId;
    if (myId == null) {
      emit(state.copyWith(message: '로그인 정보가 없습니다.'));
      return;
    }

    emit(state.copyWith(isInviteMode: true, message: null));

    final result = await _getFriendUsersUsecase(myId);
    result.when(
      success: (friends) {
        emit(state.copyWith(friendCandidates: friends));
      },
      failure: (f) {
        emit(state.copyWith(message: f.message));
      },
    );
  }

  void _onCloseInvite(CloseInvite event, Emitter<TripHomeState> emit) {
    emit(state.copyWith(isInviteMode: false));
  }

  // =========================
  // 스케줄 새로고침 (page=1 다시 호출)
  // =========================
  Future<void> _onRefreshSchedules(
    RefreshSchedules event,
    Emitter<TripHomeState> emit,
  ) async {
    final tripId = state.tripId;
    final selected = state.selectedDate;
    if (tripId == null || selected == null) return;

    final result = await _getAllScheduleUseCase(tripId: tripId, page: 1);
    result.when(
      success: (List<ScheduleEntity> schedules) {
        final filtered = _filterSchedulesByDate(schedules, selected);
        emit(
          state.copyWith(
            allSchedules: schedules,
            schedulesForSelectedDate: filtered,
          ),
        );
      },
      failure: (f) {
        emit(state.copyWith(message: f.message));
      },
    );
  }

  // =========================
  // Message / Action 소비
  // =========================
  void _onConsumeMessage(ConsumeMessage event, Emitter<TripHomeState> emit) {
    emit(state.copyWith(message: null));
  }

  void _onConsumeAction(ConsumeAction event, Emitter<TripHomeState> emit) {
    emit(state.copyWith(actionType: null));
  }

  // =========================
  // Utils
  // =========================
  DateTime _onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  List<DateTime> _buildVisibleDates(DateTime start, DateTime end) {
    final dates = <DateTime>[];
    DateTime cursor = start;
    while (!cursor.isAfter(end)) {
      dates.add(cursor);
      cursor = cursor.add(const Duration(days: 1));
    }
    return dates;
  }

  List<ScheduleEntity> _filterSchedulesByDate(
    List<ScheduleEntity> all,
    DateTime selected,
  ) {
    final filtered = all.where((s) {
      if (s.date == null) return false;
      final dt = DateTime.tryParse(s.date!);
      if (dt == null) return false;

      return dt.year == selected.year &&
          dt.month == selected.month &&
          dt.day == selected.day;
    }).toList();

    // timestamptz이므로 date에 시간 포함되어 있음 => 시간순 정렬
    filtered.sort((a, b) {
      final aDt = DateTime.tryParse(a.date ?? '') ?? DateTime(1970);
      final bDt = DateTime.tryParse(b.date ?? '') ?? DateTime(1970);
      return aDt.compareTo(bDt);
    });

    return filtered;
  }

  List<DateTime> buildTripDates(DateTime start, DateTime end) {
    final dates = <DateTime>[];
    DateTime cursor = start;

    while (!cursor.isAfter(end)) {
      dates.add(cursor);
      cursor = cursor.add(const Duration(days: 1));
    }

    return dates;
  }

  List<List<DateTime?>> chunkDates(List<DateTime> dates) {
    final pages = <List<DateTime?>>[];

    for (int i = 0; i < dates.length; i += 14) {
      final chunk = dates.skip(i).take(14).map<DateTime?>((d) => d).toList();

      while (chunk.length < 14) {
        chunk.add(null); // 종료일 이후
      }

      pages.add(chunk);
    }

    return pages;
  }
}
