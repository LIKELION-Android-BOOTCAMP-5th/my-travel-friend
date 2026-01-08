import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/accept_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/create_friend_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/delete_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/get_friend_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/get_request_profile_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/get_sent_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/search_request_name_usecase.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_event.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';

// [엄수빈] 친구 요청 블록
@LazySingleton()
class FriendRequestBloc extends Bloc<FriendRequestEvent, FriendRequestState> {
  final CreateFriendRequestUsecase _createFriendRequestUsecase;
  final GetFriendRequestUsecase _getFriendRequestUsecase;
  final DeleteRequestUsecase _deleteRequestUsecase;
  final AcceptRequestUsecase _acceptRequestUsecase;
  final GetRequestProfileUsecase _getRequestProfileUsecase;
  final SearchRequestNameUsecase _searchRequestNameUsecase;
  final GetSentRequestUsecase _getSentRequestUsecase;

  FriendRequestBloc(
    this._createFriendRequestUsecase,
    this._getFriendRequestUsecase,
    this._deleteRequestUsecase,
    this._acceptRequestUsecase,
    this._getRequestProfileUsecase,
    this._searchRequestNameUsecase,
    this._getSentRequestUsecase,
  ) : super(const FriendRequestState()) {
    on<CreateFriendRequest>(_onCreateFriendRequest);
    on<GetFriendRequest>(_onGetFriendRequest);
    on<DeleteRequest>(_onDeleteRequest);
    on<AcceptRequest>(_onAcceptRequest);
    on<GetRequestProfile>(_onGetRequestProfile);
    on<SearchRequestName>(_onSearchRequestName);
    on<RequestCreate>(_onRequestCreate);
  }

  // Failure -> 에러 타입 문자열로 매핑
  String _getErrorType(Failure failure) {
    return failure.map(
      serverFailure: (_) => 'server',
      networkFailure: (_) => 'network',
      authFailure: (_) => 'auth',
      undefined: (_) => 'unknown',
    );
  }

  /// 친구 요청 보내기
  Future<void> _onCreateFriendRequest(
    CreateFriendRequest event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'create',
        message: null,
        errorType: null,
      ),
    );

    final result = await _createFriendRequestUsecase(
      event.requestId,
      event.targetId,
    );

    result.when(
      success: (request) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.success,
            actionType: 'create',
            friendRequest: [...state.friendRequest, request],
            requestedUserIds: {
              ...state.requestedUserIds,
              event.targetId,
            }.toList(),
            message: '친구 요청을 보냈어요.',
            errorType: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'create',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 클릭과 생성 한번에 실행
  Future<void> _onRequestCreate(
    RequestCreate event,
    Emitter<FriendRequestState> emit,
  ) async {
    // 롤백용 이전 상태
    final prevState = state;

    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'request_create',
        isRequest: true,
        requestedUserIds: {...state.requestedUserIds, event.targetId}.toList(),
        message: null,
        errorType: null,
      ),
    );

    // 친구 요청 생성
    final result = await _createFriendRequestUsecase(
      event.requestId,
      event.targetId,
    );

    debugPrint('[Result] requestCreate success: $result');
    result.when(
      success: (request) {
        // 성공 → 최종 확정
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.success,
            friendRequest: [...state.friendRequest, request],
            actionType: 'request_create',
            message: '친구 요청을 보냈어요.',
            errorType: null,
          ),
        );
      },
      failure: (failure) {
        // 실패 → 전부 롤백
        emit(
          prevState.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'request_create',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  /// 받은 친구 요청 목록 불러오기
  Future<void> _onGetFriendRequest(
    GetFriendRequest event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'get_received',
        message: null,
        errorType: null,
      ),
    );

    final result = await _getFriendRequestUsecase(event.userId);

    result.when(
      success: (list) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.loaded,
            actionType: 'get_received',
            friendRequest: list,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'get_received',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  /// 친구 요청 거절
  Future<void> _onDeleteRequest(
    DeleteRequest event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'delete',
        message: null,
        errorType: null,
      ),
    );

    final targetReq = state.friendRequest.where((e) => e.id == event.id).isEmpty
        ? null
        : state.friendRequest.firstWhere((e) => e.id == event.id);

    final requesterUserId = targetReq?.requestId; // 보낸 사람 userId

    final result = await _deleteRequestUsecase.call(event.id);

    result.when(
      success: (_) {
        // 요청 목록에서 제거
        final updatedRequests = state.friendRequest
            .where((e) => e.id != event.id)
            .toList();

        //프로필 목록에서도 제거 (보낸 사람 userId 기준)
        final updatedProfiles = (requesterUserId == null)
            ? state.requestProfiles
            : state.requestProfiles
                  .where((u) => (u.id ?? -1) != requesterUserId)
                  .toList();

        emit(
          state.copyWith(
            pageState: FriendRequestPageState.success,
            actionType: 'delete',
            friendRequest: updatedRequests,
            requestProfiles: updatedProfiles,
            message: '친구 요청을 거절했어요.',
            errorType: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'delete',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  /// 친구 요청 수락
  Future<void> _onAcceptRequest(
    AcceptRequest event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'accept',
        message: null,
        errorType: null,
      ),
    );

    final targetReq = state.friendRequest.where((e) => e.id == event.id).isEmpty
        ? null
        : state.friendRequest.firstWhere((e) => e.id == event.id);

    final requesterUserId = targetReq?.requestId; // 보낸 사람 userId

    final result = await _acceptRequestUsecase(event.id);

    result.when(
      success: (_) async {
        // 요청 목록에서 제거
        final updatedRequests = state.friendRequest
            .where((e) => e.id != event.id)
            .toList();

        // 프로필 목록에서도 제거
        final updatedProfiles = (requesterUserId == null)
            ? state.requestProfiles
            : state.requestProfiles
                  .where((u) => (u.id ?? -1) != requesterUserId)
                  .toList();

        emit(
          state.copyWith(
            pageState: FriendRequestPageState.success,
            actionType: 'accept',
            friendRequest: updatedRequests,
            requestProfiles: updatedProfiles,
            message: '친구 요청을 수락했어요.',
            errorType: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'accept',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  //친구 검색
  Future<void> _onSearchRequestName(
    SearchRequestName event,
    Emitter<FriendRequestState> emit,
  ) async {
    final keyword = event.keyword.trim();

    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          keyword: '',
          searchResults: const [],
          requestedUserIds: const [],
          pageState: FriendRequestPageState.loaded,
          actionType: 'search',
          message: null,
          errorType: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'search',
        keyword: keyword,
        message: null,
        errorType: null,
      ),
    );

    final searchResult = await _searchRequestNameUsecase(event.myId, keyword);

    if (emit.isDone) return; // 자꾸 터져서 중간에 핸들러 리셋

    final users = searchResult.when(
      success: (u) => u,
      failure: (f) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'search',
            message: f.message,
            errorType: _getErrorType(f),
          ),
        );
        return null;
      },
    );

    if (users == null) return;

    if (users.isEmpty) {
      emit(
        state.copyWith(
          pageState: FriendRequestPageState.loaded,
          actionType: 'search',
          searchResults: const [],
          requestedUserIds: const [],
        ),
      );
      return;
    }

    final receivedResult = await _getFriendRequestUsecase(event.myId);
    if (emit.isDone) return;

    final sentResult = await _getSentRequestUsecase(event.myId);
    if (emit.isDone) return;

    final received = receivedResult.when(
      success: (r) => r,
      failure: (f) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.loaded,
            actionType: 'search',
            searchResults: users,
            requestedUserIds: const [],
            message: f.message,
            errorType: _getErrorType(f),
          ),
        );
        return null;
      },
    );
    if (received == null) return;

    final sent = sentResult.when(
      success: (s) => s,
      failure: (f) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.loaded,
            actionType: 'search',
            searchResults: users,
            requestedUserIds: const [],
            message: f.message,
            errorType: _getErrorType(f),
          ),
        );
        return null;
      },
    );
    if (sent == null) return;

    // 요청됨 유저 ID 계산
    final requestedIds = <int>{
      ...received.map((e) => e.requestId),
      ...sent.map((e) => e.targetId),
    }.whereType<int>().toSet().toList();

    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loaded,
        actionType: 'search',
        searchResults: users,
        requestedUserIds: requestedIds,
        message: null,
        errorType: null,
      ),
    );
  }

  //받은 친구 요청 프로필
  Future<void> _onGetRequestProfile(
    GetRequestProfile event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        actionType: 'get_profile',
        message: null,
        errorType: null,
      ),
    );

    final result = await _getRequestProfileUsecase(event.myId);

    result.when(
      success: (users) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.loaded,
            actionType: 'get_profile',
            requestProfiles: users,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'get_profile',
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }
}
