// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendState {

/// 내 userId
 int get userId;/// 친구 목록 데이터
 List<FriendEntity> get friends;/// 성공/에러 메시지
 String? get message; String? get errorType; String? get actionType;/// 현재 페이지 상태
 FriendPageState get pageState;
/// Create a copy of FriendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendStateCopyWith<FriendState> get copyWith => _$FriendStateCopyWithImpl<FriendState>(this as FriendState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendState&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.friends, friends)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(friends),message,errorType,actionType,pageState);

@override
String toString() {
  return 'FriendState(userId: $userId, friends: $friends, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $FriendStateCopyWith<$Res>  {
  factory $FriendStateCopyWith(FriendState value, $Res Function(FriendState) _then) = _$FriendStateCopyWithImpl;
@useResult
$Res call({
 int userId, List<FriendEntity> friends, String? message, String? errorType, String? actionType, FriendPageState pageState
});




}
/// @nodoc
class _$FriendStateCopyWithImpl<$Res>
    implements $FriendStateCopyWith<$Res> {
  _$FriendStateCopyWithImpl(this._self, this._then);

  final FriendState _self;
  final $Res Function(FriendState) _then;

/// Create a copy of FriendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? friends = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,friends: null == friends ? _self.friends : friends // ignore: cast_nullable_to_non_nullable
as List<FriendEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendPageState,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendState].
extension FriendStatePatterns on FriendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendState value)  $default,){
final _that = this;
switch (_that) {
case _FriendState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendState value)?  $default,){
final _that = this;
switch (_that) {
case _FriendState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  List<FriendEntity> friends,  String? message,  String? errorType,  String? actionType,  FriendPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendState() when $default != null:
return $default(_that.userId,_that.friends,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  List<FriendEntity> friends,  String? message,  String? errorType,  String? actionType,  FriendPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _FriendState():
return $default(_that.userId,_that.friends,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  List<FriendEntity> friends,  String? message,  String? errorType,  String? actionType,  FriendPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _FriendState() when $default != null:
return $default(_that.userId,_that.friends,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _FriendState implements FriendState {
  const _FriendState({this.userId = 0, final  List<FriendEntity> friends = const [], this.message, this.errorType, this.actionType, this.pageState = FriendPageState.init}): _friends = friends;
  

/// 내 userId
@override@JsonKey() final  int userId;
/// 친구 목록 데이터
 final  List<FriendEntity> _friends;
/// 친구 목록 데이터
@override@JsonKey() List<FriendEntity> get friends {
  if (_friends is EqualUnmodifiableListView) return _friends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friends);
}

/// 성공/에러 메시지
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
/// 현재 페이지 상태
@override@JsonKey() final  FriendPageState pageState;

/// Create a copy of FriendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendStateCopyWith<_FriendState> get copyWith => __$FriendStateCopyWithImpl<_FriendState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendState&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._friends, _friends)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_friends),message,errorType,actionType,pageState);

@override
String toString() {
  return 'FriendState(userId: $userId, friends: $friends, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$FriendStateCopyWith<$Res> implements $FriendStateCopyWith<$Res> {
  factory _$FriendStateCopyWith(_FriendState value, $Res Function(_FriendState) _then) = __$FriendStateCopyWithImpl;
@override @useResult
$Res call({
 int userId, List<FriendEntity> friends, String? message, String? errorType, String? actionType, FriendPageState pageState
});




}
/// @nodoc
class __$FriendStateCopyWithImpl<$Res>
    implements _$FriendStateCopyWith<$Res> {
  __$FriendStateCopyWithImpl(this._self, this._then);

  final _FriendState _self;
  final $Res Function(_FriendState) _then;

/// Create a copy of FriendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? friends = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_FriendState(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,friends: null == friends ? _self._friends : friends // ignore: cast_nullable_to_non_nullable
as List<FriendEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as FriendPageState,
  ));
}


}

// dart format on
