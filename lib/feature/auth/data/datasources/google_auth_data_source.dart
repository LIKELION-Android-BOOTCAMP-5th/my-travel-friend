import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/google_token_entity.dart';

abstract class GoogleAuthDataSource {
  Future<Result<GoogleTokenEntity>> getGoogleToken();
}
