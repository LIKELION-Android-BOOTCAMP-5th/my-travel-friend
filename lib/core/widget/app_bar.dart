import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

class CustomButtonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // 앱바 화면 제목
  final String title;
  final String? subtitle;

  // 왼쪽 버튼
  final Button? leading;

  // 오른쪽 버튼 리스트
  final List<Button> actions;

  const CustomButtonAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
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
            if (leading != null) leading!,
            if (leading != null) const SizedBox(width: 8),

            //타이틀 + 서브타이틀 영역
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFont.hugeBold.copyWith(
                      color: isDark ? colorScheme.onSurface : AppColors.light,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: AppFont.big.copyWith(
                        color: isDark ? colorScheme.onSurface : AppColors.light,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            /// 오른쪽 액션 버튼들
            ...actions.map(
              (btn) =>
                  Padding(padding: const EdgeInsets.only(left: 6), child: btn),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
