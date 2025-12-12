import 'package:flutter/material.dart';

import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_box.dart';
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

    return Dialog(
      backgroundColor: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemName 추가',
                  style: AppFont.big.copyWith(color: colorScheme.onSurface),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
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
            // AI 추천 버튼 (추후 구현용 placeholder)
            // GestureDetector(
            //   onTap: () {
            //     // TODO: AI 추천 기능 구현
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     padding: const EdgeInsets.symmetric(vertical: 14),
            //     decoration: BoxDecoration(
            //       color: AppColors.tertiary.withOpacity(0.3),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           CupertinoIcons.sparkles,
            //           color: isDark ? colorScheme.tertiaryContainer : colorScheme.onTertiaryContainer,
            //           size: 20,
            //         ),
            //         const SizedBox(width: 8),
            //         Text(
            //           'AI 추천 보기',
            //           style: AppFont.regular.copyWith(
            //             color: isDark ? colorScheme.tertiaryContainer : colorScheme.onTertiaryContainer,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 12),

            // 추가 버튼
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
    );
  }
}
