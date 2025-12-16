import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onAlarmTap;
  final VoidCallback? onSettingTap;
  final IconData? searchIcon;
  final bool hasUnreadAlarm;

  const HomeAppBar({
    super.key,
    this.onLogoTap,
    this.onSearchTap,
    this.onAlarmTap,
    this.onSettingTap,
    this.searchIcon,
    this.hasUnreadAlarm = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        height: preferredSize.height,
        color: isDark
            ? colorScheme.surfaceContainerHighest
            : colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: onLogoTap,
              child: Image.asset(
                isDark
                    ? "assets/images/logo_long_white.png"
                    : "assets/images/logo_long_dark.png",
                width: 150,
              ),
            ),

            const Spacer(),

            Button(
              width: 40,
              height: 40,
              icon: Icon(searchIcon ?? AppIcon.search),
              backgroundColor: Colors.transparent,
              contentColor: AppColors.light,
              borderRadius: 20,
              onTap: onSearchTap,
            ),
            const SizedBox(width: 6),
            _buildAlarmButton(),
            const SizedBox(width: 6),
            Button(
              width: 40,
              height: 40,
              icon: Icon(AppIcon.setting),
              backgroundColor: Colors.transparent,
              contentColor: AppColors.light,
              borderRadius: 20,
              onTap: onSettingTap,
            ),
          ],
        ),
      ),
    );
  }

  // 알림 버튼 (빨간점!)
  Widget _buildAlarmButton() {
    return Stack(
      children: [
        Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.alarm),
          backgroundColor: Colors.transparent,
          contentColor: AppColors.light,
          borderRadius: 20,
          onTap: onAlarmTap,
        ),
        // 빨간 점
        if (hasUnreadAlarm)
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
