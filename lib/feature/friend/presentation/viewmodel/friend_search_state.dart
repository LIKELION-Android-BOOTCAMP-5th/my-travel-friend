import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

part 'friend_search_state.freezed.dart';

enum FriendSearchPageState { init, loading, loaded, error }

@freezed
abstract class FriendSearchState with _$FriendSearchState {
  const factory FriendSearchState({
    /// 내 userId
    @Default(0) int myUserId,

    /// 현재 검색어
    @Default('') String keyword,

    /// 검색 결과 (내 친구 중 닉네임으로 필터된 유저들)
    @Default([]) List<UserEntity> results,

    /// 메시지 (에러 등)
    String? message,

    /// 페이지 상태
    @Default(FriendSearchPageState.init) FriendSearchPageState pageState,
  }) = _FriendSearchState;
}
