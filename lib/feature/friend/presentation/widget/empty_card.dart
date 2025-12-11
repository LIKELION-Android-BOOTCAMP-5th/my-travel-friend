import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../theme/app_icon.dart';

/// 친구 없음, 데이터 없음 등 비어있는 상태를 보여줄 때 쓰는 카드
class EmptyCard extends StatelessWidget {
  /// 카드 안 원형 아이콘
  final IconData? icon;

  /// 아이콘 색
  final Color? iconColor;

  /// 첫 번째(굵은) 문구
  final String? title;

  /// 두 번째(작은) 문구
  final String? subtitle;

  const EmptyCard({
    super.key,
    this.icon,
    this.iconColor,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 257,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: cs.surface, // 기본: 테마 surface 색
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 동그란 아이콘 배경
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: cs.inversePrimary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon ?? AppIcon.search,
              size: 32,
              color: iconColor ?? AppColors.navy,
            ),
          ),
          const SizedBox(height: 16),
          Text(title ?? '제목', textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            subtitle ?? '내용',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: cs.outlineVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
