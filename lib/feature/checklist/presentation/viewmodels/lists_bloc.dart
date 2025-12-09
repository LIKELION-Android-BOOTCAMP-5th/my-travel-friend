import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/checklist/domain/entities/checklist_entity.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/create_checklist_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/create_todo_list_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/delete_checklist_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/delete_todo_list_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/get_my_checklist_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/get_my_todo_list_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/toggle_checklist_usecase.dart';
import 'package:my_travel_friend/feature/checklist/domain/usecases/toggle_todo_list_usecase.dart';
import 'package:my_travel_friend/feature/checklist/presentation/viewmodels/lists_state.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/todo_list_entity.dart';
import 'lists_event.dart';

// [이재은] 체크리스트, 투두리스트 bloc
@injectable
class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final GetMyChecklistUseCase _getMyChecklistUseCase;
  final GetMyTodoListUseCase _getMyTodoListUseCase;
  final CreateChecklistUseCase _createChecklistUseCase;
  final CreateTodoListUseCase _createTodoListUseCase;
  final DeleteChecklistUseCase _deleteChecklistUseCase;
  final DeleteTodoListUseCase _deleteTodoListUseCase;
  final ToggleChecklistUseCase _toggleChecklistUseCase;
  final ToggleTodoListUseCase _toggleTodoListUseCase;

  ListsBloc(
    this._getMyChecklistUseCase,
    this._getMyTodoListUseCase,
    this._createChecklistUseCase,
    this._createTodoListUseCase,
    this._deleteChecklistUseCase,
    this._deleteTodoListUseCase,
    this._toggleChecklistUseCase,
    this._toggleTodoListUseCase,
  ) : super(const ListsState()) {
    on<Load>(_onLoad);
    on<ChangeTab>(_onChangeTab);
    on<ChangeContent>(_onChangeContent);
    on<CreateChecklist>(_onCreateChecklist);
    on<DeleteChecklist>(_onDeleteChecklist);
    on<ToggleChecklist>(_onToggleChecklist);
    on<CreateTodoList>(_onCreateTodoList);
    on<DeleteTodoList>(_onDeleteTodoList);
    on<ToggleTodoList>(_onToggleTodoList);
  }

  // 초기 로드
  Future<void> _onLoad(Load event, Emitter<ListsState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        tripId: event.tripId,
        userId: event.userId,
      ),
    );

    List<ChecklistEntity> checklists = [];
    List<TodoListEntity> todolists = [];
    String? errorMessage;

    // 체크리스트 로드
    final checklistResult = await _getMyChecklistUseCase.call(
      tripId: event.tripId,
      userId: event.userId,
    );
    checklistResult.when(
      success: (data) => checklists = data,
      failure: (failure) => errorMessage = failure.message,
    );

    // 투두리스트 로드
    final todolistResult = await _getMyTodoListUseCase.call(
      tripId: event.tripId,
      userId: event.userId,
    );
    todolistResult.when(
      success: (data) => todolists = data,
      failure: (failure) => errorMessage = failure.message,
    );

    emit(
      state.copyWith(
        isLoading: false,
        checklists: checklists,
        todolists: todolists,
      ),
    );
  }

  // 탭 변경
  void _onChangeTab(ChangeTab event, Emitter<ListsState> emit) {
    emit(state.copyWith(currentTab: event.tab, newItemContent: ''));
  }

  // 입력 필드 내용 변경
  void _onChangeContent(ChangeContent event, Emitter<ListsState> emit) {
    emit(state.copyWith(newItemContent: event.content));
  }

  // 체크리스트 생성
  Future<void> _onCreateChecklist(
    CreateChecklist event,
    Emitter<ListsState> emit,
  ) async {
    final content = event.content.trim();
    if (content.isEmpty) return;

    print('🔵 createChecklist called');
    print('🔵 content: "${event.content}"'); // 또는 event.content
    print('🔵 tripId: ${state.tripId}, userId: ${state.userId}');

    final newItem = ChecklistEntity(
      id: null,
      tripId: state.tripId,
      userId: state.userId,
      content: content,
      isChecked: false,
    );
    final res = await _createChecklistUseCase.call(newItem);

    res.when(
      success: (created) {
        print('✅ 성공: $created');
        final updated = List<ChecklistEntity>.from(state.checklists);
        updated.add(created);
        emit(state.copyWith(checklists: updated, newItemContent: ''));
      },
      failure: (failure) {
        print('❌ 실패: ${failure.message}'); // ← 이거 추가!
        print('❌ 에러 상세: $failure'); // ← 이것도 추가!
        emit(state.copyWith(message: '체크리스트 추가 실패'));
      },
    );
  }

  // 체크리스트 삭제
  Future<void> _onDeleteChecklist(
    DeleteChecklist event,
    Emitter<ListsState> emit,
  ) async {
    final res = await _deleteChecklistUseCase.call(event.id);

    res.when(
      success: (_) {
        final updated = List<ChecklistEntity>.from(state.checklists);
        updated.removeWhere((e) => e.id == event.id);
        emit(state.copyWith(checklists: updated));
      },
      failure: (failure) {
        emit(state.copyWith(message: '삭제 실패'));
      },
    );
  }

  // 체크리스트 토글
  Future<void> _onToggleChecklist(
    ToggleChecklist event,
    Emitter<ListsState> emit,
  ) async {
    // UI 먼저 변경
    final originalList = List<ChecklistEntity>.from(state.checklists);
    final updated = List<ChecklistEntity>.from(state.checklists);

    for (int i = 0; i < updated.length; i++) {
      if (updated[i].id == event.id) {
        updated[i] = updated[i].copyWith(isChecked: event.isChecked);
        break;
      }
    }

    emit(state.copyWith(checklists: updated));

    // 서버 요청
    final res = await _toggleChecklistUseCase.call(
      id: event.id,
      isChecked: event.isChecked,
    );

    res.when(
      success: (_) {
        // 성공 - 아무것도 안 함
      },
      failure: (failure) {
        emit(state.copyWith(checklists: originalList, message: '변경 실패'));
      },
    );
  }

  // 투두리스트 생성
  Future<void> _onCreateTodoList(
    CreateTodoList event,
    Emitter<ListsState> emit,
  ) async {
    final content = event.content.trim();
    if (content.isEmpty) return; // ← event.content 사용

    final newItem = TodoListEntity(
      id: null,
      tripId: state.tripId,
      userId: state.userId,
      content: content, // ← event.content 사용
      isChecked: false,
    );

    final res = await _createTodoListUseCase.call(newItem);

    res.when(
      success: (created) {
        final updated = List<TodoListEntity>.from(state.todolists);
        updated.add(created);
        emit(state.copyWith(todolists: updated, newItemContent: ''));
      },
      failure: (failure) {
        emit(state.copyWith(message: '투두리스트 추가 실패'));
      },
    );
  }

  // 투두리스트 삭제
  Future<void> _onDeleteTodoList(
    DeleteTodoList event,
    Emitter<ListsState> emit,
  ) async {
    final res = await _deleteTodoListUseCase.call(event.id);

    res.when(
      success: (_) {
        final updated = List<TodoListEntity>.from(state.todolists);
        updated.removeWhere((e) => e.id == event.id);
        emit(state.copyWith(todolists: updated));
      },
      failure: (failure) {
        emit(state.copyWith(message: '삭제 실패'));
      },
    );
  }

  // 투두리스트 토글
  Future<void> _onToggleTodoList(
    ToggleTodoList event,
    Emitter<ListsState> emit,
  ) async {
    // UI 먼저 변경
    final originalList = List<TodoListEntity>.from(state.todolists);
    final updated = List<TodoListEntity>.from(state.todolists);

    for (int i = 0; i < updated.length; i++) {
      if (updated[i].id == event.id) {
        updated[i] = updated[i].copyWith(isChecked: event.isChecked);
        break;
      }
    }

    emit(state.copyWith(todolists: updated));

    // 서버 요청
    final res = await _toggleTodoListUseCase.call(
      id: event.id,
      isChecked: event.isChecked,
    );

    res.when(
      success: (_) {
        // 성공 - 아무것도 안 함
      },
      failure: (failure) {
        emit(state.copyWith(todolists: originalList, message: '변경 실패'));
      },
    );
  }
}
