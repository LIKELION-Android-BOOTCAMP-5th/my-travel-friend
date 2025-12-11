import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

import '../../domain/entities/friend_entity.dart';

part 'friend_state.freezed.dart';

//[엄수빈] 친구 상태
enum FriendPageState { init, loading, loaded, success, error }

@freezed
abstract class FriendState with _$FriendState {
  const factory FriendState({
    /// 내 userId
    @Default(0) int userId,

    /// 친구 목록 데이터
    @Default([]) List<FriendEntity> friends,

    /// 성공/에러 메시지
    String? message,
    String? errorType,
    String? actionType,

    /// 현재 페이지 상태
    @Default(FriendPageState.init) FriendPageState pageState,
  }) = _FriendState;
}
