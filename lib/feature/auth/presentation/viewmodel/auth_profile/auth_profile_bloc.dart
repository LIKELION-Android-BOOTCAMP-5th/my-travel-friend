import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:my_travel_friend/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_event.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';

import '../../../domain/usecases/watch_auth_state_usecase.dart';

@singleton
class AuthProfileBloc extends Bloc<AuthProfileEvent, AuthProfileState> {
  final WatchAuthStateUseCase _watchAuthStateUseCase; // 스트림 구독
  final GetCurrentUserUseCase _getCurrentUserUseCase; // 유저 DB 정보 로딩
  final SignOutUseCase _signOutUseCase; //로그아웃시
  // 스트림 구독 관리
  late final StreamSubscription _authStateSubscription;

  AuthProfileBloc(
    this._watchAuthStateUseCase,
    this._getCurrentUserUseCase,
    this._signOutUseCase,
    // this._fcmService,
  ) : super(const AuthProfileState.initial()) {
    // 이벤트 핸들러 등록
    on<AuthStateChanged>(_onAuthStateChanged);
    on<FetchUserProfile>(_onFetchUserProfile);
    on<UserRefreshed>(_onUserRefreshed);
    on<UpdateUserInfo>(_onUpdateUserInfo);
    on<SignOut>(_onSignOut);
    on<Error>(_onError);

    //Bloc 생성과 동시에 usecase 스트림 구독 시작
    _authStateSubscription = _watchAuthStateUseCase.call().listen(
      (userResult) {
        add(AuthProfileEvent.authStateChanged(userResult));
      },
      // 스트림 자체에서 에러 발생 시 처리
      onError: (e) {
        add(AuthProfileEvent.error(message: "인증 스트림 오류: $e"));
      },
    );
  }

  // UseCase 스트림에서 데이터(Result<UserEntity?>)를 받았을 때 처리
  Future<void> _onAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthProfileState> emit,
  ) async {
    debugPrint("유저 상태 변화 감지 user:${event.userResult}");
    await event.userResult.when(
      success: (user) {
        if (user != null) {
          //유효한 세션을 수신: 로딩 상태로 전환
          emit(const AuthProfileState.loading());
          //받아온 유저 정보로 다시 인증 상태 교체
          emit(
            AuthProfileState.authenticated(uuid: user.uuid!, userInfo: user),
          );
        } else {
          //비인증 상태로
          print("비인증상태");
          emit(const AuthProfileState.unauthenticated());
        }
      },
      failure: (failure) {
        // Repository 계층에서 에러 발생 시
        emit(AuthProfileState.error(message: failure.message));
      },
    );
  }

  @override
  void onTransition(Transition<AuthProfileEvent, AuthProfileState> transition) {
    // 이전 상태(currentState)와 다음 상태(nextState)를 모두 출력합니다.
    debugPrint('--- AuthProfileBloc Transition ---');
    debugPrint('Event: ${transition.event.runtimeType}');
    debugPrint('Prev State: ${transition.currentState.runtimeType}');
    debugPrint('Next State: ${transition.nextState.runtimeType}');
    debugPrint('----------------------------------');
    super.onTransition(transition);
  }

  // 유저 DB 정보 로딩 및 상태 업데이트
  Future<void> _onFetchUserProfile(
    FetchUserProfile event,
    Emitter<AuthProfileState> emit,
  ) async {
    final result = await _getCurrentUserUseCase(event.uuid);

    result.when(
      success: (userInfo) {
        emit(
          AuthProfileState.authenticated(uuid: event.uuid, userInfo: userInfo!),
        );
      },
      failure: (failure) {
        // DB 로딩 실패는 에러 상태로 처리
        /*emit(
          AuthProfileState.error(message: '유저 프로필 로딩 실패: ${failure.message}'),
        );*/
        //여기서 emit하지 않고 bloc에 이벤트를 넣어 해당하는 메소드가 처리하도록 변경
        add(
          AuthProfileEvent.error(message: '유저 프로필 로딩 실패: ${failure.message}'),
        );
      },
    );
  }

  // 유저 정보 업데이트 시 처리 (UserUpdated 이벤트 등에 해당)유저 프로필 업데이트 하는 곳에서 사용
  Future<void> _onUserRefreshed(
    UserRefreshed event,
    Emitter<AuthProfileState> emit,
  ) async {
    // 현재 상태가 인증된 상태라면 다시 로딩 이벤트 발생시켜 정보 갱신
    if (state is AuthProfileAuthenticated) {
      emit(const AuthProfileState.loading());
      add(AuthProfileEvent.fetchUserProfile(event.uuid));
    } else {}
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthProfileState> emit) async {
    final result = await _signOutUseCase();
    result.when(
      success: (success) {
        print("로그아웃 성공");
      },
      failure: (failure) {
        add(AuthProfileEvent.error(message: failure.message));
      },
    );
  }

  Future<void> _onError(Error event, Emitter<AuthProfileState> emit) async {
    ///TODO:에러 상태시 처리
    print(event.message);
  }

  Future<void> _onUpdateUserInfo(
    UpdateUserInfo event,
    Emitter<AuthProfileState> emit,
  ) async {
    // 현재 상태가 인증된 상태일 때만 업데이트
    if (state is AuthProfileAuthenticated) {
      final currentState = state as AuthProfileAuthenticated;
      emit(
        AuthProfileState.authenticated(
          uuid: currentState.uuid,
          userInfo: event.userInfo, // 새로운 유저 정보로 교체
        ),
      );
    }
  }

  // BLoC이 닫힐 때 스트림 구독 취소
  //해당 코드는 authProfileBloc이 전역이 되기 때문에 필요없긴함
  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }
}
