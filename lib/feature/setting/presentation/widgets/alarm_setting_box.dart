import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/toggle_switch.dart';

import '../../../../theme/app_font.dart';

class AlarmSettingBox extends StatelessWidget {
  final String type;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLast;

  const AlarmSettingBox({
    super.key,
    required this.type,
    required this.value,
    required this.onChanged,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                type,
                style: AppFont.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          ToggleSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
