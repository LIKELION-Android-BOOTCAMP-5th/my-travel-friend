import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

part 'auth_profile_event.freezed.dart';

@freezed
abstract class AuthProfileEvent with _$AuthProfileEvent {
  //인증상태에 변화가 있을때의 이벤트
  const factory AuthProfileEvent.authStateChanged(
    Result<UserEntity?> userResult,
  ) = AuthStateChanged;

  //스트림의 UserEntity?가 null이 아닐 때, DB에서 유저 정보를 가져오기
  const factory AuthProfileEvent.fetchUserProfile(String uuid) =
      FetchUserProfile;

  //유저 정보가 업데이트되거나 유저가 삭제되었을 때
  const factory AuthProfileEvent.userRefreshed(String uuid) = UserRefreshed;

  //FCM 토큰 관리 요청 (기존 로직 포함)
  const factory AuthProfileEvent.handleFCMToken({
    required String? uuid,
    required bool isSignIn, // 로그인(true) 또는 로그아웃(false) 시 호출
  }) = HandleFCMToken;

  const factory AuthProfileEvent.error({required String message}) = Error;
}
