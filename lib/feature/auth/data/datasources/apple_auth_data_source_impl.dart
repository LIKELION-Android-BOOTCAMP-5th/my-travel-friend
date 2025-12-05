import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/result/failures.dart';
import '../../domain/entities/apple_token_entity.dart';
import 'apple_auth_data_source.dart';

// [이재은] 애플 로그인
@LazySingleton(as: AppleAuthDataSource)
class AppleAuthDataSourceImpl implements AppleAuthDataSource {
  @override
  Future<Result<AppleTokenEntity>> getAppleToken() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;

      if (idToken == null) {
        return Result.failure(
          const Failure.undefined(message: "토근을 가져올 수 없습니다"),
        );
      }

      debugPrint("idToken : $idToken");

      return Result.success(
        AppleTokenEntity(
          idToken: idToken,
          authorizationCode: credential.authorizationCode,
        ),
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      // 사용자가 취소한 경우
      if (e.code == AuthorizationErrorCode.canceled) {
        return Result.failure(
          const Failure.authFailure(message: "로그인이 취소되었습니다"),
        );
      }
      return Result.failure(
        Failure.authFailure(message: "Apple 로그인 실패 : ${e.message}"),
      );
    } catch (e) {
      return Result.failure(Failure.undefined(message: "알 수 없는 오류 : $e"));
    }
  }
}
