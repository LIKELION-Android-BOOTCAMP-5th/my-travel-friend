import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onAlarmTap;
  final VoidCallback? onSettingTap;

  const HomeAppBar({
    super.key,
    this.onLogoTap,
    this.onSearchTap,
    this.onAlarmTap,
    this.onSettingTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        color: AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: onLogoTap,
              child: Image.asset(
                "assets/images/logo_long_white.png",
                height: 24,
              ),
            ),

            const Spacer(),

            Button(
              width: 40,
              height: 40,
              icon: Icon(AppIcon.search),
              backgroundColor: Colors.transparent,
              contentColor: AppColors.light,
              borderRadius: 20,
              onTap: onSearchTap,
            ),
            const SizedBox(width: 6),
            Button(
              width: 40,
              height: 40,
              icon: Icon(AppIcon.alarm),
              backgroundColor: Colors.transparent,
              contentColor: AppColors.light,
              borderRadius: 20,
              onTap: onAlarmTap,
            ),
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

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
