import 'package:freezed_annotation/freezed_annotation.dart';

import 'friend_page_state.dart';

part 'friend_state.freezed.dart';

//[엄수빈] 친구 상태
@freezed
abstract class FriendState with _$FriendState {
  const factory FriendState({
    @Default(0) int userId,
    @Default(FriendPageState.initial()) FriendPageState pageState,
  }) = _FriendState;
}
