import '../../domain/entities/user_entity.dart';

abstract class GoogleAuthDataSource {
  Future<String> getGoogleToken(SocialLoginType type);
}
