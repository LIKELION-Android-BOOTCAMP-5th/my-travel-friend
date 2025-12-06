// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmState {

 AlarmPageState get pageState; List<AlarmEntity> get alarms; AlarmEntity? get selectedAlarm; int get currentPage; bool get hasMore; String? get message;
/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmStateCopyWith<AlarmState> get copyWith => _$AlarmStateCopyWithImpl<AlarmState>(this as AlarmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other.alarms, alarms)&&(identical(other.selectedAlarm, selectedAlarm) || other.selectedAlarm == selectedAlarm)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,const DeepCollectionEquality().hash(alarms),selectedAlarm,currentPage,hasMore,message);

@override
String toString() {
  return 'AlarmState(pageState: $pageState, alarms: $alarms, selectedAlarm: $selectedAlarm, currentPage: $currentPage, hasMore: $hasMore, message: $message)';
}


}

/// @nodoc
abstract mixin class $AlarmStateCopyWith<$Res>  {
  factory $AlarmStateCopyWith(AlarmState value, $Res Function(AlarmState) _then) = _$AlarmStateCopyWithImpl;
@useResult
$Res call({
 AlarmPageState pageState, List<AlarmEntity> alarms, AlarmEntity? selectedAlarm, int currentPage, bool hasMore, String? message
});


$AlarmEntityCopyWith<$Res>? get selectedAlarm;

}
/// @nodoc
class _$AlarmStateCopyWithImpl<$Res>
    implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._self, this._then);

  final AlarmState _self;
  final $Res Function(AlarmState) _then;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? alarms = null,Object? selectedAlarm = freezed,Object? currentPage = null,Object? hasMore = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as AlarmPageState,alarms: null == alarms ? _self.alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<AlarmEntity>,selectedAlarm: freezed == selectedAlarm ? _self.selectedAlarm : selectedAlarm // ignore: cast_nullable_to_non_nullable
as AlarmEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<$Res>? get selectedAlarm {
    if (_self.selectedAlarm == null) {
    return null;
  }

  return $AlarmEntityCopyWith<$Res>(_self.selectedAlarm!, (value) {
    return _then(_self.copyWith(selectedAlarm: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlarmState].
extension AlarmStatePatterns on AlarmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmState value)  $default,){
final _that = this;
switch (_that) {
case _AlarmState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmState value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AlarmPageState pageState,  List<AlarmEntity> alarms,  AlarmEntity? selectedAlarm,  int currentPage,  bool hasMore,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
return $default(_that.pageState,_that.alarms,_that.selectedAlarm,_that.currentPage,_that.hasMore,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AlarmPageState pageState,  List<AlarmEntity> alarms,  AlarmEntity? selectedAlarm,  int currentPage,  bool hasMore,  String? message)  $default,) {final _that = this;
switch (_that) {
case _AlarmState():
return $default(_that.pageState,_that.alarms,_that.selectedAlarm,_that.currentPage,_that.hasMore,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AlarmPageState pageState,  List<AlarmEntity> alarms,  AlarmEntity? selectedAlarm,  int currentPage,  bool hasMore,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
return $default(_that.pageState,_that.alarms,_that.selectedAlarm,_that.currentPage,_that.hasMore,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmState implements AlarmState {
  const _AlarmState({this.pageState = AlarmPageState.initial, final  List<AlarmEntity> alarms = const [], this.selectedAlarm, this.currentPage = 0, this.hasMore = false, this.message}): _alarms = alarms;
  

@override@JsonKey() final  AlarmPageState pageState;
 final  List<AlarmEntity> _alarms;
@override@JsonKey() List<AlarmEntity> get alarms {
  if (_alarms is EqualUnmodifiableListView) return _alarms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alarms);
}

@override final  AlarmEntity? selectedAlarm;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override final  String? message;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmStateCopyWith<_AlarmState> get copyWith => __$AlarmStateCopyWithImpl<_AlarmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other._alarms, _alarms)&&(identical(other.selectedAlarm, selectedAlarm) || other.selectedAlarm == selectedAlarm)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,const DeepCollectionEquality().hash(_alarms),selectedAlarm,currentPage,hasMore,message);

@override
String toString() {
  return 'AlarmState(pageState: $pageState, alarms: $alarms, selectedAlarm: $selectedAlarm, currentPage: $currentPage, hasMore: $hasMore, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AlarmStateCopyWith<$Res> implements $AlarmStateCopyWith<$Res> {
  factory _$AlarmStateCopyWith(_AlarmState value, $Res Function(_AlarmState) _then) = __$AlarmStateCopyWithImpl;
@override @useResult
$Res call({
 AlarmPageState pageState, List<AlarmEntity> alarms, AlarmEntity? selectedAlarm, int currentPage, bool hasMore, String? message
});


@override $AlarmEntityCopyWith<$Res>? get selectedAlarm;

}
/// @nodoc
class __$AlarmStateCopyWithImpl<$Res>
    implements _$AlarmStateCopyWith<$Res> {
  __$AlarmStateCopyWithImpl(this._self, this._then);

  final _AlarmState _self;
  final $Res Function(_AlarmState) _then;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? alarms = null,Object? selectedAlarm = freezed,Object? currentPage = null,Object? hasMore = null,Object? message = freezed,}) {
  return _then(_AlarmState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as AlarmPageState,alarms: null == alarms ? _self._alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<AlarmEntity>,selectedAlarm: freezed == selectedAlarm ? _self.selectedAlarm : selectedAlarm // ignore: cast_nullable_to_non_nullable
as AlarmEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<$Res>? get selectedAlarm {
    if (_self.selectedAlarm == null) {
    return null;
  }

  return $AlarmEntityCopyWith<$Res>(_self.selectedAlarm!, (value) {
    return _then(_self.copyWith(selectedAlarm: value));
  });
}
}

// dart format on
