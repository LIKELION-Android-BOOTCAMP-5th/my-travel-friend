import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';

import '../../../../core/extension/datetime_string_extension.dart';

// [이재은] 날짜 구분선 위젯

class ChatDateDivider extends StatelessWidget {
  final String? dateString;

  const ChatDateDivider({super.key, required this.dateString});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: isDark ? AppColors.darkGray : AppColors.lessDark,
              thickness: 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              dateString?.toDateOnly() ?? '',
              style: AppFont.tiny.copyWith(
                color: isDark ? AppColors.darkGray : AppColors.lessDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: isDark ? AppColors.darkGray : AppColors.lessDark,
              thickness: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
