import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/chat_read_status_entity.dart';
import '../repositories/chat_repository.dart';

// [이재은] 채팅 읽음 상태 업데이트 UseCase
@LazySingleton()
class UpdateReadStatusUseCase {
  final ChatRepository _repository;

  UpdateReadStatusUseCase(this._repository);

  Future<Result<ChatReadStatusEntity>> call({
    required int tripId,
    required int userId,
    required int lastReadChatId,
  }) async {
    return await _repository.updateReadStatus(
      tripId: tripId,
      userId: userId,
      lastReadChatId: lastReadChatId,
    );
  }
}
