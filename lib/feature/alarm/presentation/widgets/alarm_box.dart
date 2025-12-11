import 'package:flutter/material.dart';
import 'package:my_travel_friend/feature/alarm/domain/entities/alarm_entity.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../core/util/time_ago.dart';
import 'alarm_icon_color.dart';

// [이재은] 알림 리스트용 박스 위젯
class AlarmBox extends StatelessWidget {
  final AlarmEntity alarm;

  const AlarmBox({super.key, required this.alarm});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final (iconData, iconColor) = alarm.type.alarmIconInfo(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: alarm.isChecked
                ? colorScheme.surfaceContainerHighest.withOpacity(0.2)
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: isDark
                                ? AppColors.navy
                                : colorScheme.primary.withOpacity(0.25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Icon(iconData, color: iconColor, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alarm.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppFont.regular.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            TimeAgo.getTimeAgo(alarm.createdAt!),
                            style: AppFont.small.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
