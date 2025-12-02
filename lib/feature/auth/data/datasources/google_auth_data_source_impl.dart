import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/auth/data/datasources/google_auth_data_source.dart';

import '../../domain/entities/user_entity.dart';

@LazySingleton(as: GoogleAuthDataSource)
class SocialAuthDataSourceImpl implements GoogleAuthDataSource {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final scopes = ['email', 'profile'];
  @override
  Future<String> getSocialToken(SocialLoginType type) async {
    /*
    if (type == SocialLoginType.google) {
      final account = await _googleSignIn.signIn();
      final auth = await account?.authentication;
      if (auth?.idToken == null) throw Exception('Google ID Token not found.');
      return auth!.idToken!;
    } else if (type == SocialLoginType.kakao) {
      final token = await UserApi.instance.loginWithKakaoAccount();
      return token.accessToken;
    }*/
    throw UnsupportedError('Unsupported social login type');
  }
}
