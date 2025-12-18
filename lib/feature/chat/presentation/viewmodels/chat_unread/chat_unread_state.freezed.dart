// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_unread_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatUnreadState {

 int get tripId; int get userId; int get unreadCount; bool get isSubscribed;
/// Create a copy of ChatUnreadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUnreadStateCopyWith<ChatUnreadState> get copyWith => _$ChatUnreadStateCopyWithImpl<ChatUnreadState>(this as ChatUnreadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUnreadState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,unreadCount,isSubscribed);

@override
String toString() {
  return 'ChatUnreadState(tripId: $tripId, userId: $userId, unreadCount: $unreadCount, isSubscribed: $isSubscribed)';
}


}

/// @nodoc
abstract mixin class $ChatUnreadStateCopyWith<$Res>  {
  factory $ChatUnreadStateCopyWith(ChatUnreadState value, $Res Function(ChatUnreadState) _then) = _$ChatUnreadStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId, int unreadCount, bool isSubscribed
});




}
/// @nodoc
class _$ChatUnreadStateCopyWithImpl<$Res>
    implements $ChatUnreadStateCopyWith<$Res> {
  _$ChatUnreadStateCopyWithImpl(this._self, this._then);

  final ChatUnreadState _self;
  final $Res Function(ChatUnreadState) _then;

/// Create a copy of ChatUnreadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = null,Object? unreadCount = null,Object? isSubscribed = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isSubscribed: null == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatUnreadState].
extension ChatUnreadStatePatterns on ChatUnreadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatUnreadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatUnreadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatUnreadState value)  $default,){
final _that = this;
switch (_that) {
case _ChatUnreadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatUnreadState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatUnreadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int userId,  int unreadCount,  bool isSubscribed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatUnreadState() when $default != null:
return $default(_that.tripId,_that.userId,_that.unreadCount,_that.isSubscribed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int userId,  int unreadCount,  bool isSubscribed)  $default,) {final _that = this;
switch (_that) {
case _ChatUnreadState():
return $default(_that.tripId,_that.userId,_that.unreadCount,_that.isSubscribed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int userId,  int unreadCount,  bool isSubscribed)?  $default,) {final _that = this;
switch (_that) {
case _ChatUnreadState() when $default != null:
return $default(_that.tripId,_that.userId,_that.unreadCount,_that.isSubscribed);case _:
  return null;

}
}

}

/// @nodoc


class _ChatUnreadState implements ChatUnreadState {
  const _ChatUnreadState({this.tripId = 0, this.userId = 0, this.unreadCount = 0, this.isSubscribed = false});
  

@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isSubscribed;

/// Create a copy of ChatUnreadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatUnreadStateCopyWith<_ChatUnreadState> get copyWith => __$ChatUnreadStateCopyWithImpl<_ChatUnreadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatUnreadState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,unreadCount,isSubscribed);

@override
String toString() {
  return 'ChatUnreadState(tripId: $tripId, userId: $userId, unreadCount: $unreadCount, isSubscribed: $isSubscribed)';
}


}

/// @nodoc
abstract mixin class _$ChatUnreadStateCopyWith<$Res> implements $ChatUnreadStateCopyWith<$Res> {
  factory _$ChatUnreadStateCopyWith(_ChatUnreadState value, $Res Function(_ChatUnreadState) _then) = __$ChatUnreadStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int userId, int unreadCount, bool isSubscribed
});




}
/// @nodoc
class __$ChatUnreadStateCopyWithImpl<$Res>
    implements _$ChatUnreadStateCopyWith<$Res> {
  __$ChatUnreadStateCopyWithImpl(this._self, this._then);

  final _ChatUnreadState _self;
  final $Res Function(_ChatUnreadState) _then;

/// Create a copy of ChatUnreadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,Object? unreadCount = null,Object? isSubscribed = null,}) {
  return _then(_ChatUnreadState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isSubscribed: null == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
