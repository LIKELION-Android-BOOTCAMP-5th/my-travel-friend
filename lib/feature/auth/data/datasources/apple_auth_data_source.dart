import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/apple_token_entity.dart';

// [이재은] 애플로그인
abstract class AppleAuthDataSource {
  Future<Result<AppleTokenEntity>> getAppleToken();

  //Android Auth 취소
  void cancelOAuth();

  // 플랫폼 확인
  bool get isOAuthInProgress;
}
