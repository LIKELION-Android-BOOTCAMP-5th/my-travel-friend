import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/delete_schedule_usecase.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/get_all_schedule_usecase.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/get_schedule_member_usecase.dart';

import '../../../auth/domain/entities/user_entity.dart';
import 'schedule_event.dart';
import 'schedule_state.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetAllScheduleUseCase getAllSchedule;
  final DeleteScheduleUseCase deleteSchedule;
  final GetScheduleMembersUseCase getScheduleMembers;

  ScheduleBloc(
    this.getAllSchedule,
    this.deleteSchedule,
    this.getScheduleMembers,
  ) : super(const ScheduleState()) {
    on<FetchSchedules>(_onFetchSchedules);
    on<SelectDate>(_onSelectDate);
    on<SelectCategory>(_onSelectCategory);
    on<ClearFilter>(_onClearFilter);
    on<NavigateToCreate>(_onNavigateToCreate);
    on<NavigateToEdit>(_onNavigateToEdit);
    on<FetchScheduleMembers>(_onFetchScheduleMembers);
    on<ToggleMemo>(_onToggleMemo);
    on<LoadMore>(_onLoadMore);
    on<ResetNavigation>(_onResetNavigation);
    on<ClearMessage>(_onClearMessage);
    on<DeleteSchedule>(_onDeleteSchedule);
  }

  // =============================
  // 스케줄 목록 가져오기
  // =============================
  Future<void> _onFetchSchedules(
    FetchSchedules event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(pageState: SchedulepageState.loading));

    final res = await getAllSchedule(tripId: event.tripId, page: 1);

    res.when(
      success: (list) {
        emit(
          state.copyWith(
            schedules: list,
            visibleSchedules: list,
            page: 1,
            hasMore: list.length >= 10,
            selectedDate: null,
            selectedCategoryId: null,
            currentFilter: null,
            pageState: SchedulepageState.loaded,
          ),
        );
      },
      failure: (e) {
        emit(
          state.copyWith(
            pageState: SchedulepageState.error,
            message: e.message,
          ),
        );
      },
    );
  }

  // =============================
  // 날짜 선택
  // =============================
  void _onSelectDate(SelectDate event, Emitter<ScheduleState> emit) {
    final filtered = state.schedules
        .where((e) => e.date == event.date)
        .toList();

    emit(
      state.copyWith(
        selectedDate: event.date,
        selectedCategoryId: null,
        currentFilter: ScheduleFilterType.date,
        visibleSchedules: filtered,
      ),
    );
  }

  // =============================
  // 카테고리 선택
  // =============================
  void _onSelectCategory(SelectCategory event, Emitter<ScheduleState> emit) {
    final filtered = state.schedules
        .where((e) => e.categoryId == event.categoryId)
        .toList();

    emit(
      state.copyWith(
        selectedCategoryId: event.categoryId,
        selectedDate: null,
        currentFilter: ScheduleFilterType.category,
        visibleSchedules: filtered,
      ),
    );
  }

  // =============================
  // 필터 초기화
  // =============================
  void _onClearFilter(ClearFilter event, Emitter<ScheduleState> emit) {
    emit(
      state.copyWith(
        selectedDate: null,
        selectedCategoryId: null,
        currentFilter: null,
        visibleSchedules: state.schedules,
      ),
    );
  }

  // =============================
  // 작성 화면 이동
  // =============================
  void _onNavigateToCreate(
    NavigateToCreate event,
    Emitter<ScheduleState> emit,
  ) {
    emit(state.copyWith(navigateToCreate: true));
  }

  // =============================
  // 수정 화면 이동
  // =============================
  void _onNavigateToEdit(NavigateToEdit event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(navigateToEdit: true));
  }

  // =============================
  // 스케줄 참여 멤버
  // =============================
  Future<void> _onFetchScheduleMembers(
    FetchScheduleMembers event,
    Emitter<ScheduleState> emit,
  ) async {
    final res = await getScheduleMembers(scheduleId: event.scheduleId);

    res.when(
      success: (members) {
        final updated = Map<int, List<UserEntity>>.from(
          state.scheduleMembersMap,
        );
        updated[event.scheduleId] = members;

        emit(state.copyWith(scheduleMembersMap: updated));
      },
      failure: (_) {},
    );
  }

  //  스케줄 삭제 하기
  Future<void> _onDeleteSchedule(
    DeleteSchedule event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(pageState: SchedulepageState.loading));

    await deleteSchedule.call(event.scheduleId);
  }

  // =============================
  // 메모 접기/펼치기
  // =============================
  void _onToggleMemo(ToggleMemo event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(memoOpen: !state.memoOpen));
  }

  // =============================
  // Load More
  // =============================
  Future<void> _onLoadMore(LoadMore event, Emitter<ScheduleState> emit) async {
    if (!state.hasMore) return;

    final nextPage = state.page + 1;

    final res = await getAllSchedule(tripId: event.tripId, page: nextPage);

    res.when(
      success: (list) {
        emit(
          state.copyWith(
            schedules: [...state.schedules, ...list],
            visibleSchedules: [...state.schedules, ...list],
            page: nextPage,
            hasMore: list.length >= 10,
          ),
        );
      },
      failure: (_) {},
    );
  }

  // =============================
  // 네비 리셋
  // =============================
  void _onResetNavigation(ResetNavigation event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(navigateToCreate: false, navigateToEdit: false));
  }

  // =============================
  // 메시지 초기화
  // =============================
  void _onClearMessage(ClearMessage event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(message: null, errorType: null, actionType: null));
  }
}
