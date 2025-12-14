import 'package:flutter/material.dart';

import '../../../../core/widget/profile_img.dart';
import '../../../auth/domain/entities/user_entity.dart';
import 'add_button_widget.dart';

class RequestFriendWidget extends StatelessWidget {
  final UserEntity user; // 유저 엔티티 받기

  /// 추가 버튼 눌렀을 때 실행
  final VoidCallback? onClick;

  final bool isRequested;

  const RequestFriendWidget({
    super.key,
    required this.user,
    this.onClick,
    this.isRequested = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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

          AddButtonWidget(
            isRequested: isRequested,
            onTap: isRequested ? null : onClick, // 요청됨이면 클릭 비활성
          ),
        ],
      ),
    );
  }
}
