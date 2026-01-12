import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/chat_read_status_entity.dart';
import '../repositories/chat_repository.dart';

// [이재은] 채팅 마지막 읽은 위치 조회 UseCase
@LazySingleton()
class GetReadStatusUseCase {
  final ChatRepository _repository;

  GetReadStatusUseCase(this._repository);

  Future<Result<ChatReadStatusEntity?>> call({
    required int tripId,
    required int userId,
  }) async {
    return await _repository.getReadStatus(tripId: tripId, userId: userId);
  }
}
