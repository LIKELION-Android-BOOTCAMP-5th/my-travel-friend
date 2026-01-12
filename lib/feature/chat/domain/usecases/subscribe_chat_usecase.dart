import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/chat/domain/entities/chat_entity.dart';
import 'package:my_travel_friend/feature/chat/domain/repositories/chat_repository.dart';

// [이재은] realtime 구독 usecase
@LazySingleton()
class SubscribeChatUseCase {
  final ChatRepository _chatRepository;

  SubscribeChatUseCase(this._chatRepository);

  // 실시간 구독
  Stream<Result<List<ChatEntity>>> call({required int tripId}) {
    return _chatRepository.subscribeChat(tripId: tripId);
  }

  Future<void> unsubscribe() async {
    await _chatRepository.unsubscribeChat();
  }
}
