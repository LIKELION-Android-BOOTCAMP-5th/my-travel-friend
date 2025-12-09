// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmSettingState {

 int get userId; AlarmSettingPageState get pageState; AlarmSettingEntity? get setting; String? get message;
/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmSettingStateCopyWith<AlarmSettingState> get copyWith => _$AlarmSettingStateCopyWithImpl<AlarmSettingState>(this as AlarmSettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmSettingState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.setting, setting) || other.setting == setting)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,userId,pageState,setting,message);

@override
String toString() {
  return 'AlarmSettingState(userId: $userId, pageState: $pageState, setting: $setting, message: $message)';
}


}

/// @nodoc
abstract mixin class $AlarmSettingStateCopyWith<$Res>  {
  factory $AlarmSettingStateCopyWith(AlarmSettingState value, $Res Function(AlarmSettingState) _then) = _$AlarmSettingStateCopyWithImpl;
@useResult
$Res call({
 int userId, AlarmSettingPageState pageState, AlarmSettingEntity? setting, String? message
});


$AlarmSettingEntityCopyWith<$Res>? get setting;

}
/// @nodoc
class _$AlarmSettingStateCopyWithImpl<$Res>
    implements $AlarmSettingStateCopyWith<$Res> {
  _$AlarmSettingStateCopyWithImpl(this._self, this._then);

  final AlarmSettingState _self;
  final $Res Function(AlarmSettingState) _then;

/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? pageState = null,Object? setting = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as AlarmSettingPageState,setting: freezed == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AlarmSettingEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmSettingEntityCopyWith<$Res>? get setting {
    if (_self.setting == null) {
    return null;
  }

  return $AlarmSettingEntityCopyWith<$Res>(_self.setting!, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlarmSettingState].
extension AlarmSettingStatePatterns on AlarmSettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmSettingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmSettingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmSettingState value)  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmSettingState value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  AlarmSettingPageState pageState,  AlarmSettingEntity? setting,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmSettingState() when $default != null:
return $default(_that.userId,_that.pageState,_that.setting,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  AlarmSettingPageState pageState,  AlarmSettingEntity? setting,  String? message)  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingState():
return $default(_that.userId,_that.pageState,_that.setting,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  AlarmSettingPageState pageState,  AlarmSettingEntity? setting,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingState() when $default != null:
return $default(_that.userId,_that.pageState,_that.setting,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmSettingState extends AlarmSettingState {
  const _AlarmSettingState({this.userId = 0, this.pageState = AlarmSettingPageState.initial, this.setting, this.message}): super._();
  

@override@JsonKey() final  int userId;
@override@JsonKey() final  AlarmSettingPageState pageState;
@override final  AlarmSettingEntity? setting;
@override final  String? message;

/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmSettingStateCopyWith<_AlarmSettingState> get copyWith => __$AlarmSettingStateCopyWithImpl<_AlarmSettingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmSettingState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.setting, setting) || other.setting == setting)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,userId,pageState,setting,message);

@override
String toString() {
  return 'AlarmSettingState(userId: $userId, pageState: $pageState, setting: $setting, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AlarmSettingStateCopyWith<$Res> implements $AlarmSettingStateCopyWith<$Res> {
  factory _$AlarmSettingStateCopyWith(_AlarmSettingState value, $Res Function(_AlarmSettingState) _then) = __$AlarmSettingStateCopyWithImpl;
@override @useResult
$Res call({
 int userId, AlarmSettingPageState pageState, AlarmSettingEntity? setting, String? message
});


@override $AlarmSettingEntityCopyWith<$Res>? get setting;

}
/// @nodoc
class __$AlarmSettingStateCopyWithImpl<$Res>
    implements _$AlarmSettingStateCopyWith<$Res> {
  __$AlarmSettingStateCopyWithImpl(this._self, this._then);

  final _AlarmSettingState _self;
  final $Res Function(_AlarmSettingState) _then;

/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? pageState = null,Object? setting = freezed,Object? message = freezed,}) {
  return _then(_AlarmSettingState(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as AlarmSettingPageState,setting: freezed == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AlarmSettingEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AlarmSettingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmSettingEntityCopyWith<$Res>? get setting {
    if (_self.setting == null) {
    return null;
  }

  return $AlarmSettingEntityCopyWith<$Res>(_self.setting!, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}

// dart format on
