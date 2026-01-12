import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/chat_repository.dart';

// [이재은] 여행 크루 목록 가져오기 UseCase
@LazySingleton()
class GetTripCrewUseCase {
  final ChatRepository _repository;

  GetTripCrewUseCase(this._repository);

  Future<Result<List<UserEntity>>> call({required int tripId}) {
    return _repository.getTripCrews(tripId: tripId);
  }
}
