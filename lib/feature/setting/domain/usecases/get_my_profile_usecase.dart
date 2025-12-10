import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/setting/domain/repositories/profile_repository.dart';

import '../../../../core/result/result.dart';

// [이재은] 내 프로필 가져오기 usecase
@LazySingleton()
class GetMyProfileUseCase {
  final ProfileRepository _profileRepository;

  GetMyProfileUseCase(this._profileRepository);

  // 내 프로필 가져오기
  Future<Result<UserEntity>> call(int id) {
    return _profileRepository.getMyProfile(id);
  }
}
