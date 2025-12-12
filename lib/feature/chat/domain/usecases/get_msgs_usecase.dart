import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/chat/domain/repositories/chat_repository.dart';

import '../../../../core/result/result.dart';
import '../entities/chat_entity.dart';

// [이재은] 채팅 메세지 가져오기 usecase
@LazySingleton()
class GetMsgsUseCase {
  final ChatRepository _chatRepository;

  GetMsgsUseCase(this._chatRepository);

  // 채팅 가져오기
  Future<Result<List<ChatEntity>>> call({
    required int tripId,
    required int page,
    int limit = 15,
  }) async {
    return _chatRepository.getMsgs(tripId: tripId, page: page, limit: limit);
  }
}
