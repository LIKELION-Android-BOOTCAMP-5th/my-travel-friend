import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  /// 초기 상태 (인증 상태를 확인 중이거나, 기본값)
  const factory AuthState.initial() = AuthInitial;

  /// 로딩 상태 (로그인 또는 로그아웃 요청 처리 중)
  const factory AuthState.loading() = AuthLoading;

  // [이재은] 외부 브라우저 열어서 OAuth 진행
  const factory AuthState.oauthInProgress({required SocialLoginType type}) =
      AuthOAuthInProgress;

  /// 인증된 상태 (로그인 성공, userId는 임시 사용자 식별자)
  const factory AuthState.authenticated({required String uuId}) =
      AuthAuthenticated;

  /// 인증되지 않은 상태 (로그인 필요)
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// 에러 상태 (로그인/로그아웃 실패)
  const factory AuthState.error({required String message}) = AuthError;
}
