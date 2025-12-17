import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ScheduleCategoryTag extends StatelessWidget {
  final String tagName;

  const ScheduleCategoryTag({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: _getColor(tagName),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tagName,
        style: TextStyle(
          color: isDark ? AppColors.light : AppColors.dark,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getColor(String tagName) {
    return switch (tagName) {
      "이동" => AppColors.lightPink.withOpacity(0.3),
      "먹거리" => AppColors.secondary.withOpacity(0.3),
      "관광" => AppColors.primaryLight.withOpacity(0.3),
      "휴식" => AppColors.onMemoContainerDark.withOpacity(0.3),
      "숙박" => AppColors.tertiary.withOpacity(0.3),
      "쇼핑" => AppColors.lightPurple.withOpacity(0.3),
      "액티비티" => AppColors.lightGreen.withOpacity(0.3),
      "기타" => AppColors.navyOutline.withOpacity(0.3),
      _ => AppColors.navyOutline.withOpacity(0.3),
    };
  }
}
