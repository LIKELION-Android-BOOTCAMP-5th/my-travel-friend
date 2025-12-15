import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../repositories/chat_repository.dart';

// [이재은] 채팅 안 읽은 메시지 개수 조회 UseCase
@LazySingleton()
class GetUnreadCountUseCase {
  final ChatRepository _repository;

  GetUnreadCountUseCase(this._repository);

  Future<Result<int>> call({required int tripId, required int userId}) async {
    return await _repository.getUnreadCount(tripId: tripId, userId: userId);
  }
}
