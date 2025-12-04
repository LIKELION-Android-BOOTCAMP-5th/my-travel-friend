import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

@LazySingleton()
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Result<UserEntity?>> call(String uuid) async {
    return await repository.getCurrentUser(uuid);
  }
}
