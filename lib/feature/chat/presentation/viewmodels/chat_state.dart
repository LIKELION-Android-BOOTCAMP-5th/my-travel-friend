import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_entity.dart';

part 'chat_state.freezed.dart';

// [이재은] 채팅 상태

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    // 채팅방 정보
    @Default(0) int tripId,
    @Default(0) int userId,

    // 채팅창 (오래된 순 정렬)
    @Default([]) List<ChatEntity> chats,

    // 읽음 상태
    int? lastReadChatId, // 마지막으로 읽은 채팅 id
    @Default(0) int unreadCount, // 안 읽은 채팅 개수
    int? scrollToChatId, // 스크롤할 채팅 ID (입장 시)
    @Default(false) bool hasScrolledToLastRead,

    // 페이지네이션
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,

    // 메세지 전송 상태
    @Default(false) bool isSending,

    // 에러
    String? errorMessage,

    // 페이지 상태
    @Default(ChatPageState.initial) ChatPageState pageState,
  }) = _ChatState;

  // 특정 인덱스에 안읽음 구분선 표시 여부
  bool shouldShowUnreadDivider(int index) {
    if (lastReadChatId == null) return false;
    if (index == 0) return false;

    final current = chats[index];
    final prev = chats[index - 1];

    return (prev.id ?? 0) <= lastReadChatId! &&
        (current.id ?? 0) > lastReadChatId!;
  }

  // 특정 인덱스에 날짜 구분선 표시 여부
  bool shouldShowDateDivider(int index) {
    final current = chats[index];
    if (current.createdAt == null) return false;
    if (index == 0) return true;

    final prev = chats[index - 1];
    if (prev.createdAt == null) return true;

    // 날짜 비교
    final d1 = current.createdAt!.split('T').first;
    final d2 = prev.createdAt!.split('T').first;
    return d1 != d2;
  }

  // 내 메시지인지 확인
  bool isMyMessage(ChatEntity chat) => chat.userId == userId;
}

// 채팅 페이지 상태
enum ChatPageState { initial, loading, loaded, error }
