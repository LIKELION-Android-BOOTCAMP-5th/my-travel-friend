import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

part 'trip_state.freezed.dart';

@freezed
abstract class TripState with _$TripState {
  const factory TripState({
    //조회정보
    TripEntity? selectedTrip,
    //getmytrip -> 여행 리스트
    required List<TripEntity>? trips,
    //검색한 결과에 따른 리스트
    List<TripEntity>? searchTrips,
    //검색어 상태
    String? userSearch,
    //서치 아이콘과 필드가 나오는조건
    @Default(false) bool search,
    //정렬 했냐 안했냐 조건?
    @Default(SortingTrip.recent) SortingTrip sorting,
    //리스트 불러올때 페이징 하게하는 state
    @Default(1) int currentPage,
    //페이지 state
    @Default(TripPageState.init) TripPageState pageState,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,

    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,
  }) = _TripState;
}

enum TripPageState { init, loading, loaded, error, success }

enum SortingTrip { recent, old }

//success는 삭제 했을때 성공 상태 있어야할거같아서
