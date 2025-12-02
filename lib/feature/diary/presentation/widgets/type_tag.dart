import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_font.dart';
import '../../domain/entities/diary_entity.dart';

// [이재은] 다이어리 타입 표기하는 tag 위젯 생성
class TypeTag extends StatelessWidget {
  final DiaryEntity diary;

  const TypeTag({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    final (Color tagColor, Color textColor, String text) = switch (diary.type) {
      "MEMO" => (
        AppColors.lightGreen.withOpacity(0.25),
        isDark ? AppColors.onMemoContainerDark : AppColors.onMemoContainerLight,
        "메모",
      ),
      "MONEY" => (
        colorScheme.secondary.withOpacity(0.25),
        isDark ? colorScheme.secondary : colorScheme.onSecondaryContainer,
        "소비",
      ),
      "PHOTO" => (
        colorScheme.primary.withOpacity(0.25),
        isDark ? colorScheme.primary : colorScheme.onPrimaryContainer,
        "사진",
      ),
      "REVIEW" => (
        colorScheme.tertiary.withOpacity(0.25),
        isDark ? colorScheme.tertiary : colorScheme.onTertiaryContainer,
        "리뷰",
      ),
      _ => throw UnimplementedError(),
    };

    return Container(
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Text(
        text,
        style: AppFont.tiny.copyWith(
          color: textColor,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
