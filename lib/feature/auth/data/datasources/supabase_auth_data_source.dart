import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class SupabaseAuthDataSource {
  Future<UserDTO> signInWithToken({
    required SocialLoginType type,
    required String idToken,
    required String accessToken,
  });
  Future<void> signOut();
  Future<UserDTO> getCurrentUser();
}
