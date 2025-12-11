import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import '../../repositories/profile_repository.dart';

// [이재은] 닉네임 중복 체크 UseCase

@LazySingleton()
class CheckNicknameDuplicateUseCase {
  final ProfileRepository _repository;

  CheckNicknameDuplicateUseCase(this._repository);

  // 닉네임 중복 체크
  // 반환값: true = 중복, false = 사용 가능
  Future<Result<bool>> call(String nickname) async {
    // 빈 문자열 체크
    if (nickname.trim().isEmpty) {
      return const Result.success(false);
    }

    return await _repository.checkNicknameDuplicate(nickname);
  }
}
