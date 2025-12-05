import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/feature/auth/data/datasources/google_auth_data_source.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/google_token_entity.dart';

import '../../../../core/result/result.dart';

@LazySingleton(as: GoogleAuthDataSource)
class SocialAuthDataSourceImpl implements GoogleAuthDataSource {
  final GoogleSignIn googleSignIn;
  final scopes = ['email', 'profile'];

  //googleSignIn 주입(서드파티기 떄문에 이는 register_module에서)
  SocialAuthDataSourceImpl(this.googleSignIn);

  //구글로그인후 토큰값 가져오기
  @override
  Future<Result<GoogleTokenEntity>> getGoogleToken() async {
    try {
      final googleUser = await googleSignIn.authenticate();
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);

      debugPrint("authorization : $authorization");

      final idToken = googleUser.authentication.idToken;

      if (idToken == null) {
        return Result.failure(const Failure.undefined(message: "토큰이 없습니다"));
      }

      debugPrint("idToken : $idToken");

      return Result.success(
        GoogleTokenEntity(
          idToken: idToken,
          accessToken: authorization.accessToken,
        ),
      );
    } catch (e) {
      return Result.failure(Failure.undefined(message: "알 수 없는 오류 ${e}"));
    }
  }
}
