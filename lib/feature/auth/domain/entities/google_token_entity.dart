import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_token_entity.freezed.dart';

@freezed
abstract class GoogleTokenEntity with _$GoogleTokenEntity {
  const factory GoogleTokenEntity({
    required String idToken,
    required String accessToken,
  }) = _GoogleTokenEntity;
}
