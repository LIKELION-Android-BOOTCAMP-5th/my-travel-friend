import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/useful_pharse_entity.dart';
import '../repositories/trip_repository.dart';

@LazySingleton()
class GetUsefulPharseUsecase {
  final TripRepository _repository;

  GetUsefulPharseUsecase(this._repository);

  // tripId로 여행을 조회한 뒤
  //해당 여행의 country와 같은 useful_pharse 목록을 반환
  Future<Result<List<UsefulPharseEntity>>> call(int tripId) async {
    return await _repository.getUsefulPharse(tripId);
  }
}
