import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';

class EmptyTravelCard extends StatelessWidget {
  final String title;
  final String description;

  const EmptyTravelCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 40), // ⭐ 상단에서 조금 내려옴
      child: Align(
        alignment: Alignment.topCenter, // ⭐ 위쪽 중앙 정렬
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 내부는 그대로 중심
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: IconTheme(
                  data: IconThemeData(color: colorScheme.primary, size: 32),
                  child: Icon(AppIcon.mapPin),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: AppFont.big.copyWith(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  description,
                  style: AppFont.regular.copyWith(
                    color: isDark
                        ? AppColors.light.withOpacity(0.7)
                        : AppColors.dark.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
