import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';

import '../../../../../core/theme/app_font.dart';
import '../../viewmodels/menu/menu_state.dart';

class MenuBox extends StatelessWidget {
  final MenuState state;
  final String title;
  final VoidCallback onTap;

  const MenuBox({
    super.key,
    required this.state,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: _getIcon(title, colorScheme),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppFont.regularBold.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
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
          ],
        ),
      ),
    );
  }

  Icon _getIcon(String title, dynamic colorScheme) {
    return switch (title) {
      "친구 목록 보기" => Icon(AppIcon.crews, size: 20, color: colorScheme.onSurface),
      "내가 받은 친구 요청" => Icon(
        AppIcon.letter,
        size: 20,
        color: colorScheme.onSurface,
      ),
      "내가 받은 여행 초대" => Icon(
        AppIcon.letter,
        size: 20,
        color: colorScheme.onSurface,
      ),
      "푸시 알림 설정" => Icon(AppIcon.alarm, size: 20, color: colorScheme.onSurface),
      "테마 설정" => Icon(AppIcon.palette, size: 20, color: colorScheme.onSurface),
      "권한 설정" => Icon(AppIcon.defense, size: 20, color: colorScheme.onSurface),
      "문의하기" => Icon(AppIcon.talk, size: 20, color: colorScheme.onSurface),
      "개인 정보 처리 방침" => Icon(
        AppIcon.user,
        size: 20,
        color: colorScheme.onSurface,
      ),
      "로그아웃" => Icon(AppIcon.logout, size: 20, color: colorScheme.secondary),
      // TODO: Handle this case.
      String() => throw UnimplementedError(),
    };
  }
}
