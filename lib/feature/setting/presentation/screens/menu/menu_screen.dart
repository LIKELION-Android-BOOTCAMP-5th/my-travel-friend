import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';

import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/button.dart';

// [이재은] 설정 메뉴 화면
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: '설정',
        leading: Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: isDark ? colorScheme.onSurface : AppColors.light,
          borderRadius: 20,
          onTap: () => context.pop(),
        ),
      ),
    );
  }
}
