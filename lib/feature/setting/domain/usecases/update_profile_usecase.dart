import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/domain/repositories/profile_repository.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';

@LazySingleton()
class UpdateProfileUseCase {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  // 프로필 수정
  Future<Result<UserEntity>> call(UserEntity profile) {
    return _profileRepository.updateProfile(profile);
  }
}
