import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../theme/app_icon.dart';

class AddButtonWidget extends StatelessWidget {
  final bool isRequested; // true = 요청됨 / false = 추가
  final VoidCallback? onTap;

  const AddButtonWidget({super.key, this.isRequested = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: isRequested ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isRequested
              ? cs
                    .outlineVariant // 요청됨 (회색 / 탁한 파랑)
              : cs.inversePrimary, // 추가 (연한 파랑 / 진한 파랑)
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isRequested) ...[
              Icon(AppIcon.okay, size: 15, color: cs.inverseSurface),
              const SizedBox(width: 10),
              Text(
                "요청됨",
                style: TextStyle(color: cs.inverseSurface, fontSize: 14),
              ),
            ] else ...[
              Icon(AppIcon.invite, size: 15, color: AppColors.lessLight),
              const SizedBox(width: 10),
              Text(
                "추가",
                style: const TextStyle(
                  color: AppColors.lessLight,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
