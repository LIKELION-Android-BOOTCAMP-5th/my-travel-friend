import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_state.dart';

part 'trip_event.freezed.dart';

@freezed
abstract class TripEvent with _$TripEvent {
  // 유저의 여행 리스트 조회 (초기/새로고침)
  const factory TripEvent.getMyTrips({required int userId}) = GetMyTrips;

  // 페이징 - 다음 페이지 로드
  const factory TripEvent.loadMoreTrips({required int userId}) = LoadMoreTrips;

  //여행 정렬 변경 (최신순 / 오래된순)
  const factory TripEvent.changeSorting({required SortingTrip sorting}) =
      ChangeSorting;

  //검색 문자열 변경
  const factory TripEvent.searchKeywordChanged({required String keyword}) =
      SearchKeywordChanged;

  // 검색 실행 (enter or button press)
  const factory TripEvent.searchTrips({
    required int userId,
    required String keyword,
  }) = SearchTrips;

  //검색창 열기/닫기 (아이콘 toggle)
  const factory TripEvent.toggleSearch() = ToggleSearch;

  //여행 하나 선택 (상세 보기 이동 조건)
  const factory TripEvent.selectTrip({required TripEntity trip}) = SelectTrip;

  //여행 생성하기 버튼 → 작성 화면 이동
  const factory TripEvent.createNewTrip() = CreateNewTrip;
  const factory TripEvent.navigationHandled() = NavigationHandled;

  //여행 카드의 점3개 버튼 클릭 → 하단 바텀시트 표시 조건 발생
  const factory TripEvent.openTripMenu({required TripEntity trip}) =
      OpenTripMenu;

  //여행 수정하기 버튼 클릭
  const factory TripEvent.updateTrip({required TripEntity trip}) = UpdateTrip;

  //참여 중인 여행 포기하기 (팝업 확인)
  //남은 크루 O → 목록에서만 내가 제외
  // 남은 크루 X → 여행 전체 삭제
  const factory TripEvent.leaveTrip({
    required int tripId,
    required int userId,
  }) = LeaveTrip;

  //여행 실제 삭제 (크루 없음 판정 시)
  const factory TripEvent.deleteTrip({required int tripId}) = DeleteTrip;

  //재정렬 or 업데이트 후 리스트 다시 로드
  const factory TripEvent.refreshTrips({required int userId}) = RefreshTrips;
}
