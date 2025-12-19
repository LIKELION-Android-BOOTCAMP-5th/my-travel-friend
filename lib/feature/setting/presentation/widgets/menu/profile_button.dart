import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';

import '../../../../../core/theme/app_font.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/profile_img.dart';
import '../../../../auth/domain/entities/user_entity.dart';

class ProfileButton extends StatelessWidget {
  final UserEntity profile;

  const ProfileButton({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.push('/setting/profile');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileImg(
                    imageUrl: profile.profileImg,
                    imageFile: null,
                    radius: 30,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.nickname!,
                        style: AppFont.big.copyWith(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        profile.email!,
                        style: AppFont.small.copyWith(
                          color: isDark
                              ? AppColors.light.withOpacity(0.7)
                              : AppColors.dark.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  AppIcon.right,
                  size: 17,
                  color: isDark
                      ? AppColors.light.withOpacity(0.5)
                      : AppColors.dark.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
