import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';

@LazySingleton()
class DeleteImgUsecase {
  final TripRepository _tripRepository;
  DeleteImgUsecase(this._tripRepository);

  Future<Result<void>> call(String imgUrl) {
    return _tripRepository.deleteImg(imgUrl);
  }
}
