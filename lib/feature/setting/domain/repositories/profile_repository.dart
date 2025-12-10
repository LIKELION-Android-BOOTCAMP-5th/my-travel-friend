import 'package:my_travel_friend/core/result/result.dart';

import '../../../auth/domain/entities/user_entity.dart';

// [이재은] 프로필 설정 관련 domain respository
abstract class ProfileRepository {
  // 현재 프로필 가져오기
  Future<Result<UserEntity>> getMyProfile(int userId);

  // 프로필 설정 변경
  Future<Result<UserEntity>> updateProfile(UserEntity profile);
}
