import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/google_auth_data_source.dart';
import '../datasources/supabase_auth_data_source.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDataSource googleDataSource;
  final SupabaseAuthDataSource supabaseAuthDataSource;
  AuthRepositoryImpl(this.googleDataSource, this.supabaseAuthDataSource);

  @override
  Future<Result<UserEntity>> socialSignIn({
    required SocialLoginType type,
  }) async {
    try {
      switch (type) {
        case SocialLoginType.google:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SocialLoginType.kakao:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SocialLoginType.apple:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SocialLoginType.naver:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
      /*final socialToken = await googleDataSource.getSocialToken(type);
      //Todo:해당 부분 토큰로그인가능하게
      final authDto = await supabaseAuthDataSource.signInWithToken(
        type,
        "",
        "",
      );

      return authDto.toEntity();*/
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Result<UserEntity?>> getCurrentUser() async {
    // SupabaseClient에서 현재 사용자 정보를 직접 가져옵니다.
    final UserDTO? user = await supabaseAuthDataSource.getCurrentUser();

    if (user == null) {
      return Result.failure(Failure.authFailure(message: "유저 정보가 없습니다."));
    }

    // Supabase User 객체를 DTO를 거쳐 Entity로 변환하여 반환
    return Result.success(user.toEntity());
  }

  @override
  Stream<Result<UserEntity?>> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signOut() async {
    return await supabaseAuthDataSource.signOut();
  }
}
