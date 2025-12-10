import 'dart:io';

import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileDataSource {
  // 내 프로필 불러오기
  Future<Result<UserDTO>> getMyProfile({required int id});

  // 프로필 업데이트
  Future<Result<UserDTO>> updateProfile(UserDTO profile);

  // 이미지 업로드
  Future<Result<String>> uploadImg({required File file, required int id});

  // 이미지 삭제
  Future<Result<void>> deleteImg(String imgUrl);

  // 닉네임 중복 체크(true: 중복)
  Future<Result<bool>> checkNicknameDuplicate(String nickname);
}
