// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendSearchState {

/// 내 userId
 int get myUserId;/// 현재 검색어
 String get keyword;/// 검색 결과 (내 친구 중 닉네임으로 필터된 유저들)
 List<UserEntity> get results;/// 메시지 (에러 등)
 String? get message;/// 페이지 상태
 FriendSearchPageState get pageState;
/// Create a copy of FriendSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendSearchStateCopyWith<FriendSearchState> get copyWith => _$FriendSearchStateCopyWithImpl<FriendSearchState>(this as FriendSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendSearchState&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,myUserId,keyword,const DeepCollectionEquality().hash(results),message,pageState);

@override
String toString() {
  return 'FriendSearchState(myUserId: $myUserId, keyword: $keyword, results: $results, message: $message, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $FriendSearchStateCopyWith<$Res>  {
  factory $FriendSearchStateCopyWith(FriendSearchState value, $Res Function(FriendSearchState) _then) = _$FriendSearchStateCopyWithImpl;
@useResult
$Res call({
 int myUserId, String keyword, List<UserEntity> results, String? message, FriendSearchPageState pageState
});




}
/// @nodoc
class _$FriendSearchStateCopyWithImpl<$Res>
    implements $FriendSearchStateCopyWith<$Res> {
  _$FriendSearchStateCopyWithImpl(this._self, this._then);

  final FriendSearchState _self;
  final $Res Function(FriendSearchState) _then;

/// Create a copy of FriendSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myUserId = null,Object? keyword = null,Object? results = null,Object? message = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendSearchPageState,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendSearchState].
extension FriendSearchStatePatterns on FriendSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendSearchState value)  $default,){
final _that = this;
switch (_that) {
case _FriendSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _FriendSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int myUserId,  String keyword,  List<UserEntity> results,  String? message,  FriendSearchPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendSearchState() when $default != null:
return $default(_that.myUserId,_that.keyword,_that.results,_that.message,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int myUserId,  String keyword,  List<UserEntity> results,  String? message,  FriendSearchPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _FriendSearchState():
return $default(_that.myUserId,_that.keyword,_that.results,_that.message,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int myUserId,  String keyword,  List<UserEntity> results,  String? message,  FriendSearchPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _FriendSearchState() when $default != null:
return $default(_that.myUserId,_that.keyword,_that.results,_that.message,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _FriendSearchState implements FriendSearchState {
  const _FriendSearchState({this.myUserId = 0, this.keyword = '', final  List<UserEntity> results = const [], this.message, this.pageState = FriendSearchPageState.init}): _results = results;
  

/// 내 userId
@override@JsonKey() final  int myUserId;
/// 현재 검색어
@override@JsonKey() final  String keyword;
/// 검색 결과 (내 친구 중 닉네임으로 필터된 유저들)
 final  List<UserEntity> _results;
/// 검색 결과 (내 친구 중 닉네임으로 필터된 유저들)
@override@JsonKey() List<UserEntity> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

/// 메시지 (에러 등)
@override final  String? message;
/// 페이지 상태
@override@JsonKey() final  FriendSearchPageState pageState;

/// Create a copy of FriendSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendSearchStateCopyWith<_FriendSearchState> get copyWith => __$FriendSearchStateCopyWithImpl<_FriendSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendSearchState&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,myUserId,keyword,const DeepCollectionEquality().hash(_results),message,pageState);

@override
String toString() {
  return 'FriendSearchState(myUserId: $myUserId, keyword: $keyword, results: $results, message: $message, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$FriendSearchStateCopyWith<$Res> implements $FriendSearchStateCopyWith<$Res> {
  factory _$FriendSearchStateCopyWith(_FriendSearchState value, $Res Function(_FriendSearchState) _then) = __$FriendSearchStateCopyWithImpl;
@override @useResult
$Res call({
 int myUserId, String keyword, List<UserEntity> results, String? message, FriendSearchPageState pageState
});




}
/// @nodoc
class __$FriendSearchStateCopyWithImpl<$Res>
    implements _$FriendSearchStateCopyWith<$Res> {
  __$FriendSearchStateCopyWithImpl(this._self, this._then);

  final _FriendSearchState _self;
  final $Res Function(_FriendSearchState) _then;

/// Create a copy of FriendSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myUserId = null,Object? keyword = null,Object? results = null,Object? message = freezed,Object? pageState = null,}) {
  return _then(_FriendSearchState(
myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendSearchPageState,
  ));
}


}

// dart format on
