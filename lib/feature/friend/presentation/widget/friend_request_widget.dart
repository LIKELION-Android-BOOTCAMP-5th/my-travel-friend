import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/profile_img.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

/// 친구 검색 결과 한 줄 아이템
class FriendRequestWidget extends StatelessWidget {
  final String nickname;
  final int mutualCount; // 공통 친구 수
  final VoidCallback onTapAdd; // 추가 버튼 눌렀을 때

  const FriendRequestWidget({
    super.key,
    required this.nickname,
    this.mutualCount = 3,
    required this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: cs.onPrimary),
      child: Row(
        children: [
          ProfileImg(),
          const SizedBox(width: 12),

          // 닉네임 + 공통 친구
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '공통 친구 $mutualCount명',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),

          // 추가 버튼
          GestureDetector(
            onTap: onTapAdd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcon.invite, size: 14),
                  SizedBox(width: 4),
                  Text(
                    '추가',
                    style: TextStyle(color: AppColors.lessLight, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
