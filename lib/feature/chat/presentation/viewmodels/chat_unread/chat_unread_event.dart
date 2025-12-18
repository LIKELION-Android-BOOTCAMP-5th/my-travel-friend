import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_unread_event.freezed.dart';

// [이재은] 채팅 안 읽은 개수 이벤트

@freezed
abstract class ChatUnreadEvent with _$ChatUnreadEvent {
  // 구독 시작 (여행 진입 시)
  const factory ChatUnreadEvent.startSubscription({
    required int tripId,
    required int userId,
  }) = StartUnreadSubscription;

  // 구독 해제 (여행 나갈 때)
  const factory ChatUnreadEvent.stopSubscription() = StopUnreadSubscription;

  // 새 메시지 수신 시 카운트 업데이트
  const factory ChatUnreadEvent.onNewMessage() = OnNewUnreadMessage;

  // 채팅방 진입 시 카운트 초기화
  const factory ChatUnreadEvent.resetCount() = ResetUnreadCount;

  // 채팅방 나올 때 카운트 새로고침
  const factory ChatUnreadEvent.refreshCount() = RefreshUnreadCount;
}
