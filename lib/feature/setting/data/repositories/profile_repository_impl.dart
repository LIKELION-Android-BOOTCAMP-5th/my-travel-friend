import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_data_source.dart';

// [이재은] 프로필 repository
@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  // 프로필 업데이트
  @override
  Future<Result<UserEntity>> updateProfile(UserEntity profile) async {
    final dto = UserDTO.fromEntity(profile);

    final res = await _dataSource.updateProfile(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 이미지 업로드
  @override
  Future<Result<String>> uploadImg({
    required File file,
    required int id,
  }) async {
    return await _dataSource.uploadImg(file: file, id: id);
  }

  // 이미지 삭제
  @override
  Future<Result<void>> deleteImg(String imgUrl) async {
    return await _dataSource.deleteImg(imgUrl);
  }

  // 닉네임 중복 체크
  @override
  Future<Result<bool>> checkNicknameDuplicate(String nickname) async {
    return await _dataSource.checkNicknameDuplicate(nickname);
  }
}
