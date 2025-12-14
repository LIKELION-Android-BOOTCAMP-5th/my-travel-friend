import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';
import '../dtos/chat_dto.dart';
import '../dtos/chat_read_status_dto.dart';

// [이재은] 채팅 데이터 소스 (추상)
abstract class ChatDataSource {
  // 채팅 가져오기
  Future<Result<List<ChatDTO>>> getChat({
    required int tripId,
    required int page,
    required int limit,
  });

  // 채팅 보내기
  Future<Result<ChatDTO>> sendChat({required ChatDTO chat});

  // 리얼타임 구독
  Stream<Result<List<ChatDTO>>> subscribeChat(int tripId);

  // 구독 해제
  Future<void> unsubscribeChat();

  // 여행 크루 리스트 조회
  Future<Result<List<UserDTO>>> getTripCrews({required int tripId});

  // 마지막 읽은 위치 조회
  Future<Result<ChatReadStatusDTO?>> getReadStatus({
    required int tripId,
    required int userId,
  });

  // 읽음 상태 업데이트 (upsert)
  Future<Result<ChatReadStatusDTO>> updateReadStatus({
    required int tripId,
    required int userId,
    required int lastReadChatId,
  });

  // 안 읽은 메시지 개수 조회
  Future<Result<int>> getUnreadCount({
    required int tripId,
    required int userId,
  });
}
