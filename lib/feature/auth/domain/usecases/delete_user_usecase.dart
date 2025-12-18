import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class DeleteUserUseCase {
  final AuthRepository repository;

  DeleteUserUseCase(this.repository);

  Future<Result<void>> call() async {
    return await repository.deleteUser();
  }
}
