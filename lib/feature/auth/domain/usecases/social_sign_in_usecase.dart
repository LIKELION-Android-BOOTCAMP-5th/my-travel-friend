import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@LazySingleton()
class SocialSignInUseCase {
  final AuthRepository repository;

  SocialSignInUseCase(this.repository);

  // 이 UseCase를 BLoC에서 호출할 때, 타입을 전달
  Future<UserEntity> call({required SocialLoginType type}) async {
    return await repository.socialSignIn(type: type);
  }
}
