import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/checklist_entity.dart';
import '../../domain/entities/todo_list_entity.dart';

part 'lists_state.freezed.dart';

// [이재은] checklist와 todolist의 상태

// 현재 선택된 탭
enum ListsTab { checklist, todoList }

// 페이지 상태
enum ListsPageState { initial, loading, loaded, error }

@freezed
abstract class ListsState with _$ListsState {
  const ListsState._();

  const factory ListsState({
    // 정보 조회
    @Default(0) int tripId,
    @Default(0) int userId,

    // 현재 탭
    @Default(ListsTab.checklist) ListsTab currentTab,

    // 체크리스트(짐목록)
    @Default([]) List<ChecklistEntity> checklists,

    // 투두리스트(할일목록)
    @Default([]) List<TodoListEntity> todolists,

    // 입력필드 (새 항목 추가용)
    @Default('') String newItemContent,

    // 메시지
    String? message,

    // 페이지 상태
    @Default(ListsPageState.initial) ListsPageState pageState,
    @Default(false) bool isLoading,

    // 개별 토글 상태 관리 (수정됨)
    @Default({}) Set<int> togglingChecklistIds,
    @Default({}) Set<int> togglingTodoIds,
  }) = _ListsState;

  // 진행률
  int get totalCount =>
      currentTab == ListsTab.checklist ? checklists.length : todolists.length;

  int get checkedCount => currentTab == ListsTab.checklist
      ? checklists.where((e) => e.isChecked).length
      : todolists.where((e) => e.isChecked).length;
}
