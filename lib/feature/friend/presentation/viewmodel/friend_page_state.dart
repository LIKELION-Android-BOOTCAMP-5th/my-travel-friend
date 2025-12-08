import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/friend_entity.dart';

part 'friend_page_state.freezed.dart';

//[엄수빈] 친구 페이지 상태
@freezed
class FriendPageState with _$FriendPageState {
  const factory FriendPageState.initial() = FriendPageInitial;

  const factory FriendPageState.loading() = FriendPageLoading;

  const factory FriendPageState.loaded({required List<FriendEntity> friends}) =
      FriendPageLoaded;

  const factory FriendPageState.error({
    required String message,
    String? errorType,
  }) = FriendPageError;

  const factory FriendPageState.success({String? message, String? actionType}) =
      FriendPageSuccess;
}
