import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';

// [이재은] 채팅 말풍선과 시간
class BubbleWithTime extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const BubbleWithTime({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isMe) ...[
          Text(
            time,
            style: AppFont.tiny.copyWith(
              color: isDark ? AppColors.light : AppColors.dark,
            ),
          ),
          SizedBox(width: 5),
        ],
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isMe
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              message,
              style: AppFont.regular.copyWith(
                color: isMe
                    ? colorScheme.onPrimary
                    : isDark
                    ? AppColors.light
                    : AppColors.dark,
              ),
            ),
          ),
        ),
        if (!isMe) ...[
          SizedBox(width: 5),
          Text(
            time,
            style: AppFont.tiny.copyWith(
              color: isDark ? AppColors.light : AppColors.dark,
            ),
          ),
        ],
      ],
    );
  }
}
