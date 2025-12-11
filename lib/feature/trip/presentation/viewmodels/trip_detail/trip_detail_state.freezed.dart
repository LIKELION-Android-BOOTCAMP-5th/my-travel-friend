// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripDetailState {

 TripDetailPageState get pageState; TripEntity? get trip; String? get errorMessage;
/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDetailStateCopyWith<TripDetailState> get copyWith => _$TripDetailStateCopyWithImpl<TripDetailState>(this as TripDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,trip,errorMessage);

@override
String toString() {
  return 'TripDetailState(pageState: $pageState, trip: $trip, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TripDetailStateCopyWith<$Res>  {
  factory $TripDetailStateCopyWith(TripDetailState value, $Res Function(TripDetailState) _then) = _$TripDetailStateCopyWithImpl;
@useResult
$Res call({
 TripDetailPageState pageState, TripEntity? trip, String? errorMessage
});


$TripEntityCopyWith<$Res>? get trip;

}
/// @nodoc
class _$TripDetailStateCopyWithImpl<$Res>
    implements $TripDetailStateCopyWith<$Res> {
  _$TripDetailStateCopyWithImpl(this._self, this._then);

  final TripDetailState _self;
  final $Res Function(TripDetailState) _then;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? trip = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripDetailPageState,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripDetailState].
extension TripDetailStatePatterns on TripDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TripDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TripDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripDetailPageState pageState,  TripEntity? trip,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripDetailState() when $default != null:
return $default(_that.pageState,_that.trip,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripDetailPageState pageState,  TripEntity? trip,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TripDetailState():
return $default(_that.pageState,_that.trip,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripDetailPageState pageState,  TripEntity? trip,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TripDetailState() when $default != null:
return $default(_that.pageState,_that.trip,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TripDetailState extends TripDetailState {
  const _TripDetailState({this.pageState = TripDetailPageState.initial, this.trip, this.errorMessage}): super._();
  

@override@JsonKey() final  TripDetailPageState pageState;
@override final  TripEntity? trip;
@override final  String? errorMessage;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripDetailStateCopyWith<_TripDetailState> get copyWith => __$TripDetailStateCopyWithImpl<_TripDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripDetailState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,trip,errorMessage);

@override
String toString() {
  return 'TripDetailState(pageState: $pageState, trip: $trip, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TripDetailStateCopyWith<$Res> implements $TripDetailStateCopyWith<$Res> {
  factory _$TripDetailStateCopyWith(_TripDetailState value, $Res Function(_TripDetailState) _then) = __$TripDetailStateCopyWithImpl;
@override @useResult
$Res call({
 TripDetailPageState pageState, TripEntity? trip, String? errorMessage
});


@override $TripEntityCopyWith<$Res>? get trip;

}
/// @nodoc
class __$TripDetailStateCopyWithImpl<$Res>
    implements _$TripDetailStateCopyWith<$Res> {
  __$TripDetailStateCopyWithImpl(this._self, this._then);

  final _TripDetailState _self;
  final $Res Function(_TripDetailState) _then;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? trip = freezed,Object? errorMessage = freezed,}) {
  return _then(_TripDetailState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripDetailPageState,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

// dart format on
