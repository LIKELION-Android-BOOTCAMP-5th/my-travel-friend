import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

//신강현
//바텀시트 완성했습니다.

class BottomSheetAction {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final VoidCallback onTap;

  BottomSheetAction({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.onTap,
  });
}

class CommonBottomSheet {
  static void show(
    BuildContext context, {
    required String sheetTitle,
    required List<BottomSheetAction> actions,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Close Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Expanded(child: Text(sheetTitle, style: AppFont.big)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 22),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Divider(thickness: 1, height: 1, color: colorScheme.outline),

            const SizedBox(height: 12),

            ...actions.map((action) => _buildActionItem(context, action)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  static Widget _buildActionItem(
    BuildContext context,
    BottomSheetAction action,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: action.iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(action.icon, color: AppColors.light),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(action.title, style: AppFont.regular),
        ),
        onTap: () {
          Navigator.pop(context);
          action.onTap();
        },
      ),
    );
  }
}
