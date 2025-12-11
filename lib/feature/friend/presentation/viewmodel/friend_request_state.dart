import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/friend/domain/entities/friend_request_entity.dart';

part 'friend_request_state.freezed.dart';

//[엄수빈] 친구 요청 상태
enum FriendRequestPageState {
  init,
  loading,
  loaded,
  success,
  error,
  accept,
  delete,
}

@freezed
abstract class FriendRequestState with _$FriendRequestState {
  const factory FriendRequestState({
    /// Id
    int? id,

    @Default(0) int requestId,
    @Default(0) int targetId,

    /// 친구 요청 목록 데이터
    @Default([]) List<FriendRequestEntity> friendRequest,

    /// 성공/에러 메시지
    String? message,
    String? errorType,
    String? actionType,

    /// 현재 페이지 상태
    @Default(FriendRequestPageState.init) FriendRequestPageState pageState,
  }) = _FriendRequestState;
}
