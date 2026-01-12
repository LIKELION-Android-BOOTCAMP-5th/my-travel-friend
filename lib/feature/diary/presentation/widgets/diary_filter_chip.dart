import 'package:flutter/material.dart';

import '../../../../core/theme/app_font.dart';

// [이재은] 다이어리 타입 필터 칩
// - 전체, 메모, 리뷰, 사진, 소비
class DiaryFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DiaryFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.secondary
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          label,
          style: AppFont.regular.copyWith(
            color: isSelected
                ? colorScheme.onSurface
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
