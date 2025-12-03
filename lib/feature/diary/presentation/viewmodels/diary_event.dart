import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'diary_event.freezed.dart';

// [이재은] 다이어리 관련 이벤트 (사용자의 행동, 시스템에서 발생하는 일)

@freezed
abstract class DiaryEvent with _$DiaryEvent {
  // 공유다이어리 목록 조회
  // - 여행에 참여한 모든 멤버의 공개 다이어리 불러오기
  // - DiaryListScreen 진입 시 "공유다이어리" 탭에서 호출
  const factory DiaryEvent.getOurDiaries({required int tripId}) = GetOurDiaries;

  // 내 다이어리 목록 조회
  // - 해당 여행 다이어리 중 로그인한 사용자의 다이어리만(공개/비공개 모두)
  // - DiaryListScreen 진입 시 "내 다이어리" 탭에서 호출
  const factory DiaryEvent.getMyDiaries({
    required int tripId,
    required int userId,
  }) = GetMyDiaries;

  // 다이어리 상세조회
  // - 다이어리 박스 클릭 시 상세 정보 가져오기
  // - DiaryDetailPopUp 띄우기 전에 호출
  const factory DiaryEvent.getDiaryById({required int diaryId}) = GetDiaryById;

  // 다이어리 생성
  // - 플로팅 버튼 -> 작성 화면 -> 저장 버튼 클릭시 호출
  // - 성공하면 목록 재 로드 필요
  const factory DiaryEvent.createDiary({required DiaryEntity diary}) =
      CreateDiary;

  // 다이어리 수정
  // - 바텀시트 -> 수정버튼 -> 수정화면 -> 저장 버튼 클릭시 호출
  // - 기존 다이어리 내용 업데이트
  const factory DiaryEvent.updateDiary({required DiaryEntity diary}) =
      UpdateDiary;

  // 다이어리 삭제
  // - 바텀시트 -> 삭제 버튼 -> 삭제 팝업 -> 삭제 시 호출
  const factory DiaryEvent.deleteDiary({required int diaryId}) = DeleteDiary;

  // 다이어리 타입별 필터링
  const factory DiaryEvent.filterByType({String? type}) = FilterByType;

  // 목록 새로고침
  const factory DiaryEvent.refresh() = Refresh;
}
