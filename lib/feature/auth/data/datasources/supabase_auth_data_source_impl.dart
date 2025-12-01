import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/data/datasources/supabase_auth_data_source.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';

@LazySingleton(as: SupabaseAuthDataSource)
class SupabaseAuthDataSourceImpl implements SupabaseAuthDataSource {
  final SupabaseClient supabaseClient; // SupabaseClient에 명확하게 의존

  SupabaseAuthDataSourceImpl(this.supabaseClient);

  OAuthProvider _getProvider(SocialLoginType type) {
    // switch (type) { ... } 로직 구현
    throw UnimplementedError();
  }

  @override
  Future<UserDTO> signInWithToken(
    SocialLoginType type,
    String idToken,
    String accessToken,
  ) async {
    final provider = _getProvider(type);

    try {
      final AuthResponse response = await supabaseClient.auth.signInWithIdToken(
        provider: provider,
        accessToken: accessToken,
        idToken: idToken,
      );

      if (response.user == null) {
        throw Exception('Supabase signIn failed: User is null');
      }

      // Supabase User 정보를 DTO로 변환
      // return AuthDTO.fromSupabaseUser(response.user!);
      return UserDTO.fromJson({}); // Mock
    } catch (e) {
      // Supabase AuthException을 잡아서 처리
      throw Exception('Supabase authentication failed: $e');
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserDTO> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
