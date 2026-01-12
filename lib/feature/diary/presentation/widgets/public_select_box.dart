import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/toggle_switch.dart';

class PublicSelectBox extends StatelessWidget {
  final bool isPublic;
  final ValueChanged<bool> onChanged;

  const PublicSelectBox({
    super.key,
    required this.isPublic,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.navy : AppColors.darkerGray,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(AppIcon.lock, color: colorScheme.onSurface, size: 20),
                SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPublic ? '공개' : '비공개',
                      style: AppFont.small.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      isPublic ? '다이어리를 다같이 볼 수 있어요' : '다이어리를 나만 볼 수 있어요',
                      style: AppFont.tiny.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            ToggleSwitch(value: isPublic, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
