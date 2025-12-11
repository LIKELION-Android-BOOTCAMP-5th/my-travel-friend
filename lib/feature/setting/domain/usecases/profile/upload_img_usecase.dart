import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import '../../repositories/profile_repository.dart';

@LazySingleton()
class UploadImgUseCase {
  final ProfileRepository _profileRepository;

  UploadImgUseCase(this._profileRepository);

  // 프로필 이미지 업로드

  Future<Result<String>> call({required File file, required int id}) async {
    return await _profileRepository.uploadImg(file: file, id: id);
  }
}
