import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_token_entity.freezed.dart';

@freezed
abstract class AppleTokenEntity with _$AppleTokenEntity {
  const factory AppleTokenEntity({
    required String idToken,
    String? authorizationCode,
  }) = _AppleTokenEntity;
}
