import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:my_travel_friend/core/widget/profile_img.dart';

import '../../../../core/extension/datetime_string_extension.dart';
import '../../domain/entities/chat_entity.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_state.dart';
import 'bubble_with_time.dart';

// [이재은] 채팅 메세지 (members에서 유저 조회)
class MessageBox extends StatelessWidget {
  final ChatEntity chat;

  const MessageBox({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String? time = chat.createdAt?.toTimeOnly();

    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (prev, curr) => false,
      builder: (context, state) {
        final bool isMe = state.userId == chat.userId;
        final user = state.getCrewById(chat.userId);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMe) ...[
                ProfileImg(imageUrl: user?.profileImg, radius: 20),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (!isMe && user?.nickname != null)
                      Text(
                        user!.nickname!,
                        style: AppFont.small.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    BubbleWithTime(
                      message: chat.message,
                      time: time!,
                      isMe: isMe,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
