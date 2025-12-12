import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:my_travel_friend/core/widget/profile_img.dart';

import '../../../../core/extension/datetime_string_extension.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/chat_entity.dart';
import 'bubble_with_time.dart';

// [이재은] 채팅 메세지
class MessageBox extends StatelessWidget {
  final ChatEntity chat;
  final UserEntity user;

  const MessageBox({super.key, required this.chat, required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final String? time = chat.createdAt?.toTimeOnly();
    final bool isMe = user.id == chat.userId;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[
            ProfileImg(imageUrl: chat.user?.profileImg, radius: 20),
            const SizedBox(width: 8),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isMe && chat.user?.nickname != null)
                  Text(
                    chat.user!.nickname!,
                    style: AppFont.small.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                BubbleWithTime(message: chat.message, time: time!, isMe: isMe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
