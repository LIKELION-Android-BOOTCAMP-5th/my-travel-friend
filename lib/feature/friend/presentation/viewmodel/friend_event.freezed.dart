// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendEvent()';
}


}

/// @nodoc
class $FriendEventCopyWith<$Res>  {
$FriendEventCopyWith(FriendEvent _, $Res Function(FriendEvent) __);
}


/// Adds pattern-matching-related methods to [FriendEvent].
extension FriendEventPatterns on FriendEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetFriends value)?  getFriends,TResult Function( GoTravel value)?  goTravel,TResult Function( DeleteFriend value)?  deleteFriend,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetFriends() when getFriends != null:
return getFriends(_that);case GoTravel() when goTravel != null:
return goTravel(_that);case DeleteFriend() when deleteFriend != null:
return deleteFriend(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetFriends value)  getFriends,required TResult Function( GoTravel value)  goTravel,required TResult Function( DeleteFriend value)  deleteFriend,}){
final _that = this;
switch (_that) {
case GetFriends():
return getFriends(_that);case GoTravel():
return goTravel(_that);case DeleteFriend():
return deleteFriend(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetFriends value)?  getFriends,TResult? Function( GoTravel value)?  goTravel,TResult? Function( DeleteFriend value)?  deleteFriend,}){
final _that = this;
switch (_that) {
case GetFriends() when getFriends != null:
return getFriends(_that);case GoTravel() when goTravel != null:
return goTravel(_that);case DeleteFriend() when deleteFriend != null:
return deleteFriend(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId)?  getFriends,TResult Function( int myUserId,  int friendUserId)?  goTravel,TResult Function( int myUserId,  int friendUserId)?  deleteFriend,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetFriends() when getFriends != null:
return getFriends(_that.userId);case GoTravel() when goTravel != null:
return goTravel(_that.myUserId,_that.friendUserId);case DeleteFriend() when deleteFriend != null:
return deleteFriend(_that.myUserId,_that.friendUserId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId)  getFriends,required TResult Function( int myUserId,  int friendUserId)  goTravel,required TResult Function( int myUserId,  int friendUserId)  deleteFriend,}) {final _that = this;
switch (_that) {
case GetFriends():
return getFriends(_that.userId);case GoTravel():
return goTravel(_that.myUserId,_that.friendUserId);case DeleteFriend():
return deleteFriend(_that.myUserId,_that.friendUserId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId)?  getFriends,TResult? Function( int myUserId,  int friendUserId)?  goTravel,TResult? Function( int myUserId,  int friendUserId)?  deleteFriend,}) {final _that = this;
switch (_that) {
case GetFriends() when getFriends != null:
return getFriends(_that.userId);case GoTravel() when goTravel != null:
return goTravel(_that.myUserId,_that.friendUserId);case DeleteFriend() when deleteFriend != null:
return deleteFriend(_that.myUserId,_that.friendUserId);case _:
  return null;

}
}

}

/// @nodoc


class GetFriends implements FriendEvent {
  const GetFriends({required this.userId});
  

 final  int userId;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFriendsCopyWith<GetFriends> get copyWith => _$GetFriendsCopyWithImpl<GetFriends>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFriends&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'FriendEvent.getFriends(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetFriendsCopyWith<$Res> implements $FriendEventCopyWith<$Res> {
  factory $GetFriendsCopyWith(GetFriends value, $Res Function(GetFriends) _then) = _$GetFriendsCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$GetFriendsCopyWithImpl<$Res>
    implements $GetFriendsCopyWith<$Res> {
  _$GetFriendsCopyWithImpl(this._self, this._then);

  final GetFriends _self;
  final $Res Function(GetFriends) _then;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(GetFriends(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GoTravel implements FriendEvent {
  const GoTravel({required this.myUserId, required this.friendUserId});
  

 final  int myUserId;
 final  int friendUserId;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoTravelCopyWith<GoTravel> get copyWith => _$GoTravelCopyWithImpl<GoTravel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoTravel&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId)&&(identical(other.friendUserId, friendUserId) || other.friendUserId == friendUserId));
}


@override
int get hashCode => Object.hash(runtimeType,myUserId,friendUserId);

@override
String toString() {
  return 'FriendEvent.goTravel(myUserId: $myUserId, friendUserId: $friendUserId)';
}


}

/// @nodoc
abstract mixin class $GoTravelCopyWith<$Res> implements $FriendEventCopyWith<$Res> {
  factory $GoTravelCopyWith(GoTravel value, $Res Function(GoTravel) _then) = _$GoTravelCopyWithImpl;
@useResult
$Res call({
 int myUserId, int friendUserId
});




}
/// @nodoc
class _$GoTravelCopyWithImpl<$Res>
    implements $GoTravelCopyWith<$Res> {
  _$GoTravelCopyWithImpl(this._self, this._then);

  final GoTravel _self;
  final $Res Function(GoTravel) _then;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myUserId = null,Object? friendUserId = null,}) {
  return _then(GoTravel(
myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,friendUserId: null == friendUserId ? _self.friendUserId : friendUserId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteFriend implements FriendEvent {
  const DeleteFriend({required this.myUserId, required this.friendUserId});
  

 final  int myUserId;
 final  int friendUserId;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteFriendCopyWith<DeleteFriend> get copyWith => _$DeleteFriendCopyWithImpl<DeleteFriend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFriend&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId)&&(identical(other.friendUserId, friendUserId) || other.friendUserId == friendUserId));
}


@override
int get hashCode => Object.hash(runtimeType,myUserId,friendUserId);

@override
String toString() {
  return 'FriendEvent.deleteFriend(myUserId: $myUserId, friendUserId: $friendUserId)';
}


}

/// @nodoc
abstract mixin class $DeleteFriendCopyWith<$Res> implements $FriendEventCopyWith<$Res> {
  factory $DeleteFriendCopyWith(DeleteFriend value, $Res Function(DeleteFriend) _then) = _$DeleteFriendCopyWithImpl;
@useResult
$Res call({
 int myUserId, int friendUserId
});




}
/// @nodoc
class _$DeleteFriendCopyWithImpl<$Res>
    implements $DeleteFriendCopyWith<$Res> {
  _$DeleteFriendCopyWithImpl(this._self, this._then);

  final DeleteFriend _self;
  final $Res Function(DeleteFriend) _then;

/// Create a copy of FriendEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myUserId = null,Object? friendUserId = null,}) {
  return _then(DeleteFriend(
myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,friendUserId: null == friendUserId ? _self.friendUserId : friendUserId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
