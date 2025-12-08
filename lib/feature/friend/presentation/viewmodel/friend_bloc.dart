import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/friend_entity.dart';
import '../../domain/usecases/delete_friend_usecase.dart';
import '../../domain/usecases/get_friends_usecase.dart';
import 'friend_event.dart';
import 'friend_page_state.dart';
import 'friend_state.dart';

// [엄수빈] 친구 블록
@injectable
class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final GetFriendsUsecase _getFriendUsecase;
  final DeleteFriendUsecase _deleteFriendUsecase;

  FriendBloc(this._getFriendUsecase, this._deleteFriendUsecase)
    : super(const FriendState()) {
    on<GetFriends>(_onGetFriends);
    on<DeleteFriend>(_onDeleteFriend);
    on<GoTravel>(_onGoTravel);
  }

  String _getErrorType(dynamic failure) {
    return failure.map(
      serverFailure: (_) => 'server',
      networkFailure: (_) => 'network',
      authFailure: (_) => 'auth',
      undefined: (_) => 'unknown',
    );
  }

  // 친구 목록 가져오기
  Future<void> _onGetFriends(
    GetFriends event,
    Emitter<FriendState> emit,
  ) async {
    emit(
      state.copyWith(
        userId: event.userId,
        pageState: const FriendPageState.loading(),
      ),
    );

    final Result<List<FriendEntity>> res = await _getFriendUsecase.call(
      event.userId,
    );

    res.when(
      success: (friends) {
        emit(
          state.copyWith(pageState: FriendPageState.loaded(friends: friends)),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error(
              message: failure.message,
              errorType: _getErrorType(failure),
            ),
          ),
        );
      },
    );
  }

  // 친구 삭제
  Future<void> _onDeleteFriend(
    DeleteFriend event,
    Emitter<FriendState> emit,
  ) async {
    emit(state.copyWith(pageState: const FriendPageState.loading()));

    final Result<void> res = await _deleteFriendUsecase.call(
      event.myUserId,
      event.friendUserId,
    );

    res.when(
      success: (_) {
        emit(
          state.copyWith(
            userId: event.myUserId,
            pageState: const FriendPageState.success(
              message: '친구를 삭제했습니다',
              actionType: 'delete',
            ),
          ),
        );

        // 삭제 후 다시 목록 불러오기
        add(FriendEvent.getFriends(userId: event.myUserId));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error(
              message: '친구 삭제 실패: ${failure.message}',
              errorType: _getErrorType(failure),
            ),
          ),
        );
      },
    );
  }

  // 같이 여행가기 GoTravel
  Future<void> _onGoTravel(GoTravel event, Emitter<FriendState> emit) async {
    emit(
      state.copyWith(
        userId: event.myUserId,
        pageState: const FriendPageState.success(
          message: '친구와 여행을 떠나볼까요?',
          actionType: 'goTravel',
        ),
      ),
    );
  }
}
