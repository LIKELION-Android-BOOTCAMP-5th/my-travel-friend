import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/create_friend_relation_usecase.dart';
import 'package:my_travel_friend/feature/friend/domain/usecases/get_friend_users_usecase.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/usecases/delete_friend_usecases.dart';
import '../../domain/usecases/get_friends_usecase.dart';
import '../../domain/usecases/search_nickname_usecase.dart';
import 'friend_event.dart';
import 'friend_state.dart';

// [엄수빈] 친구 블록
@injectable
class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final GetFriendsUsecase _getFriendUsecase;
  final DeleteFriendUsecase _deleteFriendUsecase;
  final GetFriendUsersUsecase _getFriendUsersUsecase;
  final SearchNicknameUsecase _searchNicknameUsecase;
  final CreateFriendRelationUsecase _createFriendRelationUsecase;

  FriendBloc(
    this._getFriendUsecase,
    this._deleteFriendUsecase,
    this._getFriendUsersUsecase,
    this._searchNicknameUsecase,
    this._createFriendRelationUsecase,
  ) : super(const FriendState()) {
    on<GetFriends>(_onGetFriends);
    on<DeleteFriend>(_onDeleteFriend);
    on<GetFriendUsers>(_onGetFriendUsers);
    on<KeywordChanged>(_onKeywordChanged);
    on<SearchToggle>(_onSearchToggle);
    on<CreateFriendRelation>(_onCreateFriendRelation);
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
      state.copyWith(userId: event.userId, pageState: FriendPageState.loading),
    );

    final res = await _getFriendUsecase.call(event.userId);

    res.when(
      success: (friends) {
        emit(
          state.copyWith(friends: friends, pageState: FriendPageState.loaded),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error,
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 친구 목록 프로필로 가져오기
  Future<void> _onGetFriendUsers(
    GetFriendUsers event,
    Emitter<FriendState> emit,
  ) async {
    emit(
      state.copyWith(userId: event.myId, pageState: FriendPageState.loading),
    );

    final res = await _getFriendUsersUsecase.call(event.myId);

    res.when(
      success: (users) {
        final sortedUsers = [...users]
          ..sort((a, b) => (a.nickname ?? '').compareTo(b.nickname ?? ''));

        emit(
          state.copyWith(
            friendUsers: users,
            results: sortedUsers,
            pageState: FriendPageState.loaded,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error,
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 친구 관계 생성
  Future<void> _onCreateFriendRelation(
    CreateFriendRelation event,
    Emitter<FriendState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: FriendPageState.loading,
        actionType: 'create_friend_relation',
      ),
    );

    final result = await _createFriendRelationUsecase(
      event.userId1,
      event.userId2,
    );

    result.when(
      success: (friendEntity) {
        final nextList = [...state.friends];

        emit(
          state.copyWith(
            pageState: FriendPageState.success,
            actionType: 'create_friend_relation',
            friends: nextList,
            message: '친구가 추가되었어요!',
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error,
            actionType: 'create_friend_relation',
            message: '친구 추가에 실패했어요',
            errorType: _getErrorType(failure),
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
    emit(state.copyWith(pageState: FriendPageState.loading));

    final friendUserId = event.friendUserId;
    if (friendUserId == null) {
      emit(
        state.copyWith(
          pageState: FriendPageState.error,
          message: '삭제할 친구 정보가 없습니다',
          errorType: 'invalid',
        ),
      );
      return;
    }

    final Result<void> res = await _deleteFriendUsecase.call(
      event.myUserId,
      friendUserId,
    );

    res.when(
      success: (_) {
        emit(
          state.copyWith(
            userId: event.myUserId,
            pageState: FriendPageState.success,
            message: '친구가 삭제되었습니다',
            actionType: 'delete_friend',
          ),
        );

        // 삭제 후 다시 목록 불러오기
        add(FriendEvent.getFriendUsers(myId: event.myUserId));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error,
            message: failure.message,
            errorType: _getErrorType(failure),
          ),
        );
      },
    );
  }

  // 검색 입력 감지
  Future<void> _onKeywordChanged(
    KeywordChanged event,
    Emitter<FriendState> emit,
  ) async {
    final keyword = event.keyword.trim();

    // 검색어 상태 반영
    emit(state.copyWith(keyword: keyword));

    // 검색어 없으면 결과 비우고 끝
    if (keyword.isEmpty) {
      emit(state.copyWith(keyword: '', results: const [], message: null));
      return;
    }

    final myId = state.userId;
    if (myId == 0) {
      // myUserId 아직 안 셋팅 됐으면 검색 안 함
      return;
    }

    final Result<List<UserEntity>> result = await _searchNicknameUsecase(
      myId,
      keyword,
    );

    result.when(
      success: (users) {
        emit(
          state.copyWith(
            results: users,
            pageState: FriendPageState.loaded,
            message: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  // 검색 버튼 토글
  void _onSearchToggle(SearchToggle event, Emitter<FriendState> emit) {
    final next = !state.searchToggle;

    emit(
      state.copyWith(
        searchToggle: next,
        keyword: next ? state.keyword : '',
        results: next ? state.results : const [],
        message: null,
        pageState: FriendPageState.loaded,
      ),
    );
  }
}
