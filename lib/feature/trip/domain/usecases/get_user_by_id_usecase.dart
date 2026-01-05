import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/trip_repository.dart';

@LazySingleton()
class GetUserByIdUseCase {
  final TripRepository _repository;

  GetUserByIdUseCase(this._repository);

  Future<Result<UserEntity>> call(int userId) {
    return _repository.getUserById(userId);
  }
}
