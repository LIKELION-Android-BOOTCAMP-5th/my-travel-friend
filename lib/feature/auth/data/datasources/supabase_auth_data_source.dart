import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class SupabaseAuthDataSource {
  Future<UserDTO> signInWithToken(
    SocialLoginType type,
    String idToken,
    String accessToken,
  );
  Future<void> signOut();
  Future<UserDTO> getCurrentUser();
}
