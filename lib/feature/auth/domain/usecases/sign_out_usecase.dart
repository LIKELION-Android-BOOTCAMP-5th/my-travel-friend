import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../repositories/auth_repository.dart';

@LazySingleton()
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  // 이 UseCase를 BLoC에서 호출할 때, 타입을 전달
  Future<Result<void>> call() async {
    return await repository.signOut();
  }
}
