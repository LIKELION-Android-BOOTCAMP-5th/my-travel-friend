import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../theme/app_icon.dart';

// [이재은] 알람 타입별 아이콘 및 아이콘 컬러
extension AlarmTypeExtension on String {
  (IconData, Color) alarmIconInfo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return switch (this) {
      "TRIP_REQUEST" => (AppIcon.airplane, colorScheme.primary),
      "FRIEND_REQUEST" => (AppIcon.invite, colorScheme.secondary),
      "NEW_FRIEND" => (AppIcon.crews, colorScheme.secondary),
      "SCHEDULE_EDITED" => (AppIcon.calendar, colorScheme.tertiary),
      "SCHEDULE_ADDED" => (AppIcon.calendar, colorScheme.tertiary),
      "SCHEDULE_DELETED" => (AppIcon.calendar, colorScheme.tertiary),
      "TALK_MESSAGE" => (AppIcon.talk, AppColors.lightGreen),
      "D_DAY" => (AppIcon.airplaneFly, colorScheme.primary),
      String() => (AppIcon.alarm, AppColors.lightGray),
    };
  }
}
