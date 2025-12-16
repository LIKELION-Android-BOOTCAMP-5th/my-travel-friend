import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/friend/domain/entities/friend_request_entity.dart';

part 'friend_request_state.freezed.dart';

//[엄수빈] 친구 요청 상태
enum FriendRequestPageState { init, loading, loaded, success, error }

@freezed
abstract class FriendRequestState with _$FriendRequestState {
  const factory FriendRequestState({
    int? id,

    @Default(0) int requestId,
    @Default(0) int targetId,

    /// 친구 요청 목록 데이터
    @Default([]) List<FriendRequestEntity> friendRequest,

    /// 성공/에러 메시지
    String? message,
    String? errorType,
    String? actionType,

    //검색어
    @Default('') String keyword,

    //닉네임 검색 결과 유저
    @Default([]) List<UserEntity> searchResults,

    /// 받은 친구 요청 보낸 사람들 프로필 (getRequestProfile용)
    @Default([]) List<UserEntity> requestProfiles,

    /// 검색 결과 중 '요청됨'으로 처리할 유저 id 목록
    /// (즉, 이미 친구요청 리스트에 있는 아이디듣)
    @Default([]) List<int> requestedUserIds,
    @Default(false) bool isRequest,

    /// 현재 페이지 상태
    @Default(FriendRequestPageState.init) FriendRequestPageState pageState,
  }) = _FriendRequestState;
}
