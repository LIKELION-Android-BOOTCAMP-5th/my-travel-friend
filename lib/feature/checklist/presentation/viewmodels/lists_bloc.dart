import 'package:firebase_ai/firebase_ai.dart';
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
import '../../../trip/domain/usecases/get_trip_by_id_usecase.dart';
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
  final GetTripByIdUseCase _getTripByIdUseCase;
  final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );
  ListsBloc(
    this._getMyChecklistUseCase,
    this._getMyTodoListUseCase,
    this._createChecklistUseCase,
    this._createTodoListUseCase,
    this._deleteChecklistUseCase,
    this._deleteTodoListUseCase,
    this._toggleChecklistUseCase,
    this._toggleTodoListUseCase,
    this._getTripByIdUseCase,
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
    on<RequestAiRecommendation>(_onRequestAiRecommendation);
    on<AddFromAi>(_onAddFromAi);
    on<ResetAiRecommendation>(_onResetAiRecommendation);
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
    List<TodoListEntity> todoLists = [];
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
      success: (data) => todoLists = data,
      failure: (failure) => errorMessage = failure.message,
    );

    emit(
      state.copyWith(
        isLoading: false,
        checklists: checklists,
        todolists: todoLists,
        message: errorMessage,
      ),
    );
  }

  // 탭 변경
  void _onChangeTab(ChangeTab event, Emitter<ListsState> emit) {
    emit(
      state.copyWith(
        currentTab: event.tab,
        newItemContent: '',
        isAiOpened: false,
        isAiLoading: false,
        aiRecommendations: [],
      ),
    );
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
        final updated = List<ChecklistEntity>.from(state.checklists);
        updated.add(created);
        emit(state.copyWith(checklists: updated, newItemContent: ''));
      },
      failure: (failure) {
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

  // 체크리스트 토글 (수정됨)
  Future<void> _onToggleChecklist(
    ToggleChecklist event,
    Emitter<ListsState> emit,
  ) async {
    // 해당 아이템이 이미 토글 중인지 확인
    if (state.togglingChecklistIds.contains(event.id)) return;

    // 토글 중인 ID 추가
    final togglingIds = Set<int>.from(state.togglingChecklistIds)
      ..add(event.id);

    // UI 먼저 변경 (Optimistic Update)
    final updated = state.checklists.map((item) {
      if (item.id == event.id) {
        return item.copyWith(isChecked: event.isChecked);
      }
      return item;
    }).toList();

    emit(
      state.copyWith(checklists: updated, togglingChecklistIds: togglingIds),
    );

    // 서버 요청
    final res = await _toggleChecklistUseCase.call(
      id: event.id,
      isChecked: event.isChecked,
    );

    // 토글 중인 ID 제거
    final updatedTogglingIds = Set<int>.from(state.togglingChecklistIds)
      ..remove(event.id);

    res.when(
      success: (_) {
        emit(state.copyWith(togglingChecklistIds: updatedTogglingIds));
      },
      failure: (failure) {
        // 실패 시 원래 상태로 롤백
        final rolledBack = state.checklists.map((item) {
          if (item.id == event.id) {
            return item.copyWith(isChecked: !event.isChecked);
          }
          return item;
        }).toList();

        emit(
          state.copyWith(
            checklists: rolledBack,
            togglingChecklistIds: updatedTogglingIds,
            message: '변경 실패',
          ),
        );
      },
    );
  }

  // 투두리스트 생성
  Future<void> _onCreateTodoList(
    CreateTodoList event,
    Emitter<ListsState> emit,
  ) async {
    final content = event.content.trim();
    if (content.isEmpty) return;

    final newItem = TodoListEntity(
      id: null,
      tripId: state.tripId,
      userId: state.userId,
      content: content,
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

  // 투두리스트 토글 (수정됨)
  Future<void> _onToggleTodoList(
    ToggleTodoList event,
    Emitter<ListsState> emit,
  ) async {
    // 해당 아이템이 이미 토글 중인지 확인
    if (state.togglingTodoIds.contains(event.id)) return;

    // 토글 중인 ID 추가
    final togglingIds = Set<int>.from(state.togglingTodoIds)..add(event.id);

    // UI 먼저 변경 (Optimistic Update)
    final updated = state.todolists.map((item) {
      if (item.id == event.id) {
        return item.copyWith(isChecked: event.isChecked);
      }
      return item;
    }).toList();

    emit(state.copyWith(todolists: updated, togglingTodoIds: togglingIds));

    // 서버 요청
    final res = await _toggleTodoListUseCase.call(
      id: event.id,
      isChecked: event.isChecked,
    );

    // 토글 중인 ID 제거
    final updatedTogglingIds = Set<int>.from(state.togglingTodoIds)
      ..remove(event.id);

    res.when(
      success: (_) {
        emit(state.copyWith(togglingTodoIds: updatedTogglingIds));
      },
      failure: (failure) {
        // 실패 시 원래 상태로 롤백
        final rolledBack = state.todolists.map((item) {
          if (item.id == event.id) {
            return item.copyWith(isChecked: !event.isChecked);
          }
          return item;
        }).toList();

        emit(
          state.copyWith(
            todolists: rolledBack,
            togglingTodoIds: updatedTogglingIds,
            message: '변경 실패',
          ),
        );
      },
    );
  }

  //AI 추천
  Future<void> _onRequestAiRecommendation(
    RequestAiRecommendation event,
    Emitter<ListsState> emit,
  ) async {
    emit(state.copyWith(isAiLoading: true));

    String? country;
    String? place;

    try {
      // 1️⃣ 여행 정보 조회
      final tripResult = await _getTripByIdUseCase(state.tripId);

      tripResult.when(
        success: (trip) {
          country = trip.country;
          place = trip.place;
        },
        failure: (_) {
          country = null;
          place = null;
        },
      );

      if (country == null) {
        emit(state.copyWith(isAiLoading: false));
        return;
      }

      // 2️⃣ 프롬프트 생성
      final prompt = _buildAiPrompt(
        tab: state.currentTab,
        country: country!,
        place: place!,
      );

      // 3️⃣ Gemini 호출
      final response = await _model.generateContent([Content.text(prompt)]);

      final raw = response.text ?? '';

      final aiItems = raw
          .split('\n')
          .map((e) => e.replaceAll(RegExp(r'^[*\-•\d\.\s]+'), '').trim())
          .where((e) => e.isNotEmpty)
          .toList();

      // 4️⃣ 기존 항목 제거
      final existing = state.currentTab == ListsTab.checklist
          ? state.checklists.map((e) => e.content).toSet()
          : state.todolists.map((e) => e.content).toSet();

      final filtered = aiItems.where((e) => !existing.contains(e)).toList();

      emit(
        state.copyWith(
          isAiLoading: false,
          isAiOpened: true,
          aiRecommendations: filtered,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isAiLoading: false));
    }
  }

  //AI 용 프롬포트
  String _buildAiPrompt({
    required ListsTab tab,
    required String country,
    required String place,
  }) {
    if (tab == ListsTab.checklist) {
      return '''
나는 한국인이다.
곧 $country의 $place로 여행을 간다.

이 여행을 위해 챙기면 좋은 "물품"만 알려줘.

 반드시 지켜야 할 규칙:
- 설명 문장 쓰지 말 것
- 제목 쓰지 말 것
- ':' 포함 문장 쓰지 말 것
- 한 줄에 하나의 항목만
- 기호(*, -, 숫자) 없이 단어 형태로
''';
    } else {
      return '''
나는 한국인이다.
곧 $country의 $place로 여행을 간다.

이 여행을 위해 미리 해야 할 "할 일"만 알려줘.

반드시 지켜야 할 규칙:
- 설명 문장 쓰지 말 것
- 제목 쓰지 말 것
- ':' 포함 문장 쓰지 말 것
- 한 줄에 하나의 할 일만
- 기호(*, -, 숫자) 없이 짧은 문장으로
''';
    }
  }

  //AI 추천된거 추가하기
  Future<void> _onAddFromAi(AddFromAi event, Emitter<ListsState> emit) async {
    final content = event.content.trim();
    if (content.isEmpty) return;

    // 기존 생성 로직 재사용
    if (state.currentTab == ListsTab.checklist) {
      add(ListsEvent.createChecklist(content: content));
    } else {
      add(ListsEvent.createTodoList(content: content));
    }

    // 추천 목록에서 제거
    emit(
      state.copyWith(
        aiRecommendations: state.aiRecommendations
            .where((e) => e != content)
            .toList(),
      ),
    );
  }

  void _onResetAiRecommendation(
    ResetAiRecommendation event,
    Emitter<ListsState> emit,
  ) {
    emit(
      state.copyWith(
        isAiOpened: false,
        isAiLoading: false,
        aiRecommendations: [],
      ),
    );
  }
}
