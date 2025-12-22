import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/floating_button.dart';
import '../coachmarks/checklist_coach_mark.dart';
import '../viewmodels/lists_bloc.dart';
import '../viewmodels/lists_event.dart';
import '../viewmodels/lists_state.dart';
import '../widgets/add_item_pop_up.dart';
import '../widgets/check_todo_tab.dart';
import '../widgets/list_box.dart';

// [이재은] 체크리스트/투두리스트 화면
// - 탭 전환 (짐 목록 / 가기전 해야할일)
// - 진행률 표시
// - 체크박스 리스트
// - FloatingActionButton으로 항목 추가

class ListsScreen extends StatefulWidget {
  final int tripId;
  final int userId;

  const ListsScreen({super.key, required this.tripId, required this.userId});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  late final ChecklistCoachMark _coachMark;

  @override
  void initState() {
    super.initState();
    _coachMark = ChecklistCoachMark();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _coachMark.show(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 탭 버튼
              _buildTabs(context),
              const SizedBox(height: 16),

              // 진행률 표시
              _buildProgressSection(context),
              const SizedBox(height: 16),

              // 리스트
              Expanded(child: _buildList(context)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        key: _coachMark.fabKey,
        icon: Icon(AppIcon.plus, color: AppColors.light),
        backgroundColor: colorScheme.primary,
        onPressed: () {
          _showAddItemDialog(context);
        },
      ),
    );
  }

  // 탭 버튼 (짐 목록 / 가기 전 해야 할 일)
  Widget _buildTabs(BuildContext context) {
    return BlocBuilder<ListsBloc, ListsState>(
      buildWhen: (prev, curr) => prev.currentTab != curr.currentTab,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CheckTodoTab(
                key: _coachMark.checklistTabKey,
                label: '챙길 것',
                isSelected: state.currentTab == ListsTab.checklist,
                onTap: () => context.read<ListsBloc>().add(
                  const ListsEvent.changeTab(tab: ListsTab.checklist),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CheckTodoTab(
                key: _coachMark.todoTabKey,
                label: '해야 할 것',
                isSelected: state.currentTab == ListsTab.todoList,
                onTap: () => context.read<ListsBloc>().add(
                  const ListsEvent.changeTab(tab: ListsTab.todoList),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // 진행률 표시 섹션
  Widget _buildProgressSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ListsBloc, ListsState>(
      buildWhen: (prev, curr) =>
          prev.currentTab != curr.currentTab ||
          prev.checklists != curr.checklists ||
          prev.todolists != curr.todolists,
      builder: (context, state) {
        final total = state.totalCount;
        final checked = state.checkedCount;
        final progress = total > 0 ? checked / total : 0.0;
        final percentage = (progress * 100).toInt();

        final tabLabel = state.currentTab == ListsTab.checklist
            ? '이만큼 챙겼어요!'
            : '이만큼 했어요!';

        return Container(
          key: _coachMark.progressKey,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$checked / $total ($percentage%)',
                    style: AppFont.regularBold.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: colorScheme.outline.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 리스트 빌더
  Widget _buildList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ListsBloc, ListsState>(
      buildWhen: (prev, curr) =>
          prev.currentTab != curr.currentTab ||
          prev.checklists != curr.checklists ||
          prev.todolists != curr.todolists,
      builder: (context, state) {
        final isChecklist = state.currentTab == ListsTab.checklist;
        final items = isChecklist ? state.checklists : state.todolists;

        // 빈 상태
        if (items.isEmpty) {
          return Container(
            key: _coachMark.listKey,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isChecklist ? "아직 체크리스트가 비어있어요" : "아직 투두리스트가 비어있어요",
                    style: AppFont.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isChecklist
                        ? '+ 버튼을 눌러 챙길 것을 추가해보세요'
                        : '+ 버튼을 눌러 할 일을 추가해보세요',
                    style: AppFont.small.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // 리스트
        return Container(
          key: _coachMark.listKey,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: items.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: colorScheme.outline.withOpacity(0.1)),
            itemBuilder: (context, index) {
              if (isChecklist) {
                final item = state.checklists[index];
                return ListBox(
                  content: item.content,
                  isChecked: item.isChecked,
                  onToggle: () {
                    if (item.id != null) {
                      context.read<ListsBloc>().add(
                        ListsEvent.toggleChecklist(
                          id: item.id!,
                          isChecked: !item.isChecked,
                        ),
                      );
                    }
                  },
                  onDelete: () {
                    if (item.id != null) {
                      context.read<ListsBloc>().add(
                        ListsEvent.deleteChecklist(id: item.id!),
                      );
                    }
                  },
                );
              } else {
                final item = state.todolists[index];
                return ListBox(
                  content: item.content,
                  isChecked: item.isChecked,
                  onToggle: () {
                    if (item.id != null) {
                      context.read<ListsBloc>().add(
                        ListsEvent.toggleTodoList(
                          id: item.id!,
                          isChecked: !item.isChecked,
                        ),
                      );
                    }
                  },
                  onDelete: () {
                    if (item.id != null) {
                      context.read<ListsBloc>().add(
                        ListsEvent.deleteTodoList(id: item.id!),
                      );
                    }
                  },
                );
              }
            },
          ),
        );
      },
    );
  }

  // 항목 추가 Popup Dialog
  void _showAddItemDialog(BuildContext context) {
    final bloc = context.read<ListsBloc>();
    final currentTab = bloc.state.currentTab;

    showDialog(
      context: context,
      builder: (_) => AddItemPopUp(bloc: bloc, currentTab: currentTab),
    );
  }
}
