import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_unread_state.freezed.dart';

// [이재은] 채팅 안 읽은 개수 상태

@freezed
abstract class ChatUnreadState with _$ChatUnreadState {
  const factory ChatUnreadState({
    @Default(0) int tripId,
    @Default(0) int userId,
    @Default(0) int unreadCount,
    @Default(false) bool isSubscribed,
  }) = _ChatUnreadState;
}
