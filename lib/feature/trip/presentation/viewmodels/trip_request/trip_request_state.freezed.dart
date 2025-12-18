// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripRequestState {

 List<TripRequestEntity> get tripRequests;// 받은 초대 목록
 List<TripEntity> get invitedTrips;//id로 조회한 여행들
 String? get message; String? get errorType; String? get actionType; TripRequestPageState get pageState;
/// Create a copy of TripRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripRequestStateCopyWith<TripRequestState> get copyWith => _$TripRequestStateCopyWithImpl<TripRequestState>(this as TripRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripRequestState&&const DeepCollectionEquality().equals(other.tripRequests, tripRequests)&&const DeepCollectionEquality().equals(other.invitedTrips, invitedTrips)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tripRequests),const DeepCollectionEquality().hash(invitedTrips),message,errorType,actionType,pageState);

@override
String toString() {
  return 'TripRequestState(tripRequests: $tripRequests, invitedTrips: $invitedTrips, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $TripRequestStateCopyWith<$Res>  {
  factory $TripRequestStateCopyWith(TripRequestState value, $Res Function(TripRequestState) _then) = _$TripRequestStateCopyWithImpl;
@useResult
$Res call({
 List<TripRequestEntity> tripRequests, List<TripEntity> invitedTrips, String? message, String? errorType, String? actionType, TripRequestPageState pageState
});




}
/// @nodoc
class _$TripRequestStateCopyWithImpl<$Res>
    implements $TripRequestStateCopyWith<$Res> {
  _$TripRequestStateCopyWithImpl(this._self, this._then);

  final TripRequestState _self;
  final $Res Function(TripRequestState) _then;

/// Create a copy of TripRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripRequests = null,Object? invitedTrips = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripRequests: null == tripRequests ? _self.tripRequests : tripRequests // ignore: cast_nullable_to_non_nullable
as List<TripRequestEntity>,invitedTrips: null == invitedTrips ? _self.invitedTrips : invitedTrips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripRequestPageState,
  ));
}

}


/// Adds pattern-matching-related methods to [TripRequestState].
extension TripRequestStatePatterns on TripRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripRequestState value)  $default,){
final _that = this;
switch (_that) {
case _TripRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _TripRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TripRequestEntity> tripRequests,  List<TripEntity> invitedTrips,  String? message,  String? errorType,  String? actionType,  TripRequestPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripRequestState() when $default != null:
return $default(_that.tripRequests,_that.invitedTrips,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TripRequestEntity> tripRequests,  List<TripEntity> invitedTrips,  String? message,  String? errorType,  String? actionType,  TripRequestPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _TripRequestState():
return $default(_that.tripRequests,_that.invitedTrips,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TripRequestEntity> tripRequests,  List<TripEntity> invitedTrips,  String? message,  String? errorType,  String? actionType,  TripRequestPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _TripRequestState() when $default != null:
return $default(_that.tripRequests,_that.invitedTrips,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _TripRequestState implements TripRequestState {
  const _TripRequestState({final  List<TripRequestEntity> tripRequests = const [], final  List<TripEntity> invitedTrips = const [], this.message, this.errorType, this.actionType, this.pageState = TripRequestPageState.init}): _tripRequests = tripRequests,_invitedTrips = invitedTrips;
  

 final  List<TripRequestEntity> _tripRequests;
@override@JsonKey() List<TripRequestEntity> get tripRequests {
  if (_tripRequests is EqualUnmodifiableListView) return _tripRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tripRequests);
}

// 받은 초대 목록
 final  List<TripEntity> _invitedTrips;
// 받은 초대 목록
@override@JsonKey() List<TripEntity> get invitedTrips {
  if (_invitedTrips is EqualUnmodifiableListView) return _invitedTrips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invitedTrips);
}

//id로 조회한 여행들
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
@override@JsonKey() final  TripRequestPageState pageState;

/// Create a copy of TripRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripRequestStateCopyWith<_TripRequestState> get copyWith => __$TripRequestStateCopyWithImpl<_TripRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripRequestState&&const DeepCollectionEquality().equals(other._tripRequests, _tripRequests)&&const DeepCollectionEquality().equals(other._invitedTrips, _invitedTrips)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tripRequests),const DeepCollectionEquality().hash(_invitedTrips),message,errorType,actionType,pageState);

@override
String toString() {
  return 'TripRequestState(tripRequests: $tripRequests, invitedTrips: $invitedTrips, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$TripRequestStateCopyWith<$Res> implements $TripRequestStateCopyWith<$Res> {
  factory _$TripRequestStateCopyWith(_TripRequestState value, $Res Function(_TripRequestState) _then) = __$TripRequestStateCopyWithImpl;
@override @useResult
$Res call({
 List<TripRequestEntity> tripRequests, List<TripEntity> invitedTrips, String? message, String? errorType, String? actionType, TripRequestPageState pageState
});




}
/// @nodoc
class __$TripRequestStateCopyWithImpl<$Res>
    implements _$TripRequestStateCopyWith<$Res> {
  __$TripRequestStateCopyWithImpl(this._self, this._then);

  final _TripRequestState _self;
  final $Res Function(_TripRequestState) _then;

/// Create a copy of TripRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripRequests = null,Object? invitedTrips = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_TripRequestState(
tripRequests: null == tripRequests ? _self._tripRequests : tripRequests // ignore: cast_nullable_to_non_nullable
as List<TripRequestEntity>,invitedTrips: null == invitedTrips ? _self._invitedTrips : invitedTrips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripRequestPageState,
  ));
}


}

// dart format on
