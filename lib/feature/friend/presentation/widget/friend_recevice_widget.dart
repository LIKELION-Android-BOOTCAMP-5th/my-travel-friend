import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../core/widget/profile_img.dart';
import '../../../../theme/app_icon.dart';

/// 받은 친구 요청 1개를 보여주는 카드 위젯
class ReceivedFriendRequestCard extends StatelessWidget {
  final String nickname;
  final String subtitle;
  final String? profileImageUrl;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const ReceivedFriendRequestCard({
    super.key,
    required this.nickname,
    required this.subtitle,
    this.profileImageUrl,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 + 텍스트
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImg(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nickname, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text(subtitle, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 수락 / 거절 버튼
          Row(
            children: [
              // 수락 버튼 (파란색, 체크 아이콘)
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: onAccept,
                    icon: Icon(AppIcon.okay, size: 18),
                    label: const Text('수락'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      foregroundColor: AppColors.lessLight,
                      backgroundColor: cs.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 거절 버튼
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton.icon(
                    onPressed: onReject,
                    icon: const Icon(AppIcon.close, size: 18),
                    label: const Text('거절'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: BorderSide(color: Colors.grey[400]!),
                      foregroundColor: cs.onSurface,
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
