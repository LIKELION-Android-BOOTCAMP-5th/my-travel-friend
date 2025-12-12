import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/chat/domain/entities/chat_entity.dart';
import 'package:my_travel_friend/feature/chat/domain/repositories/chat_repository.dart';

// [이재은] 채팅 메세지 보내기 usecase
@LazySingleton()
class SendMsgUseCase {
  final ChatRepository _chatRepository;

  SendMsgUseCase(this._chatRepository);

  // 채팅 보내기
  Future<Result<ChatEntity>> call({
    required int tripId,
    required int userId,
    required String message,
  }) async {
    return await _chatRepository.sendMsg(
      tripId: tripId,
      userId: userId,
      message: message,
    );
  }
}
