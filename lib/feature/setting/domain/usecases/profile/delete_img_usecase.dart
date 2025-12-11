import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import '../../repositories/profile_repository.dart';

@LazySingleton()
class DeleteImgUseCase {
  final ProfileRepository _profileRepository;

  DeleteImgUseCase(this._profileRepository);

  // 프로필 이미지 삭제
  Future<Result<void>> call(String imgUrl) async {
    // 빈 URL 체크
    if (imgUrl.trim().isEmpty) {
      return const Result.success(null);
    }

    return await _profileRepository.deleteImg(imgUrl);
  }
}
