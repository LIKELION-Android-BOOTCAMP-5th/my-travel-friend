import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/delete_trip_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/get_crew_member_count_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/get_my_trip_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/give_up_trip_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/search_trip_usecase.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_state.dart';

import '../../../domain/usecases/delete_img_usecase.dart';

@injectable
class TripBloc extends Bloc<TripEvent, TripState> {
  final GetMyTripUsecase _getMyTripUsecase;
  final GetCrewMemberCountUsecase _getCrewMemberCountUsecase;
  final DeleteTripUsecase _deleteTripUsecase;
  final GiveUpTripUseCase _giveUpTripUseCase;
  final SearchTripUsecase _searchTripUsecase;
  final DeleteImgUsecase _deleteImgUsecase;
  TripBloc(
    this._getMyTripUsecase,
    this._getCrewMemberCountUsecase,
    this._deleteTripUsecase,
    this._giveUpTripUseCase,
    this._searchTripUsecase,
    this._deleteImgUsecase,
  ) : super(TripState(trips: [])) {
    on<GetMyTrips>(_onGetMyTrips);
    on<LoadMoreTrips>(_onLoadMoreTrips);
    on<SearchKeywordChanged>(_onSearchKeywordChanged);
    on<SearchTrips>(_onSearchTrips);
    on<ToggleSearch>(_onToggleSearch);
    on<SelectTrip>(_onSelectTrip);
    on<OpenTripMenu>(_onOpenTripMenu);
    on<DeleteTrip>(_onDeleteTrip);
    on<LeaveTrip>(_onLeaveTrip);
    on<RefreshTrips>(_onRefreshTrips);
    on<ChangeSorting>(_onChangeSorting);
    on<CreateNewTrip>(_onCreateNewTrip);
    on<UpdateTrip>(_onUpdateTrip);
    on<ToggleUpcomingSorting>(_onToggleUpcomingSorting);
    on<ToggleFinishedSorting>(_onToggleFinishedSorting);
    //네비게이션
    on<NavigationHandled>((event, emit) {
      emit(state.copyWith(navigateToCreate: false, navigateToEdit: false));
    });
  }

  Future<void> _onGetMyTrips(GetMyTrips event, Emitter<TripState> emit) async {
    emit(
      state.copyWith(
        pageState: TripPageState.loading,
        currentPage: 1,
        searchTrips: null,
      ),
    );

    final result = await _getMyTripUsecase(event.userId, 1);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            trips: data,
            pageState: TripPageState.loaded,
            currentPage: 1,
          ),
        );
        _classifyAndEmitTrips(data, emit);
      },
      failure: (_) => emit(state.copyWith(pageState: TripPageState.error)),
    );
  }

  //리스트 페이징
  Future<void> _onLoadMoreTrips(
    LoadMoreTrips event,
    Emitter<TripState> emit,
  ) async {
    // 이미 로딩 중이면 차단
    if (state.isLoadingMore) return;

    final nextPage = state.currentPage + 1;

    emit(state.copyWith(isLoadingMore: true));

    // ✅ 검색 결과 pagination
    if (state.searchTrips != null) {
      final result = await _searchTripUsecase(
        event.userId,
        state.userSearch ?? '',
        nextPage,
      );

      result.when(
        success: (data) {
          if (data.isNotEmpty) {
            emit(
              state.copyWith(
                searchTrips: [...state.searchTrips!, ...data],
                currentPage: nextPage,
                isLoadingMore: false,
              ),
            );
          } else {
            emit(state.copyWith(isLoadingMore: false));
          }
        },
        failure: (_) {
          emit(state.copyWith(isLoadingMore: false));
        },
      );
      return;
    }

    // ✅ 일반 여행 리스트 pagination
    final result = await _getMyTripUsecase(event.userId, nextPage);

    result.when(
      success: (data) {
        if (data.isNotEmpty) {
          emit(
            state.copyWith(
              trips: [...state.trips!, ...data],
              currentPage: nextPage,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(state.copyWith(isLoadingMore: false));
        }
      },
      failure: (_) {
        emit(state.copyWith(isLoadingMore: false));
      },
    );
  }

  //검색 입력하면 상태변환
  void _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(userSearch: event.keyword));
  }

  //검색 실행
  Future<void> _onSearchTrips(
    SearchTrips event,
    Emitter<TripState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: TripPageState.loading,
        currentPage: 1,
        searchTrips: [],
      ),
    );

    final result = await _searchTripUsecase(event.userId, event.keyword, 1);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            searchTrips: data,
            pageState: TripPageState.loaded,
            currentPage: 1,
          ),
        );
      },
      failure: (_) {
        emit(state.copyWith(pageState: TripPageState.error));
      },
    );
  }

  // 검색 On/Off 전환
  void _onToggleSearch(ToggleSearch event, Emitter<TripState> emit) {
    emit(
      state.copyWith(
        search: !state.search,
        userSearch: '',
        searchTrips: null,
        currentPage: 1,
      ),
    );
  }

  //  여행 한 개 선택 → 상세조회 화면 이동 조건
  void _onSelectTrip(SelectTrip event, Emitter<TripState> emit) {
    emit(state.copyWith(selectedTrip: event.trip));
  }

  // 점3개 메뉴 클릭 → 어떤 Trip인지 기억
  void _onOpenTripMenu(OpenTripMenu event, Emitter<TripState> emit) {
    emit(state.copyWith(selectedTrip: event.trip));
  }

  //  여행 삭제 하기
  Future<void> _onDeleteTrip(DeleteTrip event, Emitter<TripState> emit) async {
    await _deleteTripUsecase(event.tripId);

    // 삭제되었으니 리스트를 다시 불러옴
    add(RefreshTrips(userId: state.trips?.first.userId ?? 0));
  }

  //여행 포기
  Future<void> _onLeaveTrip(LeaveTrip event, Emitter<TripState> emit) async {
    final crewCountResult = await _getCrewMemberCountUsecase(event.tripId);

    await crewCountResult.when(
      success: (crewCount) async {
        if (crewCount > 1) {
          // 2명 이상 → 나만 trip_crew에서 제거
          await _giveUpTripUseCase(event.tripId, event.userId);
        } else {
          // 마지막 사용자 → trip_crew 전체 삭제
          await _giveUpTripUseCase(event.tripId, event.userId);

          final trip = state.trips?.firstWhere(
            (t) => t.id == event.tripId,
            orElse: () => null as TripEntity,
          );

          final imageUrl = trip?.coverImg;

          // 이미지가 있을 경우 storage 삭제
          if (imageUrl != null && imageUrl.isNotEmpty) {
            await _deleteImgUsecase(imageUrl);
          }

          // trip 테이블 삭제
          await _deleteTripUsecase(event.tripId);
        }

        // UI 갱신
        add(RefreshTrips(userId: event.userId));
      },
      failure: (_) {
        emit(state.copyWith(message: "여행 나가기 실패"));
      },
    );
  }

  // 새로고침 이벤트 → 다시 첫 페이지부터 get
  void _onRefreshTrips(RefreshTrips event, Emitter<TripState> emit) {
    add(GetMyTrips(userId: event.userId));
  }

  //  정렬 변경 시 리스트 다시 불러오기 위한 준비
  void _onChangeSorting(ChangeSorting event, Emitter<TripState> emit) {
    emit(state.copyWith(sorting: event.sorting, currentPage: 1));
  }

  void _onCreateNewTrip(CreateNewTrip event, Emitter<TripState> emit) {
    emit(state.copyWith(selectedTrip: null, navigateToCreate: true));
  }

  // 수정할 Trip 저장 (이후 UI에서 이동 처리)
  void _onUpdateTrip(UpdateTrip event, Emitter<TripState> emit) {
    emit(state.copyWith(selectedTrip: event.trip, navigateToEdit: true));
  }

  void _classifyAndEmitTrips(List<TripEntity> trips, Emitter<TripState> emit) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final ongoing = <TripEntity>[];
    final upcoming = <TripEntity>[];
    final finished = <TripEntity>[];

    for (final trip in trips) {
      final startRaw = DateTime.parse(trip.startAt).toLocal();
      final endRaw = DateTime.parse(trip.endAt).toLocal();

      final start = DateTime(startRaw.year, startRaw.month, startRaw.day);
      final end = DateTime(endRaw.year, endRaw.month, endRaw.day);

      if (!start.isAfter(today) && !end.isBefore(today)) {
        // start <= today <= end
        ongoing.add(trip);
      } else if (start.isAfter(today)) {
        upcoming.add(trip);
      } else {
        finished.add(trip);
      }
    }

    emit(
      state.copyWith(
        ongoingTrips: ongoing,
        upcomingTrips: _sortTrips(upcoming, state.upcomingSorting),
        finishedTrips: _sortTrips(finished, state.finishedSorting),
      ),
    );
  }

  List<TripEntity> _sortTrips(List<TripEntity> trips, SortingTrip sorting) {
    final sorted = [...trips];

    sorted.sort((a, b) {
      final aDate = DateTime.parse(a.startAt);
      final bDate = DateTime.parse(b.startAt);

      return sorting == SortingTrip.recent
          ? bDate.compareTo(aDate) // 최신순
          : aDate.compareTo(bDate); // 오래된순
    });

    return sorted;
  }

  void _onToggleUpcomingSorting(
    ToggleUpcomingSorting event,
    Emitter<TripState> emit,
  ) {
    final nextSorting = state.upcomingSorting == SortingTrip.recent
        ? SortingTrip.old
        : SortingTrip.recent;

    emit(
      state.copyWith(
        upcomingSorting: nextSorting,
        upcomingTrips: _sortTrips(state.upcomingTrips, nextSorting),
      ),
    );
  }

  void _onToggleFinishedSorting(
    ToggleFinishedSorting event,
    Emitter<TripState> emit,
  ) {
    final nextSorting = state.finishedSorting == SortingTrip.recent
        ? SortingTrip.old
        : SortingTrip.recent;

    emit(
      state.copyWith(
        finishedSorting: nextSorting,
        finishedTrips: _sortTrips(state.finishedTrips, nextSorting),
      ),
    );
  }
}
