import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';

import '../../../../core/widget/button.dart';
import '../viewmodels/chat/chat_bloc.dart';
import '../viewmodels/chat/chat_state.dart';

// [이재은] 채팅 입력창
class ChatInputBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputBox({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (prev, curr) => prev.isSending != curr.isSending,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextBox(
                    controller: controller,
                    maxLines: 5,
                    minLines: 1,
                    prefixIcon: Icon(
                      AppIcon.talk,
                      size: 17,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Button(
                  onTap: state.isSending ? null : onSend,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    AppIcon.send,
                    color: isDark ? AppColors.light : AppColors.dark,
                  ),
                  contentColor: colorScheme.primary,
                  borderRadius: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
