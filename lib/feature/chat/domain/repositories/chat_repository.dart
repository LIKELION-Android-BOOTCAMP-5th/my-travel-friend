import 'package:my_travel_friend/core/result/result.dart';

import '../entities/chat_entity.dart';

// [이재은] 채팅 repository
abstract class ChatRepository {
  // 채팅 메시지 (리스트) 가져오기 - 페이지네이션
  Future<Result<List<ChatEntity>>> getMsgs({int tripId, int page, int limit});

  // 채팅 보내기
  Future<Result<ChatEntity>> sendMsg({
    required int tripId,
    required int userId,
    required String message,
  });

  // Realtime 구독
  Stream<List<ChatEntity>> subscribeMsgs({required int tripId});

  // Realtime 구독 해제
  Future<void> unsubscribeMsgs();
}
