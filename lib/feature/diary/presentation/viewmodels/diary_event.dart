import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_event.freezed.dart';

// [이재은] 다이어리 조회/ 삭제 관련 이벤트 (사용자의 행동, 시스템에서 발생하는 일)

@freezed
abstract class DiaryEvent with _$DiaryEvent {
  // 공유다이어리 목록 조회
  // - 여행에 참여한 모든 멤버의 공개 다이어리 불러오기
  // - DiaryListScreen 진입 시 "공유다이어리" 탭에서 호출
  // - 첫 페이지
  const factory DiaryEvent.getOurDiaries({required int tripId}) = GetOurDiaries;

  // 내 다이어리 목록 조회
  // - 해당 여행 다이어리 중 로그인한 사용자의 다이어리만(공개/비공개 모두)
  // - DiaryListScreen 진입 시 "내 다이어리" 탭에서 호출
  // - 첫 페이지
  const factory DiaryEvent.getMyDiaries({
    required int tripId,
    required int userId,
  }) = GetMyDiaries;

  // 다음 페이지 로드 (무한스크롤)
  const factory DiaryEvent.loadMore() = LoadMore;

  // 다이어리 상세 팝업 요청 (로컬 데이터 사용)
  const factory DiaryEvent.requestDetail({required DiaryEntity diary}) =
      RequestDetail;

  // 상세 팝업 닫힘 (상태 초기화)
  const factory DiaryEvent.clearSelectedDiary() = ClearSelectedDiary;

  // 다이어리 삭제
  // - 바텀시트 -> 삭제 버튼 -> 삭제 팝업 -> 삭제 시 호출
  const factory DiaryEvent.deleteDiary({required int diaryId}) = DeleteDiary;

  // 다이어리 타입별 필터링
  const factory DiaryEvent.filterByType({String? type}) = FilterByType;

  // 목록 새로고침
  const factory DiaryEvent.refresh() = Refresh;

  // 다이어리 작성 화면 이동 요청
  const factory DiaryEvent.requestCreate() = RequestCreate;

  // 다이어리 수정 화면 이동 요청
  const factory DiaryEvent.requestEdit({required DiaryEntity diary}) =
      RequestEdit;

  // 네비게이션 처리 완료(플래그 초기화)
  const factory DiaryEvent.navigationHandled() = NavigationHandled;

  // 다이어리 작성 완료(성공 후 새로고침)
  const factory DiaryEvent.onCreateCompleted({required bool success}) =
      OnCreateCompleted;

  // 다이어리 수정 완료(성공 후 새로고침)
  const factory DiaryEvent.onEditCompleted({required bool success}) =
      OnEditCompleted;
}
