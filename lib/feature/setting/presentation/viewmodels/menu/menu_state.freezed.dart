// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuState {

 MenuPageState get pageState;// @Default(0) int friendReceiveCount,
// @Default(0) int travelReceiveCount,
 String? get message;
/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuStateCopyWith<MenuState> get copyWith => _$MenuStateCopyWithImpl<MenuState>(this as MenuState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,message);

@override
String toString() {
  return 'MenuState(pageState: $pageState, message: $message)';
}


}

/// @nodoc
abstract mixin class $MenuStateCopyWith<$Res>  {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) _then) = _$MenuStateCopyWithImpl;
@useResult
$Res call({
 MenuPageState pageState, String? message
});




}
/// @nodoc
class _$MenuStateCopyWithImpl<$Res>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._self, this._then);

  final MenuState _self;
  final $Res Function(MenuState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as MenuPageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuState].
extension MenuStatePatterns on MenuState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuState value)  $default,){
final _that = this;
switch (_that) {
case _MenuState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuState value)?  $default,){
final _that = this;
switch (_that) {
case _MenuState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuPageState pageState,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that.pageState,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuPageState pageState,  String? message)  $default,) {final _that = this;
switch (_that) {
case _MenuState():
return $default(_that.pageState,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuPageState pageState,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that.pageState,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _MenuState extends MenuState {
  const _MenuState({this.pageState = MenuPageState.initial, this.message}): super._();
  

@override@JsonKey() final  MenuPageState pageState;
// @Default(0) int friendReceiveCount,
// @Default(0) int travelReceiveCount,
@override final  String? message;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuStateCopyWith<_MenuState> get copyWith => __$MenuStateCopyWithImpl<_MenuState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,message);

@override
String toString() {
  return 'MenuState(pageState: $pageState, message: $message)';
}


}

/// @nodoc
abstract mixin class _$MenuStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$MenuStateCopyWith(_MenuState value, $Res Function(_MenuState) _then) = __$MenuStateCopyWithImpl;
@override @useResult
$Res call({
 MenuPageState pageState, String? message
});




}
/// @nodoc
class __$MenuStateCopyWithImpl<$Res>
    implements _$MenuStateCopyWith<$Res> {
  __$MenuStateCopyWithImpl(this._self, this._then);

  final _MenuState _self;
  final $Res Function(_MenuState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? message = freezed,}) {
  return _then(_MenuState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as MenuPageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
