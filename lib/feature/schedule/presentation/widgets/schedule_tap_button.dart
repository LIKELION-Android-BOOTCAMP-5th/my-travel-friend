import 'package:flutter/material.dart';

import '../../../../core/theme/app_font.dart';

class ScheduleTapButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  // 🔥 크기 관련 옵션
  final double height;
  final double horizontalPadding;

  const ScheduleTapButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.height = 40, // 기본값
    this.horizontalPadding = 20, // 기본값
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height, // 🔥 높이 제어
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(height / 2), // 🔥 pill 느낌
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
