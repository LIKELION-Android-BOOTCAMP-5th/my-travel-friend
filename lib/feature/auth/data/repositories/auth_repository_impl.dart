import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/google_auth_data_source.dart';
import '../datasources/supabase_auth_data_source.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDataSource googleDataSource;
  final SupabaseAuthDataSource supabaseAuthDataSource;
  AuthRepositoryImpl(this.googleDataSource, this.supabaseAuthDataSource);

  @override
  Future<UserEntity> socialSignIn({required SocialLoginType type}) async {
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
  Future<void> signOut() async {
    try {
      await supabaseAuthDataSource.signOut();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    // SupabaseClient에서 현재 사용자 정보를 직접 가져옵니다.
    final UserDTO? user = await supabaseAuthDataSource.getCurrentUser();

    if (user == null) {
      return null;
    }

    // Supabase User 객체를 DTO를 거쳐 Entity로 변환하여 반환
    return user.toEntity();
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }
}
