// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionState {

// 페이지 상태
 PermissionPageState get pageState;// 권한 목록
 List<PermissionInfo> get permissions;// 에러
 String? get message;
/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionStateCopyWith<PermissionState> get copyWith => _$PermissionStateCopyWithImpl<PermissionState>(this as PermissionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,const DeepCollectionEquality().hash(permissions),message);

@override
String toString() {
  return 'PermissionState(pageState: $pageState, permissions: $permissions, message: $message)';
}


}

/// @nodoc
abstract mixin class $PermissionStateCopyWith<$Res>  {
  factory $PermissionStateCopyWith(PermissionState value, $Res Function(PermissionState) _then) = _$PermissionStateCopyWithImpl;
@useResult
$Res call({
 PermissionPageState pageState, List<PermissionInfo> permissions, String? message
});




}
/// @nodoc
class _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._self, this._then);

  final PermissionState _self;
  final $Res Function(PermissionState) _then;

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? permissions = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PermissionPageState,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionInfo>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionState].
extension PermissionStatePatterns on PermissionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionState value)  $default,){
final _that = this;
switch (_that) {
case _PermissionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionState value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PermissionPageState pageState,  List<PermissionInfo> permissions,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionState() when $default != null:
return $default(_that.pageState,_that.permissions,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PermissionPageState pageState,  List<PermissionInfo> permissions,  String? message)  $default,) {final _that = this;
switch (_that) {
case _PermissionState():
return $default(_that.pageState,_that.permissions,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PermissionPageState pageState,  List<PermissionInfo> permissions,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _PermissionState() when $default != null:
return $default(_that.pageState,_that.permissions,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionState extends PermissionState {
  const _PermissionState({this.pageState = PermissionPageState.initial, final  List<PermissionInfo> permissions = const [], this.message}): _permissions = permissions,super._();
  

// 페이지 상태
@override@JsonKey() final  PermissionPageState pageState;
// 권한 목록
 final  List<PermissionInfo> _permissions;
// 권한 목록
@override@JsonKey() List<PermissionInfo> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

// 에러
@override final  String? message;

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionStateCopyWith<_PermissionState> get copyWith => __$PermissionStateCopyWithImpl<_PermissionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,const DeepCollectionEquality().hash(_permissions),message);

@override
String toString() {
  return 'PermissionState(pageState: $pageState, permissions: $permissions, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PermissionStateCopyWith<$Res> implements $PermissionStateCopyWith<$Res> {
  factory _$PermissionStateCopyWith(_PermissionState value, $Res Function(_PermissionState) _then) = __$PermissionStateCopyWithImpl;
@override @useResult
$Res call({
 PermissionPageState pageState, List<PermissionInfo> permissions, String? message
});




}
/// @nodoc
class __$PermissionStateCopyWithImpl<$Res>
    implements _$PermissionStateCopyWith<$Res> {
  __$PermissionStateCopyWithImpl(this._self, this._then);

  final _PermissionState _self;
  final $Res Function(_PermissionState) _then;

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? permissions = null,Object? message = freezed,}) {
  return _then(_PermissionState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PermissionPageState,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionInfo>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
