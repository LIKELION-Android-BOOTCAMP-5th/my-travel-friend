import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'auth_profile_state.freezed.dart';

//유저 로그인 상태 및 해당 유저 객체를 전역으로 가지고있을 블록
@freezed
abstract class AuthProfileState with _$AuthProfileState {
  const AuthProfileState._(); // for custom getters/methods

  //초기 상태: 앱 시작 시, 인증 상태 확인 중이거나 초기화 대기
  const factory AuthProfileState.initial() = AuthProfileInitial;

  //인증 로딩 상태: 세션은 있지만, 유저 DB 정보를 로드 중인 상태
  const factory AuthProfileState.loading() = AuthProfileLoading;

  //인증 완료 및 정보 로드 성공 상태
  const factory AuthProfileState.authenticated({
    required String uuid,
    required UserEntity userInfo, // DB에서 가져온 실제 유저 정보
  }) = AuthProfileAuthenticated;

  //비인증 상태: 로그아웃 상태 또는 세션 없음
  const factory AuthProfileState.unauthenticated() = AuthProfileUnauthenticated;

  //오류 상태: 유저 정보 로딩 또는 스트림에서 오류 발생
  const factory AuthProfileState.error({required String message}) =
      AuthProfileError;
}
