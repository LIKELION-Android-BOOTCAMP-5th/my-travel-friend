import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

class DatePickerBox extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const DatePickerBox({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.navy : AppColors.darkGray,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          value.isEmpty ? label : value,
          style: TextStyle(
            color: isDark
                ? value.isEmpty
                      ? colorScheme.onSurfaceVariant
                      : AppColors.darkerGray
                : value.isEmpty
                ? AppColors.dark.withOpacity(0.7)
                : AppColors.dark,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
