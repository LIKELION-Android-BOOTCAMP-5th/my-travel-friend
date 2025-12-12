import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/chat/domain/entities/chat_entity.dart';
import 'package:my_travel_friend/feature/chat/domain/repositories/chat_repository.dart';

// [이재은] 채팅 메세지 보내기 usecase
@LazySingleton()
class SendChatUseCase {
  final ChatRepository _chatRepository;

  SendChatUseCase(this._chatRepository);

  // 채팅 보내기
  Future<Result<ChatEntity>> call({required ChatEntity chat}) async {
    return await _chatRepository.sendChat(chat);
  }
}
