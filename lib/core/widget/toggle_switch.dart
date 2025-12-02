import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

// [이재은] 알림 설정 이나 공개/비공개 설정 등에 사용할 수 있는 토글 스위치
// -> onChanged 되었을 때의 동작과 어떤 bool 값을 표기 하고 바꿀 건지 그 value 필요함

class ToggleSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;
  final Color inactiveBackgroundColor = AppColors.lessDark.withOpacity(0.5);

  ToggleSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: colorScheme.onPrimary,
        activeTrackColor: colorScheme.primary,
        inactiveThumbColor: colorScheme.onPrimary,
        inactiveTrackColor: inactiveBackgroundColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
