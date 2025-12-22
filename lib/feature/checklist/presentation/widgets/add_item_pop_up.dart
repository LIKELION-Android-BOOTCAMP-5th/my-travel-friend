import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';

import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_box.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/lists_bloc.dart';
import '../viewmodels/lists_event.dart';
import '../viewmodels/lists_state.dart';

class AddItemPopUp extends StatefulWidget {
  final ListsBloc bloc;
  final ListsTab currentTab;

  const AddItemPopUp({super.key, required this.bloc, required this.currentTab});

  @override
  State<AddItemPopUp> createState() => _AddItemPopUpState();
}

class _AddItemPopUpState extends State<AddItemPopUp> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitItem(String content) {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return;

    if (widget.currentTab == ListsTab.checklist) {
      widget.bloc.add(ListsEvent.createChecklist(content: trimmed));
    } else {
      widget.bloc.add(ListsEvent.createTodoList(content: trimmed));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isChecklist = widget.currentTab == ListsTab.checklist;
    final itemName = isChecklist ? "체크리스트 추가" : "투두리스트 추가";

    return BlocBuilder<ListsBloc, ListsState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return Dialog(
          backgroundColor: colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$itemName 추가',
                        style: AppFont.big.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.bloc.add(
                            const ListsEvent.resetAiRecommendation(),
                          );
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          AppIcon.close,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 입력 필드
                  TextBox(
                    controller: _controller,
                    hintText: isChecklist ? "챙길 것을 적어보세요" : "해야할 일을 적어보세요",
                    autofocus: true,
                    onSubmitted: (_) => _submitItem(_controller.text),
                  ),

                  const SizedBox(height: 16),

                  //AI 추천 버튼
                  GestureDetector(
                    onTap: () {
                      widget.bloc.add(
                        const ListsEvent.requestAiRecommendation(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text('AI 추천 보기', style: AppFont.regularBold),
                        ],
                      ),
                    ),
                  ),

                  //AI로딩
                  if (state.isAiLoading) ...[
                    const SizedBox(height: 16),
                    const Center(child: CircularProgressIndicator()),
                  ],

                  // AI추천
                  if (state.isAiOpened &&
                      state.aiRecommendations.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('추천 항목을 눌러 추가하세요', style: AppFont.small),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: state.aiRecommendations.map((item) {
                              return ActionChip(
                                label: Text(
                                  '+ $item',
                                  style: AppFont.small.copyWith(
                                    color: AppColors.dark,
                                  ),
                                ),
                                onPressed: () {
                                  widget.bloc.add(
                                    ListsEvent.addFromAi(content: item),
                                  );
                                  ToastPop.show('항목이 추가되었습니다.');
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  //추가 버튼
                  Button(
                    text: '추가하기',
                    onTap: () => _submitItem(_controller.text),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 12,
                    contentColor: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
