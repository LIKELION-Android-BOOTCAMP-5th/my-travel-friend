// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendRequestState {

 int? get id; int get requestId; int get targetId;/// 친구 요청 목록 데이터
 List<FriendRequestEntity> get friendRequest;/// 성공/에러 메시지
 String? get message; String? get errorType; String? get actionType;//검색어
 String get keyword;//닉네임 검색 결과 유저
 List<UserEntity> get searchResults;/// 받은 친구 요청 보낸 사람들 프로필 (getRequestProfile용)
 List<UserEntity> get requestProfiles;/// 검색 결과 중 '요청됨'으로 처리할 유저 id 목록
/// (즉, 이미 친구요청 리스트에 있는 아이디듣)
 List<int> get requestedUserIds; bool get isRequest;/// 현재 페이지 상태
 FriendRequestPageState get pageState;
/// Create a copy of FriendRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestStateCopyWith<FriendRequestState> get copyWith => _$FriendRequestStateCopyWithImpl<FriendRequestState>(this as FriendRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestState&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other.friendRequest, friendRequest)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&const DeepCollectionEquality().equals(other.requestProfiles, requestProfiles)&&const DeepCollectionEquality().equals(other.requestedUserIds, requestedUserIds)&&(identical(other.isRequest, isRequest) || other.isRequest == isRequest)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,const DeepCollectionEquality().hash(friendRequest),message,errorType,actionType,keyword,const DeepCollectionEquality().hash(searchResults),const DeepCollectionEquality().hash(requestProfiles),const DeepCollectionEquality().hash(requestedUserIds),isRequest,pageState);

@override
String toString() {
  return 'FriendRequestState(id: $id, requestId: $requestId, targetId: $targetId, friendRequest: $friendRequest, message: $message, errorType: $errorType, actionType: $actionType, keyword: $keyword, searchResults: $searchResults, requestProfiles: $requestProfiles, requestedUserIds: $requestedUserIds, isRequest: $isRequest, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $FriendRequestStateCopyWith<$Res>  {
  factory $FriendRequestStateCopyWith(FriendRequestState value, $Res Function(FriendRequestState) _then) = _$FriendRequestStateCopyWithImpl;
@useResult
$Res call({
 int? id, int requestId, int targetId, List<FriendRequestEntity> friendRequest, String? message, String? errorType, String? actionType, String keyword, List<UserEntity> searchResults, List<UserEntity> requestProfiles, List<int> requestedUserIds, bool isRequest, FriendRequestPageState pageState
});




}
/// @nodoc
class _$FriendRequestStateCopyWithImpl<$Res>
    implements $FriendRequestStateCopyWith<$Res> {
  _$FriendRequestStateCopyWithImpl(this._self, this._then);

  final FriendRequestState _self;
  final $Res Function(FriendRequestState) _then;

/// Create a copy of FriendRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? requestId = null,Object? targetId = null,Object? friendRequest = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? keyword = null,Object? searchResults = null,Object? requestProfiles = null,Object? requestedUserIds = null,Object? isRequest = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,friendRequest: null == friendRequest ? _self.friendRequest : friendRequest // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,requestProfiles: null == requestProfiles ? _self.requestProfiles : requestProfiles // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,requestedUserIds: null == requestedUserIds ? _self.requestedUserIds : requestedUserIds // ignore: cast_nullable_to_non_nullable
as List<int>,isRequest: null == isRequest ? _self.isRequest : isRequest // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendRequestPageState,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRequestState].
extension FriendRequestStatePatterns on FriendRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestState value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int requestId,  int targetId,  List<FriendRequestEntity> friendRequest,  String? message,  String? errorType,  String? actionType,  String keyword,  List<UserEntity> searchResults,  List<UserEntity> requestProfiles,  List<int> requestedUserIds,  bool isRequest,  FriendRequestPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestState() when $default != null:
return $default(_that.id,_that.requestId,_that.targetId,_that.friendRequest,_that.message,_that.errorType,_that.actionType,_that.keyword,_that.searchResults,_that.requestProfiles,_that.requestedUserIds,_that.isRequest,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int requestId,  int targetId,  List<FriendRequestEntity> friendRequest,  String? message,  String? errorType,  String? actionType,  String keyword,  List<UserEntity> searchResults,  List<UserEntity> requestProfiles,  List<int> requestedUserIds,  bool isRequest,  FriendRequestPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestState():
return $default(_that.id,_that.requestId,_that.targetId,_that.friendRequest,_that.message,_that.errorType,_that.actionType,_that.keyword,_that.searchResults,_that.requestProfiles,_that.requestedUserIds,_that.isRequest,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int requestId,  int targetId,  List<FriendRequestEntity> friendRequest,  String? message,  String? errorType,  String? actionType,  String keyword,  List<UserEntity> searchResults,  List<UserEntity> requestProfiles,  List<int> requestedUserIds,  bool isRequest,  FriendRequestPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestState() when $default != null:
return $default(_that.id,_that.requestId,_that.targetId,_that.friendRequest,_that.message,_that.errorType,_that.actionType,_that.keyword,_that.searchResults,_that.requestProfiles,_that.requestedUserIds,_that.isRequest,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _FriendRequestState implements FriendRequestState {
  const _FriendRequestState({this.id, this.requestId = 0, this.targetId = 0, final  List<FriendRequestEntity> friendRequest = const [], this.message, this.errorType, this.actionType, this.keyword = '', final  List<UserEntity> searchResults = const [], final  List<UserEntity> requestProfiles = const [], final  List<int> requestedUserIds = const [], this.isRequest = false, this.pageState = FriendRequestPageState.init}): _friendRequest = friendRequest,_searchResults = searchResults,_requestProfiles = requestProfiles,_requestedUserIds = requestedUserIds;
  

@override final  int? id;
@override@JsonKey() final  int requestId;
@override@JsonKey() final  int targetId;
/// 친구 요청 목록 데이터
 final  List<FriendRequestEntity> _friendRequest;
/// 친구 요청 목록 데이터
@override@JsonKey() List<FriendRequestEntity> get friendRequest {
  if (_friendRequest is EqualUnmodifiableListView) return _friendRequest;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friendRequest);
}

/// 성공/에러 메시지
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
//검색어
@override@JsonKey() final  String keyword;
//닉네임 검색 결과 유저
 final  List<UserEntity> _searchResults;
//닉네임 검색 결과 유저
@override@JsonKey() List<UserEntity> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

/// 받은 친구 요청 보낸 사람들 프로필 (getRequestProfile용)
 final  List<UserEntity> _requestProfiles;
/// 받은 친구 요청 보낸 사람들 프로필 (getRequestProfile용)
@override@JsonKey() List<UserEntity> get requestProfiles {
  if (_requestProfiles is EqualUnmodifiableListView) return _requestProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestProfiles);
}

/// 검색 결과 중 '요청됨'으로 처리할 유저 id 목록
/// (즉, 이미 친구요청 리스트에 있는 아이디듣)
 final  List<int> _requestedUserIds;
/// 검색 결과 중 '요청됨'으로 처리할 유저 id 목록
/// (즉, 이미 친구요청 리스트에 있는 아이디듣)
@override@JsonKey() List<int> get requestedUserIds {
  if (_requestedUserIds is EqualUnmodifiableListView) return _requestedUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestedUserIds);
}

@override@JsonKey() final  bool isRequest;
/// 현재 페이지 상태
@override@JsonKey() final  FriendRequestPageState pageState;

/// Create a copy of FriendRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestStateCopyWith<_FriendRequestState> get copyWith => __$FriendRequestStateCopyWithImpl<_FriendRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestState&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other._friendRequest, _friendRequest)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&const DeepCollectionEquality().equals(other._requestProfiles, _requestProfiles)&&const DeepCollectionEquality().equals(other._requestedUserIds, _requestedUserIds)&&(identical(other.isRequest, isRequest) || other.isRequest == isRequest)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,const DeepCollectionEquality().hash(_friendRequest),message,errorType,actionType,keyword,const DeepCollectionEquality().hash(_searchResults),const DeepCollectionEquality().hash(_requestProfiles),const DeepCollectionEquality().hash(_requestedUserIds),isRequest,pageState);

@override
String toString() {
  return 'FriendRequestState(id: $id, requestId: $requestId, targetId: $targetId, friendRequest: $friendRequest, message: $message, errorType: $errorType, actionType: $actionType, keyword: $keyword, searchResults: $searchResults, requestProfiles: $requestProfiles, requestedUserIds: $requestedUserIds, isRequest: $isRequest, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestStateCopyWith<$Res> implements $FriendRequestStateCopyWith<$Res> {
  factory _$FriendRequestStateCopyWith(_FriendRequestState value, $Res Function(_FriendRequestState) _then) = __$FriendRequestStateCopyWithImpl;
@override @useResult
$Res call({
 int? id, int requestId, int targetId, List<FriendRequestEntity> friendRequest, String? message, String? errorType, String? actionType, String keyword, List<UserEntity> searchResults, List<UserEntity> requestProfiles, List<int> requestedUserIds, bool isRequest, FriendRequestPageState pageState
});




}
/// @nodoc
class __$FriendRequestStateCopyWithImpl<$Res>
    implements _$FriendRequestStateCopyWith<$Res> {
  __$FriendRequestStateCopyWithImpl(this._self, this._then);

  final _FriendRequestState _self;
  final $Res Function(_FriendRequestState) _then;

/// Create a copy of FriendRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? requestId = null,Object? targetId = null,Object? friendRequest = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? keyword = null,Object? searchResults = null,Object? requestProfiles = null,Object? requestedUserIds = null,Object? isRequest = null,Object? pageState = null,}) {
  return _then(_FriendRequestState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,friendRequest: null == friendRequest ? _self._friendRequest : friendRequest // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,requestProfiles: null == requestProfiles ? _self._requestProfiles : requestProfiles // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,requestedUserIds: null == requestedUserIds ? _self._requestedUserIds : requestedUserIds // ignore: cast_nullable_to_non_nullable
as List<int>,isRequest: null == isRequest ? _self.isRequest : isRequest // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendRequestPageState,
  ));
}


}

// dart format on
