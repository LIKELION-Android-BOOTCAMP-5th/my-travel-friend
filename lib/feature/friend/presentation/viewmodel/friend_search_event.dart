import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_search_event.freezed.dart';

@freezed
class FriendSearchEvent with _$FriendSearchEvent {
  /// 화면 진입 시 내 userId 세팅
  const factory FriendSearchEvent.initialized({required int myUserId}) =
      Initialized;

  /// 검색어 변경될 때마다 호출
  const factory FriendSearchEvent.keywordChanged(String keyword) =
      KeywordChanged;
}
