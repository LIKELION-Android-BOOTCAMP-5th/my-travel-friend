// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendSearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendSearchEvent()';
}


}

/// @nodoc
class $FriendSearchEventCopyWith<$Res>  {
$FriendSearchEventCopyWith(FriendSearchEvent _, $Res Function(FriendSearchEvent) __);
}


/// Adds pattern-matching-related methods to [FriendSearchEvent].
extension FriendSearchEventPatterns on FriendSearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialized value)?  initialized,TResult Function( KeywordChanged value)?  keywordChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case KeywordChanged() when keywordChanged != null:
return keywordChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialized value)  initialized,required TResult Function( KeywordChanged value)  keywordChanged,}){
final _that = this;
switch (_that) {
case Initialized():
return initialized(_that);case KeywordChanged():
return keywordChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialized value)?  initialized,TResult? Function( KeywordChanged value)?  keywordChanged,}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case KeywordChanged() when keywordChanged != null:
return keywordChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int myUserId)?  initialized,TResult Function( String keyword)?  keywordChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.myUserId);case KeywordChanged() when keywordChanged != null:
return keywordChanged(_that.keyword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int myUserId)  initialized,required TResult Function( String keyword)  keywordChanged,}) {final _that = this;
switch (_that) {
case Initialized():
return initialized(_that.myUserId);case KeywordChanged():
return keywordChanged(_that.keyword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int myUserId)?  initialized,TResult? Function( String keyword)?  keywordChanged,}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.myUserId);case KeywordChanged() when keywordChanged != null:
return keywordChanged(_that.keyword);case _:
  return null;

}
}

}

/// @nodoc


class Initialized implements FriendSearchEvent {
  const Initialized({required this.myUserId});
  

 final  int myUserId;

/// Create a copy of FriendSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializedCopyWith<Initialized> get copyWith => _$InitializedCopyWithImpl<Initialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialized&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId));
}


@override
int get hashCode => Object.hash(runtimeType,myUserId);

@override
String toString() {
  return 'FriendSearchEvent.initialized(myUserId: $myUserId)';
}


}

/// @nodoc
abstract mixin class $InitializedCopyWith<$Res> implements $FriendSearchEventCopyWith<$Res> {
  factory $InitializedCopyWith(Initialized value, $Res Function(Initialized) _then) = _$InitializedCopyWithImpl;
@useResult
$Res call({
 int myUserId
});




}
/// @nodoc
class _$InitializedCopyWithImpl<$Res>
    implements $InitializedCopyWith<$Res> {
  _$InitializedCopyWithImpl(this._self, this._then);

  final Initialized _self;
  final $Res Function(Initialized) _then;

/// Create a copy of FriendSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myUserId = null,}) {
  return _then(Initialized(
myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class KeywordChanged implements FriendSearchEvent {
  const KeywordChanged(this.keyword);
  

 final  String keyword;

/// Create a copy of FriendSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeywordChangedCopyWith<KeywordChanged> get copyWith => _$KeywordChangedCopyWithImpl<KeywordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeywordChanged&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,keyword);

@override
String toString() {
  return 'FriendSearchEvent.keywordChanged(keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class $KeywordChangedCopyWith<$Res> implements $FriendSearchEventCopyWith<$Res> {
  factory $KeywordChangedCopyWith(KeywordChanged value, $Res Function(KeywordChanged) _then) = _$KeywordChangedCopyWithImpl;
@useResult
$Res call({
 String keyword
});




}
/// @nodoc
class _$KeywordChangedCopyWithImpl<$Res>
    implements $KeywordChangedCopyWith<$Res> {
  _$KeywordChangedCopyWithImpl(this._self, this._then);

  final KeywordChanged _self;
  final $Res Function(KeywordChanged) _then;

/// Create a copy of FriendSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = null,}) {
  return _then(KeywordChanged(
null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
