import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/feature/chat/presentation/widgets/chat_input_box.dart';
import 'package:my_travel_friend/feature/chat/presentation/widgets/message_box.dart';

import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_event.dart';
import '../viewmodels/chat_state.dart';
import '../widgets/chat_date_divider.dart';
import '../widgets/chat_unread_divider.dart';

// [이재은] 채팅 화면

class ChatScreen extends StatefulWidget {
  final int tripId;

  const ChatScreen({super.key, required this.tripId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // ========== 스크롤 ==========

  void _onScroll() {
    // 위로 스크롤 시 이전 메시지 로드
    if (_scrollController.position.pixels <= 100) {
      context.read<ChatBloc>().add(const LoadMore());
    }
    _updateReadStatus();
  }

  void _updateReadStatus() {
    final state = context.read<ChatBloc>().state;
    if (state.chats.isEmpty) return;

    final scrollPosition = _scrollController.position;
    final viewportHeight = scrollPosition.viewportDimension;
    final scrollOffset = scrollPosition.pixels;

    final estimatedIndex = ((scrollOffset + viewportHeight) / 80).floor();
    final lastVisibleIndex = estimatedIndex.clamp(0, state.chats.length - 1);

    final lastVisibleChat = state.chats[lastVisibleIndex];
    if (lastVisibleChat.id != null) {
      context.read<ChatBloc>().add(
        UpdateReadStatus(lastReadChatId: lastVisibleChat.id!),
      );
    }
  }

  void _scrollToMessage(int chatId) {
    final state = context.read<ChatBloc>().state;
    final index = state.chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _scrollController.jumpTo(
        (index * 80.0).clamp(0, _scrollController.position.maxScrollExtent),
      );
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendChat() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    context.read<ChatBloc>().add(SendChat(message: message));
    _messageController.clear();

    SchedulerBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  // ========== 빌드 ==========

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userProfile = user.userInfo;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          ChatInputBox(controller: _messageController, onSend: _sendChat),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return BlocConsumer<ChatBloc, ChatState>(
      listenWhen: (prev, curr) =>
          (prev.pageState == ChatPageState.loading &&
              curr.pageState == ChatPageState.loaded) ||
          (prev.chats.length < curr.chats.length),
      listener: (context, state) {
        if (!state.hasScrolledToLastRead && state.scrollToChatId != null) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollToMessage(state.scrollToChatId!);
            context.read<ChatBloc>().add(const MarkScrollCompleted());
          });
        } else if (state.scrollToChatId == null && state.chats.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        }
      },
      builder: (context, state) {
        final user = context.read<AuthProfileBloc>().state;

        if (user is! AuthProfileAuthenticated) {
          return const Center(child: Text("로그인이 필요합니다"));
        }

        final userProfile = user.userInfo;

        // 로딩
        if (state.pageState == ChatPageState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // 에러
        if (state.pageState == ChatPageState.error) {
          return Center(child: Text(state.errorMessage ?? '오류가 발생했어요'));
        }

        // 빈 상태
        if (state.chats.isEmpty) {
          return const Center(
            child: Text('첫 메시지를 보내보세요!', style: TextStyle(color: Colors.grey)),
          );
        }

        // 메시지 목록
        return Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: state.chats.length + (state.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (state.isLoadingMore && index == 0) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }

                final chatIndex = state.isLoadingMore ? index - 1 : index;
                final chat = state.chats[chatIndex];

                return Column(
                  children: [
                    if (state.shouldShowDateDivider(chatIndex))
                      ChatDateDivider(dateString: chat.createdAt),
                    if (state.shouldShowUnreadDivider(chatIndex))
                      const ChatUnreadDivider(),
                    MessageBox(chat: chat, user: userProfile),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
