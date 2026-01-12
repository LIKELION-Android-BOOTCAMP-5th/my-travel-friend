import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_token_entity.freezed.dart';

// [이재은] 애플 로그인 토큰 - nonce 추가
@freezed
abstract class AppleTokenEntity with _$AppleTokenEntity {
  const factory AppleTokenEntity({
    required String idToken,
    required String rawNonce, // Supabase signInWithIdToken에 필요
    String? authorizationCode,
    String? givenName,
    String? familyName,
  }) = _AppleTokenEntity;
}
