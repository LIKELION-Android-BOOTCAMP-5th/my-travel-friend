import 'package:my_travel_friend/core/result/result.dart';

import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class SupabaseAuthDataSource {
  Future<Result<UserDTO>> signInWithToken({
    required SocialLoginType type,
    required String idToken,
    required String accessToken,
  });

  Future<Result<UserDTO>> signInWithApple({
    required String idToken,
    required String rawNonce,
    String? givenName,
    String? familyName,
  });

  Stream<Result<UserDTO?>> get userProfileStream;
  Future<Result<void>> signOut();
  Future<Result<UserDTO>> getCurrentUser(String uuid);
  Future<Result<String>> updateFCMToken(String uuid);
  Future<Result<void>> deleteFCMToken(String uuid);
  void initializeAuthListener();
}
