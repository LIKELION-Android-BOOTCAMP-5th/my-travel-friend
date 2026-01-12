import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

@Singleton()
class WatchAuthStateUseCase {
  final AuthRepository _authRepository;

  WatchAuthStateUseCase(this._authRepository);

  /// 인증 상태 변경 스트림
  Stream<Result<UserEntity?>> call() {
    return _authRepository.authStateChanges();
  }
}
