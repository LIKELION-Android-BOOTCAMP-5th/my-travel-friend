import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../domain/entities/apple_token_entity.dart';
import 'apple_auth_data_source.dart';

// [이재은] 애플 로그인
@LazySingleton(as: AppleAuthDataSource)
class AppleAuthDataSourceImpl implements AppleAuthDataSource {
  final SupabaseClient supabaseClient;

  // OAuth 상태 관리
  Completer<Result<AppleTokenEntity>>? _oauthCompleter;
  StreamSubscription<AuthState>? _authSubscription;

  AppleAuthDataSourceImpl(this.supabaseClient);

  @override
  bool get isOAuthInProgress =>
      _oauthCompleter != null && _oauthCompleter!.isCompleted;

  @override
  void cancelOAuth() {
    if (_oauthCompleter != null && !_oauthCompleter!.isCompleted) {
      _oauthCompleter!.complete(
        Result.failure(const Failure.authFailure(message: "로그인이 취소되었습니다")),
      );
    }
    _cleanup();
  }

  void _cleanup() {
    _authSubscription?.cancel();
    _authSubscription = null;
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

  // iOS : 네이티브 Apple 로그인
  Future<Result<AppleTokenEntity>> _getAppleTokenNative() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: []);
      final idToken = credential.identityToken;

      if (idToken == null) {
        return Result.failure(
          const Failure.undefined(message: "토큰을 가져올 수 없습니다"),
        );
      }

      debugPrint("Apple idToken (iOS): $idToken");

      return Result.success(
        AppleTokenEntity(
          idToken: idToken,
          authorizationCode: credential.authorizationCode,
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

  // Android : Supabase OAuth 사용
  Future<Result<AppleTokenEntity>> _getAppleTokenViaOAuth() async {
    if (isOAuthInProgress) {
      cancelOAuth();
    }

    try {
      // OAuth 시작 전 Completer로 결과 대기
      _oauthCompleter = Completer<Result<AppleTokenEntity>>();

      // Auth 상태 변화 리스너 (일회성)
      late final StreamSubscription<AuthState> subscription;
      subscription = supabaseClient.auth.onAuthStateChange.listen((data) {
        if (data.event == AuthChangeEvent.signedIn && data.session != null) {
          subscription.cancel();
          if (!_oauthCompleter!.isCompleted) {
            // OAuth 성공 - 빈 토큰 반환 (세션은 이미 Supabase에 저장됨)
            _oauthCompleter!.complete(
              Result.success(
                const AppleTokenEntity(idToken: '', authorizationCode: null),
              ),
            );
          }
          _cleanup();
        }
      });

      // OAuth 시작
      final res = await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: 'mytravelfriend://login-callback',
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

      if (!res) {
        _cleanup();
        return Result.failure(
          const Failure.authFailure(message: "Apple 로그인을 시작할 수 없습니다"),
        );
      }

      // 타임아웃 1분 - 브라우저에서 안 돌아오면 자동 취소
      final result = await _oauthCompleter!.future.timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          return Result.failure(
            const Failure.authFailure(message: "로그인이 취소되었습니다"),
          );
        },
      );

      _cleanup();
      return result;
    } catch (e) {
      _cleanup();
      return Result.failure(Failure.undefined(message: "Apple OAuth 오류: $e"));
    }
  }
}
