import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/diary_repository.dart';

// [이재은] 다이어리 이미지 업로드 UseCase
@LazySingleton()
class UploadDiaryImgUseCase {
  final DiaryRepository _diaryRepository;

  UploadDiaryImgUseCase(this._diaryRepository);

  Future<Result<String>> call({required File file, required int userId}) {
    return _diaryRepository.uploadImg(file: file, userId: userId);
  }
}
