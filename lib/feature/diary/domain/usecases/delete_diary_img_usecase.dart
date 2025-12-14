import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositories/diary_repository.dart';

// [이재은] 다이어리 이미지 삭제 UseCase
@LazySingleton()
class DeleteDiaryImgUseCase {
  final DiaryRepository _diaryRepository;

  DeleteDiaryImgUseCase(this._diaryRepository);

  Future<Result<void>> call(String imgUrl) {
    return _diaryRepository.deleteImg(imgUrl);
  }
}
