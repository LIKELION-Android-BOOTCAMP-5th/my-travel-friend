import 'package:flutter/material.dart';

import '../../../../core/widget/profile_img.dart';
import 'friend_menu_widget.dart';

class FriendWidget extends StatelessWidget {
  final String name;
  final String? profileImg;
  final VoidCallback? onTap;
  final VoidCallback? onMoreGoTravel;
  final VoidCallback? onMoreDeleteFriend;

  const FriendWidget({
    super.key,
    required this.name,
    this.profileImg,
    this.onTap,
    this.onMoreGoTravel,
    this.onMoreDeleteFriend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 프로필 이미지
          ProfileImg(radius: 56, imageUrl: profileImg),
          const SizedBox(width: 16),
          // 닉네임 (가변, 1줄, ... 처리)
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 16),
          // 아이콘
          //IconButton(icon: Icon(AppIcon.threeDots), onPressed: () {}),
          FriendMoreMenuButton(
            onGoTravel: onMoreGoTravel,
            onDeleteFriend: onMoreDeleteFriend,
          ),
        ],
      ),
    );
  }
}
