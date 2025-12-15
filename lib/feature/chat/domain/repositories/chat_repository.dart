import 'package:my_travel_friend/core/result/result.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../entities/chat_entity.dart';
import '../entities/chat_read_status_entity.dart';

// [이재은] 채팅 repository
abstract class ChatRepository {
  // 채팅 메시지 (리스트) 가져오기 - 페이지네이션
  Future<Result<List<ChatEntity>>> getChat({
    required int tripId,
    required int page,
    required int limit,
  });

  // 여행 크루 가져오기
  Future<Result<List<UserEntity>>> getTripCrews({required int tripId});

  // 마지막 읽은 위치 조회
  Future<Result<ChatReadStatusEntity?>> getReadStatus({
    required int tripId,
    required int userId,
  });

  // 읽음 상태 업데이트 (upsert)
  Future<Result<ChatReadStatusEntity>> updateReadStatus({
    required int tripId,
    required int userId,
    required int lastReadChatId,
  });

  // 안 읽은 메시지 개수 조회
  Future<Result<int>> getUnreadCount({
    required int tripId,
    required int userId,
  });

  // 채팅 보내기
  Future<Result<ChatEntity>> sendChat(ChatEntity chat);

  // Realtime 구독
  Stream<Result<List<ChatEntity>>> subscribeChat({required int tripId});

  // Realtime 구독 해제
  Future<void> unsubscribeChat();
}
