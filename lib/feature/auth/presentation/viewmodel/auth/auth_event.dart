import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  /// 앱 시작 시 인증 상태를 확인하는 이벤트
  const factory AuthEvent.authStarted() = AuthStarted;

  /// 소셜 로그인으로 로그인 요청 이벤트
  const factory AuthEvent.signInWithSocialPressed({
    required SocialLoginType type,
  }) = SignInWithSocialPressed;

  /// [이재은] 로그인 취소 하는 이벤트 (뒤로가기, 앱복귀등)
  const factory AuthEvent.signInCancelled() = SignInCanceled;

  /// 로그아웃 요청 이벤트
  const factory AuthEvent.signedOut() = SignedOut;
}
