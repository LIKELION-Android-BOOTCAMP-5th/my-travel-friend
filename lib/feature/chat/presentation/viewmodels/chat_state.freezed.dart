// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {

// 채팅방 정보
 int get tripId; int get userId;// 여행 크루 목록
 List<UserEntity> get crews;// 채팅창 (오래된 순 정렬)
 List<ChatEntity> get chats;// 읽음 상태
 int? get lastReadChatId;// 마지막으로 읽은 채팅 id
 int get unreadCount;// 안 읽은 채팅 개수
 int? get scrollToChatId;// 스크롤할 채팅 ID (입장 시)
 bool get hasScrolledToLastRead;// 페이지네이션
 int get currentPage; bool get hasMore; bool get isLoadingMore;// 메세지 전송 상태
 bool get isSending;// 에러
 String? get errorMessage;// 페이지 상태
 ChatPageState get pageState;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.crews, crews)&&const DeepCollectionEquality().equals(other.chats, chats)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.scrollToChatId, scrollToChatId) || other.scrollToChatId == scrollToChatId)&&(identical(other.hasScrolledToLastRead, hasScrolledToLastRead) || other.hasScrolledToLastRead == hasScrolledToLastRead)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,const DeepCollectionEquality().hash(crews),const DeepCollectionEquality().hash(chats),lastReadChatId,unreadCount,scrollToChatId,hasScrolledToLastRead,currentPage,hasMore,isLoadingMore,isSending,errorMessage,pageState);

@override
String toString() {
  return 'ChatState(tripId: $tripId, userId: $userId, crews: $crews, chats: $chats, lastReadChatId: $lastReadChatId, unreadCount: $unreadCount, scrollToChatId: $scrollToChatId, hasScrolledToLastRead: $hasScrolledToLastRead, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isSending: $isSending, errorMessage: $errorMessage, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId, List<UserEntity> crews, List<ChatEntity> chats, int? lastReadChatId, int unreadCount, int? scrollToChatId, bool hasScrolledToLastRead, int currentPage, bool hasMore, bool isLoadingMore, bool isSending, String? errorMessage, ChatPageState pageState
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = null,Object? crews = null,Object? chats = null,Object? lastReadChatId = freezed,Object? unreadCount = null,Object? scrollToChatId = freezed,Object? hasScrolledToLastRead = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isSending = null,Object? errorMessage = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,crews: null == crews ? _self.crews : crews // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,chats: null == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatEntity>,lastReadChatId: freezed == lastReadChatId ? _self.lastReadChatId : lastReadChatId // ignore: cast_nullable_to_non_nullable
as int?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,scrollToChatId: freezed == scrollToChatId ? _self.scrollToChatId : scrollToChatId // ignore: cast_nullable_to_non_nullable
as int?,hasScrolledToLastRead: null == hasScrolledToLastRead ? _self.hasScrolledToLastRead : hasScrolledToLastRead // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ChatPageState,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int userId,  List<UserEntity> crews,  List<ChatEntity> chats,  int? lastReadChatId,  int unreadCount,  int? scrollToChatId,  bool hasScrolledToLastRead,  int currentPage,  bool hasMore,  bool isLoadingMore,  bool isSending,  String? errorMessage,  ChatPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.tripId,_that.userId,_that.crews,_that.chats,_that.lastReadChatId,_that.unreadCount,_that.scrollToChatId,_that.hasScrolledToLastRead,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.isSending,_that.errorMessage,_that.pageState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int userId,  List<UserEntity> crews,  List<ChatEntity> chats,  int? lastReadChatId,  int unreadCount,  int? scrollToChatId,  bool hasScrolledToLastRead,  int currentPage,  bool hasMore,  bool isLoadingMore,  bool isSending,  String? errorMessage,  ChatPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.tripId,_that.userId,_that.crews,_that.chats,_that.lastReadChatId,_that.unreadCount,_that.scrollToChatId,_that.hasScrolledToLastRead,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.isSending,_that.errorMessage,_that.pageState);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int userId,  List<UserEntity> crews,  List<ChatEntity> chats,  int? lastReadChatId,  int unreadCount,  int? scrollToChatId,  bool hasScrolledToLastRead,  int currentPage,  bool hasMore,  bool isLoadingMore,  bool isSending,  String? errorMessage,  ChatPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.tripId,_that.userId,_that.crews,_that.chats,_that.lastReadChatId,_that.unreadCount,_that.scrollToChatId,_that.hasScrolledToLastRead,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.isSending,_that.errorMessage,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState extends ChatState {
  const _ChatState({this.tripId = 0, this.userId = 0, final  List<UserEntity> crews = const [], final  List<ChatEntity> chats = const [], this.lastReadChatId, this.unreadCount = 0, this.scrollToChatId, this.hasScrolledToLastRead = false, this.currentPage = 0, this.hasMore = false, this.isLoadingMore = false, this.isSending = false, this.errorMessage, this.pageState = ChatPageState.initial}): _crews = crews,_chats = chats,super._();
  

// 채팅방 정보
@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
// 여행 크루 목록
 final  List<UserEntity> _crews;
// 여행 크루 목록
@override@JsonKey() List<UserEntity> get crews {
  if (_crews is EqualUnmodifiableListView) return _crews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crews);
}

// 채팅창 (오래된 순 정렬)
 final  List<ChatEntity> _chats;
// 채팅창 (오래된 순 정렬)
@override@JsonKey() List<ChatEntity> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}

// 읽음 상태
@override final  int? lastReadChatId;
// 마지막으로 읽은 채팅 id
@override@JsonKey() final  int unreadCount;
// 안 읽은 채팅 개수
@override final  int? scrollToChatId;
// 스크롤할 채팅 ID (입장 시)
@override@JsonKey() final  bool hasScrolledToLastRead;
// 페이지네이션
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
// 메세지 전송 상태
@override@JsonKey() final  bool isSending;
// 에러
@override final  String? errorMessage;
// 페이지 상태
@override@JsonKey() final  ChatPageState pageState;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._crews, _crews)&&const DeepCollectionEquality().equals(other._chats, _chats)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.scrollToChatId, scrollToChatId) || other.scrollToChatId == scrollToChatId)&&(identical(other.hasScrolledToLastRead, hasScrolledToLastRead) || other.hasScrolledToLastRead == hasScrolledToLastRead)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,const DeepCollectionEquality().hash(_crews),const DeepCollectionEquality().hash(_chats),lastReadChatId,unreadCount,scrollToChatId,hasScrolledToLastRead,currentPage,hasMore,isLoadingMore,isSending,errorMessage,pageState);

@override
String toString() {
  return 'ChatState(tripId: $tripId, userId: $userId, crews: $crews, chats: $chats, lastReadChatId: $lastReadChatId, unreadCount: $unreadCount, scrollToChatId: $scrollToChatId, hasScrolledToLastRead: $hasScrolledToLastRead, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isSending: $isSending, errorMessage: $errorMessage, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int userId, List<UserEntity> crews, List<ChatEntity> chats, int? lastReadChatId, int unreadCount, int? scrollToChatId, bool hasScrolledToLastRead, int currentPage, bool hasMore, bool isLoadingMore, bool isSending, String? errorMessage, ChatPageState pageState
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,Object? crews = null,Object? chats = null,Object? lastReadChatId = freezed,Object? unreadCount = null,Object? scrollToChatId = freezed,Object? hasScrolledToLastRead = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isSending = null,Object? errorMessage = freezed,Object? pageState = null,}) {
  return _then(_ChatState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,crews: null == crews ? _self._crews : crews // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatEntity>,lastReadChatId: freezed == lastReadChatId ? _self.lastReadChatId : lastReadChatId // ignore: cast_nullable_to_non_nullable
as int?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,scrollToChatId: freezed == scrollToChatId ? _self.scrollToChatId : scrollToChatId // ignore: cast_nullable_to_non_nullable
as int?,hasScrolledToLastRead: null == hasScrolledToLastRead ? _self.hasScrolledToLastRead : hasScrolledToLastRead // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ChatPageState,
  ));
}


}

// dart format on
