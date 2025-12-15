import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';

// [이재은] 일정 선택 버튼
class SchedulePickerButton extends StatelessWidget {
  BuildContext context;
  final VoidCallback onTap;

  SchedulePickerButton({super.key, required this.context, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.navy : colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "일정 선택",
            style: AppFont.small.copyWith(
              color: isDark ? colorScheme.primary : colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
