// import 'package:injectable/injectable.dart';
// import 'package:my_travel_friend/core/result/result.dart';
//
// import '../../../auth/domain/entities/user_entity.dart';
// import '../../domain/repositories/profile_repository.dart';
// import '../datasources/profile_data_source.dart';
//
// // [이재은] 프로필 repository
// @LazySingleton(as: ProfileRepository)
// class ProfileRepositoryImpl implements ProfileRepository {
//   final ProfileDataSource _dataSource;
//   ProfileRepositoryImpl(this._dataSource);
//
//   // 내 프로필 정보 가져오기
//   @override
//   Future<Result<UserEntity>> getMyProfile(int id) async {
//     final res = await _dataSource.getMyProfile(id: id);
//     return res.when(
//       success: (data) => Result.success(data.toEntity()),
//       failure: (failure) => Result.failure(failure),
//     );
//   }
// }
