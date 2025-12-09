import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../theme/app_icon.dart';

class ListBox extends StatelessWidget {
  final String content;
  final bool isChecked;
  final VoidCallback onToggle;
  final VoidCallback? onDelete;

  const ListBox({
    super.key,
    required this.content,
    required this.isChecked,
    required this.onToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Icon(
              isChecked ? AppIcon.checkedBox : AppIcon.emptyBox,
              color: isChecked ? colorScheme.primary : colorScheme.outline,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              content,
              style: AppFont.regular.copyWith(
                color: isDark
                    ? isChecked
                          ? colorScheme.outline
                          : AppColors.light
                    : isChecked
                    ? colorScheme.outline
                    : AppColors.dark,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: colorScheme.outline,
              ),
            ),
          ),
          if (onDelete != null)
            IconButton(
              onPressed: onDelete,
              icon: Icon(AppIcon.delete, color: colorScheme.error, size: 20),
            ),
        ],
      ),
    );
  }
}
