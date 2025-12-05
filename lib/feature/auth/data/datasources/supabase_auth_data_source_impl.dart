import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/push_notification_service.dart';
import 'package:my_travel_friend/feature/auth/data/datasources/supabase_auth_data_source.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';

@LazySingleton(as: SupabaseAuthDataSource)
class SupabaseAuthDataSourceImpl implements SupabaseAuthDataSource {
  final SupabaseClient supabaseClient; // SupabaseClient에 명확하게 의존
  final PushNotificationService pushNotificationService;
  //일반 StreamController 선언
  final StreamController<Result<UserDTO?>> _userStreamController =
      StreamController.broadcast();

  // ✅ 2. 가장 최근 값을 저장할 변수 선언
  UserDTO? _latestUserDTO;
  SupabaseAuthDataSourceImpl(this.supabaseClient, this.pushNotificationService);

  OAuthProvider _getProvider(SocialLoginType type) {
    switch (type) {
      case SocialLoginType.google:
        return OAuthProvider.google;
      case SocialLoginType.kakao:
        return OAuthProvider.kakao;
      case SocialLoginType.apple:
        // [이재은] 애플 추가
        return OAuthProvider.apple;
      case SocialLoginType.naver:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Future<Result<UserDTO>> signInWithToken({
    required SocialLoginType type,
    required String idToken,
    required String accessToken,
  }) async {
    final provider = _getProvider(type);

    try {
      final AuthResponse response = await supabaseClient.auth.signInWithIdToken(
        provider: provider,
        accessToken: accessToken,
        idToken: idToken,
      );
      return Result.success(
        UserDTO(
          id: null,
          uuid: response.user!.id,
          nickname: null,
          email: response.user!.email,
          token: null,
          profileImg: null,
          deletedAt: null,
        ),
      );
    } catch (e) {
      return Result.failure(Failure.undefined(message: "알수없는에러 $e"));
    }
  }

  @override
  Future<Result<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDTO>> getCurrentUser(String uuid) async {
    try {
      final result = await supabaseClient
          .from('user')
          .select("*")
          .eq('uuid', uuid)
          .single();
      return Result.success(UserDTO.fromJson(result));
    } catch (e) {
      return Result.failure(
        Failure.serverFailure(message: '유저 정보를 가져오는데 실패했습니다.'),
      );
    }
  }

  @override
  Future<Result<String>> updateFCMToken(String uuid) async {
    String? token = await pushNotificationService.getToken();
    try {
      final result = await supabaseClient
          .from('user')
          .update({'token': token})
          .eq('uuid', uuid)
          .select();
      return Result.success(token!);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: "토큰 업데이트 실패"));
    }
  }

  @override
  Future<Result<void>> deleteFCMToken(String uuid) {
    // TODO: implement updateFCMToken
    throw UnimplementedError();
  }

  //리스너 구독
  @override
  void initializeAuthListener() {
    supabaseClient.auth.onAuthStateChange.listen((data) {
      _handleAuthChange(data.event, data.session);
    });
  }

  //AuthChangeEvent를 처리하고 UserDTO를 스트림에 추가
  void _handleAuthChange(AuthChangeEvent event, Session? session) async {
    final uuid = session?.user.id;

    switch (event) {
      case AuthChangeEvent.signedIn:
        // 사용자 로그인 (처음 로그인, 재시작 후 세션 복구 포함)
        if (uuid != null) {
          //유저가 존재하면 토큰 업데이트
          await updateFCMToken(uuid);

          //유저 DB 정보 로드
          final userDto = await getCurrentUser(uuid);
          _userStreamController.add(userDto); // DTO를 스트림에 추가
        } else {
          _userStreamController.add(
            Result.failure(Failure.authFailure(message: "uuid가 없습니다.")),
          ); // 세션은 있지만 UUID 없는 경우
        }
        break;
      case AuthChangeEvent.initialSession:
        // 앱 시작 시 기존 세션 확인 및 복구 완료
        if (uuid != null) {
          //유저가 존재하면 토큰 업데이트
          await updateFCMToken(uuid);

          //유저 DB 정보 로드
          final userDto = await getCurrentUser(uuid);
          _userStreamController.add(userDto); // DTO를 스트림에 추가
        } else {
          _userStreamController.add(
            Result.failure(Failure.authFailure(message: "uuid가 없습니다.")),
          ); // 세션은 있지만 UUID 없는 경우
        }
        break;

      case AuthChangeEvent.signedOut:

        ///TODO:토큰 삭제 처리 필요
        //빈 유저 정보 반환
        final userDTO = UserDTO(
          id: null,
          uuid: null,
          nickname: null,
          email: null,
          token: null,
          profileImg: null,
          deletedAt: null,
        );
        _userStreamController.add(Result.success(userDTO));
      case AuthChangeEvent.userDeleted:
        // 토큰 삭제 로직은 서버단에서 트리거를 통해 구현
        final userDTO = UserDTO(
          id: null,
          uuid: null,
          nickname: null,
          email: null,
          token: null,
          profileImg: null,
          deletedAt: null,
        );
        _userStreamController.add(Result.success(userDTO)); // 로그아웃 상태
        break;

      case AuthChangeEvent.userUpdated:
        // 유저 정보 업데이트 시 DB 정보만 다시 로드(auth의 유저만임)
        //public.user정보 업데이트시 getCurrentuser를 통해 다시 정보 가져와야함
        if (uuid != null) {
          final userDto = await getCurrentUser(uuid);
          _userStreamController.add(userDto);
        }
        break;

      // tokenRefreshed, passwordRecovery 등은 상태 변경 없이 무시
      default:
        break;
    }
  }

  //Repository에 제공할 UserDTO 스트림
  @override
  Stream<Result<UserDTO?>> get userProfileStream =>
      _userStreamController.stream;
}
