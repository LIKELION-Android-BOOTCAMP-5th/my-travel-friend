import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/apple_token_entity.dart';

// [이재은] 애플로그인 - 토큰만 반환하도록 수정
abstract class AppleAuthDataSource {
  /// Apple 로그인 후 토큰 정보 반환 (iOS 네이티브)
  Future<Result<AppleTokenEntity>> getAppleToken();

  // Android OAuth 취소
  void cancelOAuth();

  // OAuth 진행 중 여부 확인
  bool get isOAuthInProgress;
}
