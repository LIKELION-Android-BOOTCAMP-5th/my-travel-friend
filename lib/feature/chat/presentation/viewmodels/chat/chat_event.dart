import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

// [이재은] 채팅 이벤트

@freezed
abstract class ChatEvent with _$ChatEvent {
  // 채팅방 입장 -> 읽음 상태 조회 + 메시지 로드 + 실시간 구독 시작
  const factory ChatEvent.enterChat({
    required int tripId,
    required int userId,
  }) = EnterChat;

  // 채팅방 퇴장 -> 읽음 상태 저장 + 실시간 구독 해제
  const factory ChatEvent.leaveChat() = LeaveChat;

  // 메시지 보내기
  const factory ChatEvent.sendChat({required String message}) = SendChat;

  // 이전 메시지 더 불러오기 (위로 스크롤)
  const factory ChatEvent.loadMoreChat() = LoadMoreChat;

  // 새 메시지 수신 (실시간)
  const factory ChatEvent.onNewChatReceive({required List<dynamic> chats}) =
      OnNewChatReceive;

  // 읽음 상태 업데이트 (스크롤 시 호출, 디바운스 적용)
  const factory ChatEvent.updateReadStatus({required int lastReadChatId}) =
      UpdateReadStatus;

  // 스크롤 완료 표시
  const factory ChatEvent.markScrollCompleted() = MarkScrollCompleted;

  // 에러 메시지 초기화
  const factory ChatEvent.clearError() = ClearError;

  // 크루 목록에 채팅 보낸 사람 없으면 크루 목록 다시 로드
  const factory ChatEvent.refreshCrews() = RefreshCrews;
}
