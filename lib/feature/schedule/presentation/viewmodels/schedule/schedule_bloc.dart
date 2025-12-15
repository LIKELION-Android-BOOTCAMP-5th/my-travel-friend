import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/delete_schedule_usecase.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/get_all_schedule_usecase.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/get_schedule_member_usecase.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/schedule/schedule_state.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../trip/domain/entities/trip_entity.dart';
import '../../../../trip/domain/usecases/get_trip_by_id_usecase.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/schedule_entity.dart';
import '../../../domain/usecases/get_category_usecase.dart';
import 'schedule_event.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetAllScheduleUseCase getAllSchedule;
  final DeleteScheduleUseCase deleteSchedule;
  final GetScheduleMembersUseCase getScheduleMembers;
  final GetCategoryUsecase getCategory;
  final GetTripByIdUseCase getTripById;
  ScheduleBloc(
    this.getAllSchedule,
    this.deleteSchedule,
    this.getScheduleMembers,
    this.getCategory,
    this.getTripById,
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
    on<SwitchToDateMode>(_onSwitchToDateMode);
    on<SwitchToCategoryMode>(_onSwitchToCategoryMode);
    on<Refresh>(_onRefreshSchedules);
  }

  Future<void> _onFetchSchedules(
    FetchSchedules event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(pageState: SchedulepageState.loading));

    final tripRes = await getTripById(event.tripId);
    if (emit.isDone) return;

    late final TripEntity trip;
    tripRes.when(
      success: (data) => trip = data,
      failure: (e) {
        emit(
          state.copyWith(
            pageState: SchedulepageState.error,
            message: e.message,
          ),
        );
      },
    );
    if (emit.isDone) return;

    final scheduleRes = await getAllSchedule(tripId: event.tripId, page: 1);
    if (emit.isDone) return;

    late final List<ScheduleEntity> schedules;
    scheduleRes.when(
      success: (data) => schedules = data,
      failure: (e) {
        emit(
          state.copyWith(
            pageState: SchedulepageState.error,
            message: e.message,
          ),
        );
      },
    );
    if (emit.isDone) return;

    final categoryRes = await getCategory();
    if (emit.isDone) return;

    late final List<CategoryEntity> categories;
    categoryRes.when(
      success: (data) => categories = data,
      failure: (e) {
        emit(
          state.copyWith(
            pageState: SchedulepageState.error,
            message: e.message,
          ),
        );
      },
    );
    if (emit.isDone) return;

    emit(
      state.copyWith(
        trip: trip,
        schedules: schedules,
        visibleSchedules: schedules,
        categories: categories,
        page: 1,
        hasMore: schedules.length >= 10,
        selectedDate: null,
        selectedCategoryId: null,
        viewMode: ScheduleFilterType.date,
        pageState: SchedulepageState.loaded,
        scheduleMembersMap: state.scheduleMembersMap, // ✅ 유지
      ),
    );

    // 참여자 로딩
    for (final s in schedules) {
      add(ScheduleEvent.fetchScheduleMembers(scheduleId: s.id!));
    }
  }

  // 날짜 선택

  void _onSelectDate(SelectDate event, Emitter<ScheduleState> emit) {
    final filtered = state.schedules
        .where((e) => e.date == event.date)
        .toList();

    emit(
      state.copyWith(
        selectedDate: event.date,
        selectedCategoryId: null,
        visibleSchedules: filtered,
      ),
    );
  }

  // 카테고리 선택

  void _onSelectCategory(SelectCategory event, Emitter<ScheduleState> emit) {
    final filtered = state.schedules
        .where((e) => e.categoryId == event.categoryId)
        .toList();

    emit(
      state.copyWith(
        selectedCategoryId: event.categoryId,
        selectedDate: null,
        visibleSchedules: filtered,
      ),
    );
  }

  // 필터 초기화

  void _onClearFilter(ClearFilter event, Emitter<ScheduleState> emit) {
    emit(
      state.copyWith(
        selectedDate: null,
        selectedCategoryId: null,
        visibleSchedules: state.schedules,
      ),
    );
  }

  //화면 재구성
  void _onRefreshSchedules(Refresh event, Emitter<ScheduleState> emit) {
    add(ScheduleEvent.fetchSchedules(tripId: event.tripId));
  }

  // 작성 화면 이동

  void _onNavigateToCreate(
    NavigateToCreate event,
    Emitter<ScheduleState> emit,
  ) {
    emit(state.copyWith(navigateToCreate: true));
  }

  // 수정 화면 이동

  void _onNavigateToEdit(NavigateToEdit event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(navigateToEdit: true, editingSchedule: event.schedule));
  }

  // 스케줄 참여 멤버

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

    final result = await deleteSchedule.call(event.scheduleId);

    result.when(
      success: (_) {
        add(ScheduleEvent.fetchSchedules(tripId: state.trip!.id!));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: SchedulepageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 메모 접기/펼치기
  void _onToggleMemo(ToggleMemo event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(memoOpen: !state.memoOpen));
  }

  // Load More
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

  // 네비 리셋

  void _onResetNavigation(ResetNavigation event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(navigateToCreate: false, navigateToEdit: false));
  }

  // 메시지 초기화

  void _onClearMessage(ClearMessage event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(message: null, errorType: null, actionType: null));
  }

  //일자별 선택
  void _onSwitchToDateMode(
    SwitchToDateMode event,
    Emitter<ScheduleState> emit,
  ) {
    emit(
      state.copyWith(
        viewMode: ScheduleFilterType.date,
        selectedCategoryId: null,
        visibleSchedules: state.schedules,
      ),
    );
  }

  //카테고리별 선택
  void _onSwitchToCategoryMode(
    SwitchToCategoryMode event,
    Emitter<ScheduleState> emit,
  ) {
    emit(
      state.copyWith(
        viewMode: ScheduleFilterType.category,
        selectedDate: null,
        visibleSchedules: state.schedules,
      ),
    );
  }
}
