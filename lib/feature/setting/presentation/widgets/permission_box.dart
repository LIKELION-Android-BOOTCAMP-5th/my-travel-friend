import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/toggle_switch.dart';
import 'package:my_travel_friend/theme/app_font.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

import '../../../../core/service/internal/permission_service.dart';
import '../../../../theme/app_colors.dart';

class PermissionBox extends StatelessWidget {
  // 표시할 권한 정보
  final PermissionInfo permission;
  final VoidCallback onToggle;
  final bool isLast;

  const PermissionBox({
    super.key,
    required this.permission,
    required this.onToggle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  switch (permission.type) {
                    AppPermissionType.notification => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: colorScheme.primary.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          AppIcon.alarm,
                          size: 24,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    AppPermissionType.camera => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: colorScheme.secondary.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          AppIcon.camera,
                          size: 24,
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                    AppPermissionType.photo => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: colorScheme.tertiary.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          AppIcon.image,
                          size: 24,
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
                  },
                  SizedBox(width: 16),
                  Text(
                    permission.title,
                    style: AppFont.medium.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
                    ),
                  ),
                ],
              ),
              ToggleSwitch(
                value: permission.isGranted,
                onChanged: (value) {
                  onToggle();
                },
              ),
            ],
          ),
          SizedBox(height: 12),
          Center(
            child: Row(
              children: [
                Expanded(
                  child: switch (permission.type) {
                    AppPermissionType.notification => Text(
                      "여행 일정, 친구 초대 등의 알림을 받을 수 있어요",
                      style: AppFont.small.copyWith(
                        color: isDark ? AppColors.light : AppColors.dark,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    AppPermissionType.camera => Text(
                      "여행 사진을 촬영해서 다이어리에 추가할 수 있어요",
                      style: AppFont.small.copyWith(
                        color: isDark ? AppColors.light : AppColors.dark,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    AppPermissionType.photo => Text(
                      "갤러리 안의 사진을 다이어리에 추가할 수 있어요",
                      style: AppFont.small.copyWith(
                        color: isDark ? AppColors.light : AppColors.dark,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
