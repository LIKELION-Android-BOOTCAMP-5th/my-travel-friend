import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/util/time_ago.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widget/profile_img.dart';
import '../../../auth/domain/entities/user_entity.dart';

class FriendReceviceWidget extends StatelessWidget {
  final UserEntity user; // 유저 엔티티 받기
  final String time;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;

  const FriendReceviceWidget({
    super.key,
    required this.user,
    required this.time,
    this.onLeft,
    this.onRight,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              // 프로필 이미지
              ProfileImg(radius: 20, imageUrl: user.profileImg),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 닉네임
                  children: [
                    Text(
                      user.nickname ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      TimeAgo.getTimeAgo(time),
                      style: TextStyle(
                        color: cs.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      onLeft?.call();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: cs.outlineVariant,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('거절', style: TextStyle(color: cs.onSurface)),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      onRight?.call();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: cs.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: Text(
                      '수락',
                      style: TextStyle(color: AppColors.lessLight),
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
