// [이재은] 다이어리 페이지 상태 (UI 상태)
enum DiaryPageState {
  init, // 초기 상태
  loading, // 로딩 중
  loaded, // 목록 로드 완료
  detailLoaded, // 상세 조회 완료
  success, // 생성/수정/삭제 성공
  error, // 에러
}
