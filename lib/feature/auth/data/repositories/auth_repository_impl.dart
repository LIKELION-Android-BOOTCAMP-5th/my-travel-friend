import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/google_token_entity.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/result/result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/apple_auth_data_source.dart';
import '../datasources/google_auth_data_source.dart';
import '../datasources/supabase_auth_data_source.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDataSource googleDataSource;
  final AppleAuthDataSource appleDataSource; // [이재은] 애플 추가
  final SupabaseAuthDataSource supabaseAuthDataSource;

  AuthRepositoryImpl(
    this.googleDataSource,
    this.appleDataSource,
    this.supabaseAuthDataSource,
  ) {
    //슈퍼베이스 인증 리스너 구독 시작
    supabaseAuthDataSource.initializeAuthListener();
  }

  @override
  Future<Result<UserEntity>> socialSignIn({
    required SocialLoginType type,
  }) async {
    switch (type) {
      case SocialLoginType.google:
        Result<GoogleTokenEntity> result = await googleDataSource
            .getGoogleToken();
        return result.when(
          failure: (fail) {
            return Result.failure(Failure.undefined(message: fail.message));
          },
          success: (success) async {
            final result = await supabaseAuthDataSource.signInWithToken(
              type: type,
              idToken: success.idToken,
              accessToken: success.accessToken,
            );
            return result.when(
              success: (success) {
                print("토큰을 통한 로그인 성공");
                return Result.success(success.toEntity());
              },
              failure: (fail) {
                print("토큰을 통한 로그인 실패");
                return Result.failure(fail);
              },
            );
          },
        );
      case SocialLoginType.kakao:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SocialLoginType.apple: //[이재은] 애플 로그인 추가
        final res = await appleDataSource.getAppleToken();
        return res.when(
          failure: (fail) =>
              Result.failure(Failure.undefined(message: fail.message)),
          success: (token) async {
            final authResult = await supabaseAuthDataSource.signInWithToken(
              type: type,
              idToken: token.idToken,
              accessToken: '', // Apple은 access token 불필요함
            );

            return authResult.when(
              success: (user) => Result.success(user.toEntity()),
              failure: (fail) => Result.failure(fail),
            );
          },
        );
      case SocialLoginType.naver:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Future<Result<UserEntity?>> getCurrentUser(String uuid) async {
    final result = await supabaseAuthDataSource.getCurrentUser(uuid);
    result.when(
      success: (success) {
        // 성공시 DTO를  Entity로 변환하여 반환
        return Result.success(success.toEntity());
      },
      failure: (failure) {
        return failure;
      },
    );
    return Result.failure(Failure.authFailure(message: "유저 정보가 없습니다."));
  }

  @override
  Stream<Result<UserEntity?>> authStateChanges() {
    return supabaseAuthDataSource.userProfileStream.map((result) {
      return result.when(
        success: (success) {
          return Result.success(success?.toEntity());
        },
        failure: (failure) {
          return Result.failure(failure);
        },
      );
    });
  }

  @override
  Future<Result<void>> signOut() async {
    return await supabaseAuthDataSource.signOut();
  }

  //FCM토큰 업데이트 하기
  @override
  Future<Result<String>> updateFCMToken(String uuid) {
    // TODO: implement updateFCMToken
    throw UnimplementedError();
  }

  //FCM토큰 업데이트 하기
  @override
  Future<Result<String>> deleteFCMToken(String uuid) {
    // TODO: implement updateFCMToken
    throw UnimplementedError();
  }
}
