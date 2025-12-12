import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';

import '../../../../../core/theme/app_icon.dart';
import '../viewmodels/theme/theme_state.dart';

// [이재은] 테마 설정 관련 위젯
class ThemeBox extends StatelessWidget {
  final ThemeState state;
  final ThemeInfo themeInfo;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLast;

  const ThemeBox({
    super.key,
    required this.state,
    required this.themeInfo,
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
                child: Icon(_getIcon(), size: 24, color: colorScheme.onSurface),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    themeInfo.title,
                    style: AppFont.medium.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    themeInfo.description,
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

  IconData _getIcon() {
    if (state is ThemeLight) return AppIcon.lightMode;
    if (state is ThemeDark) return AppIcon.darkMode;
    return AppIcon.system;
  }
}
