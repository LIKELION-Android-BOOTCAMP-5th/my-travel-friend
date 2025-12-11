import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/friend/domain/entities/friend_request_entity.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/accept_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/create_friend_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/delete_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/get_friend_request_usecase.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_event.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';

// [엄수빈] 친구 요청 블록
@injectable
class FriendRequestBloc extends Bloc<FriendRequestEvent, FriendRequestState> {
  final CreateFriendRequestUsecase _createFriendRequest;
  final GetFriendRequestUsecase _getFriendRequestUsecase;
  final DeleteRequestUsecase _deleteRequestUsecase;
  final AcceptRequestUsecase _acceptRequestUsecase;

  FriendRequestBloc(
    this._createFriendRequest,
    this._getFriendRequestUsecase,
    this._deleteRequestUsecase,
    this._acceptRequestUsecase,
  ) : super(const FriendRequestState()) {
    on<CreateFriendRequest>(_onCreateFriendRequest);
    on<GetFriendRequest>(_onGetFriendRequest);
    on<DeleteRequest>(_onDeleteRequest);
    on<AcceptRequest>(_onAcceptRequest);
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
        message: null,
        errorType: null,
        actionType: 'create',
      ),
    );

    final Result<FriendRequestEntity> result = await _createFriendRequest(
      event.requestId,
      event.targetId,
    );

    result.when(
      success: (request) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.success,
            actionType: 'create',
            // 목록에 새 요청 추가
            friendRequest: [...state.friendRequest, request],
            id: request.id,
            requestId: request.requestId,
            targetId: request.targetId,
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

  /// 받은 친구 요청 목록 불러오기
  Future<void> _onGetFriendRequest(
    GetFriendRequest event,
    Emitter<FriendRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendRequestPageState.loading,
        message: null,
        errorType: null,
        actionType: 'get',
      ),
    );

    final Result<List<FriendRequestEntity>> result =
        await _getFriendRequestUsecase(event.userId);

    result.when(
      success: (list) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.loaded,
            actionType: 'get',
            friendRequest: list,
            message: null,
            errorType: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendRequestPageState.error,
            actionType: 'get',
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
        message: null,
        errorType: null,
        actionType: 'delete',
      ),
    );

    final Result result = await _deleteRequestUsecase(event.id);

    result.when(
      success: (_) {
        // 현재 state에서 해당 요청 제거
        final updatedList = state.friendRequest
            .where((e) => e.id != event.id)
            .toList();

        emit(
          state.copyWith(
            pageState: FriendRequestPageState.delete,
            actionType: 'delete',
            friendRequest: updatedList,
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
        message: null,
        errorType: null,
        actionType: 'accept',
      ),
    );

    final Result result = await _acceptRequestUsecase(event.id);

    result.when(
      success: (_) {
        // 수락한 요청은 목록에서 제거
        final updatedList = state.friendRequest
            .where((e) => e.id != event.id)
            .toList();

        emit(
          state.copyWith(
            pageState: FriendRequestPageState.accept,
            actionType: 'accept',
            friendRequest: updatedList,
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
}
