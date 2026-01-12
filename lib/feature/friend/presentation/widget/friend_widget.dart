import 'package:flutter/material.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/friend_menu_widget.dart';

import '../../../../core/widget/profile_img.dart';
import '../../../auth/domain/entities/user_entity.dart';

class FriendWidget extends StatelessWidget {
  final UserEntity user; // 유저 엔티티 받기
  final VoidCallback? onMoreGoTravel;
  final VoidCallback? onMoreDeleteFriend;

  const FriendWidget({
    super.key,
    required this.user,
    this.onMoreGoTravel,
    this.onMoreDeleteFriend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 프로필 이미지
          ProfileImg(radius: 20, imageUrl: user.profileImg),
          const SizedBox(width: 16),

          // 닉네임
          Expanded(
            child: Text(
              user.nickname ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 16),

          // 친구 메뉴
          FriendMoreMenuButton(
            onGoTravel: onMoreGoTravel,
            onDeleteFriend: onMoreDeleteFriend,
          ),
        ],
      ),
    );
  }
}
