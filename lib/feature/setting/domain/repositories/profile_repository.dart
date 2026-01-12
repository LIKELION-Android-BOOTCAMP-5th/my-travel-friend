import 'dart:io';

import 'package:my_travel_friend/core/result/result.dart';

import '../../../auth/domain/entities/user_entity.dart';

// [이재은] 프로필 설정 관련 domain respository
abstract class ProfileRepository {
  // 프로필 설정 변경
  Future<Result<UserEntity>> updateProfile(UserEntity profile);

  // 이미지 업로드
  Future<Result<String>> uploadImg({required File file, required int id});

  // 이미지 삭제
  Future<Result<void>> deleteImg(String imgUrl);

  // 닉네임 중복 체크
  Future<Result<bool>> checkNicknameDuplicate(String nickname);
}
