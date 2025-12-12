import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../viewmodels/theme/theme_state.dart';

// [이재은] 테마 설정 관련 위젯
class ThemeBox extends StatelessWidget {
  final ThemeInfo theme;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLast;

  const ThemeBox({
    super.key,
    required this.theme,
    required this.isSelected,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: switch (theme.type) {
                  AppThemeType.light => Icon(
                    AppIcon.lightMode,
                    size: 24,
                    color: colorScheme.onSurface,
                  ),
                  AppThemeType.dark => Icon(
                    AppIcon.darkMode,
                    size: 24,
                    color: colorScheme.onSurface,
                  ),
                  AppThemeType.system => Icon(
                    AppIcon.system,
                    size: 24,
                    color: colorScheme.onSurface,
                  ),
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    theme.title,
                    style: AppFont.medium.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    theme.description,
                    style: AppFont.small.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
                    ),
                  ),
                ],
              ),
            ),
            isSelected
                ? Icon(
                    AppIcon.checkCircle,
                    size: 26,
                    color: colorScheme.primary,
                  )
                : SizedBox(width: 3),
          ],
        ),
      ),
    );
  }
}
