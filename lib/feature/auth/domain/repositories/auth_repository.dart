/*
기능에 필요한 계약을 정의 =>추상클래스로 정의하여 실제 구현이 다른곳에서 필요
매개변수로는 순수한 데이터만받는다.
*/
import 'package:my_travel_friend/core/result/result.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  // 소셜 로그인: 토큰을 서버에 전달하고 UserEntity를 받아옴
  // 토큰은 소셜 SDK를 통해 얻는 고유 인증 문자열 (ID Token 또는 Access Token)
  // 소셜로그인은 회원가입 로직이 없습니다.
  Future<Result<UserEntity>> socialSignIn({required SocialLoginType type});

  // 3. 로그아웃
  Future<Result<void>> signOut();

  // 4. 현재 사용자 확인
  Future<Result<UserEntity?>> getCurrentUser();
  //
  Stream<Result<UserEntity?>> authStateChanges();
}
