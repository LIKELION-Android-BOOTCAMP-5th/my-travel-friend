import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  /// 앱 시작 시 인증 상태를 확인하는 이벤트
  const factory AuthEvent.authStarted() = AuthStarted;

  /// 구글 계정으로 로그인 요청 이벤트
  const factory AuthEvent.signInWithGooglePressed() = SignInWithGooglePressed;

  /// 카카오 계정으로 로그인 요청 이벤트
  const factory AuthEvent.signInWithKakaoPressed() = SignInWithKakaoPressed;

  /// 로그아웃 요청 이벤트
  const factory AuthEvent.signedOut() = SignedOut;
}
