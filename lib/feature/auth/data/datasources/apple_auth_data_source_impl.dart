import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../domain/entities/apple_token_entity.dart';
import 'apple_auth_data_source.dart';

// [이재은] Android랑 iOS native 분리 필요 -> 단 처리는 Supabase에서
@LazySingleton(as: AppleAuthDataSource)
class AppleAuthDataSourceImpl implements AppleAuthDataSource {
  final SupabaseClient supabaseClient;

  // Android OAuth 상태 관리
  Completer<Result<AppleTokenEntity>>? _oauthCompleter;

  AppleAuthDataSourceImpl(this.supabaseClient);

  @override
  bool get isOAuthInProgress =>
      _oauthCompleter != null && !_oauthCompleter!.isCompleted;

  @override
  void cancelOAuth() {
    if (_oauthCompleter != null && !_oauthCompleter!.isCompleted) {
      _oauthCompleter!.complete(
        Result.failure(const Failure.authFailure(message: "로그인이 취소되었습니다")),
      );
    }
    _oauthCompleter = null;
  }

  @override
  Future<Result<AppleTokenEntity>> getAppleToken() async {
    if (Platform.isIOS) {
      return _getAppleTokenNative();
    } else {
      return _getAppleTokenViaOAuth();
    }
  }

  // iOS: 네이티브 Apple 로그인 - 토큰만 반환
  Future<Result<AppleTokenEntity>> _getAppleTokenNative() async {
    try {
      //Supabase 공식 방식: nonce 생성
      final rawNonce = supabaseClient.auth.generateRawNonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;

      if (idToken == null) {
        return Result.failure(
          const Failure.undefined(message: "토큰을 가져올 수 없습니다"),
        );
      }

      debugPrint("Apple idToken (iOS): $idToken");

      // 토큰 정보만 반환 -> Supabase 로그인은 supabase_auth_data_source_impl에서
      return Result.success(
        AppleTokenEntity(
          idToken: idToken,
          rawNonce: rawNonce,
          authorizationCode: credential.authorizationCode,
          givenName: credential.givenName,
          familyName: credential.familyName,
        ),
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return Result.failure(
          const Failure.authFailure(message: "로그인이 취소되었습니다"),
        );
      }
      return Result.failure(
        Failure.authFailure(message: "Apple 로그인 실패: ${e.message}"),
      );
    } catch (e) {
      return Result.failure(Failure.undefined(message: "알 수 없는 오류: $e"));
    }
  }

  // Android: Supabase OAuth 사용
  Future<Result<AppleTokenEntity>> _getAppleTokenViaOAuth() async {
    // Android는 기존 OAuth 방식 유지 (웹 브라우저 통해 로그인)
    // 이 경우 Supabase가 직접 처리하므로 빈 토큰 반환
    if (isOAuthInProgress) {
      cancelOAuth();
    }

    try {
      _oauthCompleter = Completer<Result<AppleTokenEntity>>();

      final res = await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: 'mytravelfriend://login-callback',
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

      if (!res) {
        _oauthCompleter = null;
        return Result.failure(
          const Failure.authFailure(message: "Apple 로그인을 시작할 수 없습니다"),
        );
      }

      // Android OAuth는 Supabase가 직접 처리하므로 빈 토큰 반환
      // auth_repository_impl에서 세션 확인
      final result = await _oauthCompleter!.future.timeout(
        const Duration(minutes: 3),
        onTimeout: () {
          return Result.failure(
            const Failure.authFailure(message: "로그인 시간이 초과되었습니다"),
          );
        },
      );

      _oauthCompleter = null;
      return result;
    } catch (e) {
      _oauthCompleter = null;
      return Result.failure(Failure.undefined(message: "Apple OAuth 오류: $e"));
    }
  }

  // Android OAuth 완료 시 호출 (외부에서 호출)
  void completeOAuth() {
    if (_oauthCompleter != null && !_oauthCompleter!.isCompleted) {
      _oauthCompleter!.complete(
        Result.success(
          const AppleTokenEntity(
            idToken: '',
            rawNonce: '',
            authorizationCode: null,
          ),
        ),
      );
    }
  }
}
