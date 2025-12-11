// lib/feature/friend/presentation/viewmodel/friend_search_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/usecases/search_nickname_usecase.dart';
import 'friend_search_event.dart';
import 'friend_search_state.dart';

@injectable
class FriendSearchBloc extends Bloc<FriendSearchEvent, FriendSearchState> {
  final SearchNicknameUsecase _searchNicknameUsecase;

  FriendSearchBloc(this._searchNicknameUsecase)
    : super(const FriendSearchState()) {
    on<Initialized>(_onInitialized);
    on<KeywordChanged>(_onKeywordChanged);
  }

  void _onInitialized(Initialized event, Emitter<FriendSearchState> emit) {
    // 화면 들어올 때 내 userId 세팅
    emit(state.copyWith(myUserId: event.myUserId));
  }

  Future<void> _onKeywordChanged(
    KeywordChanged event,
    Emitter<FriendSearchState> emit,
  ) async {
    final keyword = event.keyword.trim();

    // 검색어 상태 반영
    emit(state.copyWith(keyword: keyword));

    // 검색어 없으면 결과 비우고 끝
    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          results: [],
          pageState: FriendSearchPageState.loaded,
          message: null,
        ),
      );
      return;
    }

    final myId = state.myUserId;
    if (myId == 0) {
      // myUserId 아직 안 셋팅 됐으면 검색 안 함
      return;
    }

    emit(state.copyWith(pageState: FriendSearchPageState.loading));

    final Result<List<UserEntity>> result = await _searchNicknameUsecase(
      myId,
      keyword,
    );

    result.when(
      success: (users) {
        emit(
          state.copyWith(
            results: users,
            pageState: FriendSearchPageState.loaded,
            message: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: FriendSearchPageState.error,
            message: failure.message,
          ),
        );
      },
    );
  }
}
