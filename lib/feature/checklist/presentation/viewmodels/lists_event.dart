import 'package:freezed_annotation/freezed_annotation.dart';

import 'lists_state.dart';

part 'lists_event.freezed.dart';

// [이재은] 체크리스트, 투두리스트 통합 이벤트 관리
@freezed
abstract class ListsEvent with _$ListsEvent {
  const ListsEvent._();

  // 초기 로드
  const factory ListsEvent.load({required int tripId, required int userId}) =
      Load;

  // 탭 변경
  const factory ListsEvent.changeTab({required ListsTab tab}) = ChangeTab;

  // 입력 필드 내용 변경
  const factory ListsEvent.changeContent({required String content}) =
      ChangeContent;

  // 체크리스트
  // 생성
  const factory ListsEvent.createChecklist() = CreateChecklist;

  // 삭제
  const factory ListsEvent.deleteChecklist({required int id}) = DeleteChecklist;

  // 체크
  const factory ListsEvent.toggleChecklist({
    required int id,
    required bool isChecked,
  }) = ToggleChecklist;

  // 투두리스트
  // 생성
  const factory ListsEvent.createTodoList() = CreateTodoList;

  // 삭제
  const factory ListsEvent.deleteTodoList({required int id}) = DeleteTodoList;

  // 체크
  const factory ListsEvent.toggleTodoList({
    required int id,
    required bool isChecked,
  }) = ToggleTodoList;
}

// 탭 구분 enum
enum ListTab {
  checklist, // 체크리스트 - 짐 목록
  todoList, // 투두리스트 - 해야 할 일 목록
}
