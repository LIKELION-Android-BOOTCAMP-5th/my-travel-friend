// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripDetailEvent()';
}


}

/// @nodoc
class $TripDetailEventCopyWith<$Res>  {
$TripDetailEventCopyWith(TripDetailEvent _, $Res Function(TripDetailEvent) __);
}


/// Adds pattern-matching-related methods to [TripDetailEvent].
extension TripDetailEventPatterns on TripDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTripDetail value)?  loadTripDetail,TResult Function( UpdateTripDetail value)?  updateTripDetail,TResult Function( RefreshTripDetail value)?  refreshTripDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTripDetail() when loadTripDetail != null:
return loadTripDetail(_that);case UpdateTripDetail() when updateTripDetail != null:
return updateTripDetail(_that);case RefreshTripDetail() when refreshTripDetail != null:
return refreshTripDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTripDetail value)  loadTripDetail,required TResult Function( UpdateTripDetail value)  updateTripDetail,required TResult Function( RefreshTripDetail value)  refreshTripDetail,}){
final _that = this;
switch (_that) {
case LoadTripDetail():
return loadTripDetail(_that);case UpdateTripDetail():
return updateTripDetail(_that);case RefreshTripDetail():
return refreshTripDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTripDetail value)?  loadTripDetail,TResult? Function( UpdateTripDetail value)?  updateTripDetail,TResult? Function( RefreshTripDetail value)?  refreshTripDetail,}){
final _that = this;
switch (_that) {
case LoadTripDetail() when loadTripDetail != null:
return loadTripDetail(_that);case UpdateTripDetail() when updateTripDetail != null:
return updateTripDetail(_that);case RefreshTripDetail() when refreshTripDetail != null:
return refreshTripDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId)?  loadTripDetail,TResult Function( TripEntity trip)?  updateTripDetail,TResult Function()?  refreshTripDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTripDetail() when loadTripDetail != null:
return loadTripDetail(_that.tripId);case UpdateTripDetail() when updateTripDetail != null:
return updateTripDetail(_that.trip);case RefreshTripDetail() when refreshTripDetail != null:
return refreshTripDetail();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId)  loadTripDetail,required TResult Function( TripEntity trip)  updateTripDetail,required TResult Function()  refreshTripDetail,}) {final _that = this;
switch (_that) {
case LoadTripDetail():
return loadTripDetail(_that.tripId);case UpdateTripDetail():
return updateTripDetail(_that.trip);case RefreshTripDetail():
return refreshTripDetail();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId)?  loadTripDetail,TResult? Function( TripEntity trip)?  updateTripDetail,TResult? Function()?  refreshTripDetail,}) {final _that = this;
switch (_that) {
case LoadTripDetail() when loadTripDetail != null:
return loadTripDetail(_that.tripId);case UpdateTripDetail() when updateTripDetail != null:
return updateTripDetail(_that.trip);case RefreshTripDetail() when refreshTripDetail != null:
return refreshTripDetail();case _:
  return null;

}
}

}

/// @nodoc


class LoadTripDetail implements TripDetailEvent {
  const LoadTripDetail({required this.tripId});
  

 final  int tripId;

/// Create a copy of TripDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTripDetailCopyWith<LoadTripDetail> get copyWith => _$LoadTripDetailCopyWithImpl<LoadTripDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTripDetail&&(identical(other.tripId, tripId) || other.tripId == tripId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId);

@override
String toString() {
  return 'TripDetailEvent.loadTripDetail(tripId: $tripId)';
}


}

/// @nodoc
abstract mixin class $LoadTripDetailCopyWith<$Res> implements $TripDetailEventCopyWith<$Res> {
  factory $LoadTripDetailCopyWith(LoadTripDetail value, $Res Function(LoadTripDetail) _then) = _$LoadTripDetailCopyWithImpl;
@useResult
$Res call({
 int tripId
});




}
/// @nodoc
class _$LoadTripDetailCopyWithImpl<$Res>
    implements $LoadTripDetailCopyWith<$Res> {
  _$LoadTripDetailCopyWithImpl(this._self, this._then);

  final LoadTripDetail _self;
  final $Res Function(LoadTripDetail) _then;

/// Create a copy of TripDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,}) {
  return _then(LoadTripDetail(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateTripDetail implements TripDetailEvent {
  const UpdateTripDetail({required this.trip});
  

 final  TripEntity trip;

/// Create a copy of TripDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTripDetailCopyWith<UpdateTripDetail> get copyWith => _$UpdateTripDetailCopyWithImpl<UpdateTripDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTripDetail&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'TripDetailEvent.updateTripDetail(trip: $trip)';
}


}

/// @nodoc
abstract mixin class $UpdateTripDetailCopyWith<$Res> implements $TripDetailEventCopyWith<$Res> {
  factory $UpdateTripDetailCopyWith(UpdateTripDetail value, $Res Function(UpdateTripDetail) _then) = _$UpdateTripDetailCopyWithImpl;
@useResult
$Res call({
 TripEntity trip
});


$TripEntityCopyWith<$Res> get trip;

}
/// @nodoc
class _$UpdateTripDetailCopyWithImpl<$Res>
    implements $UpdateTripDetailCopyWith<$Res> {
  _$UpdateTripDetailCopyWithImpl(this._self, this._then);

  final UpdateTripDetail _self;
  final $Res Function(UpdateTripDetail) _then;

/// Create a copy of TripDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,}) {
  return _then(UpdateTripDetail(
trip: null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripEntity,
  ));
}

/// Create a copy of TripDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res> get trip {
  
  return $TripEntityCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

/// @nodoc


class RefreshTripDetail implements TripDetailEvent {
  const RefreshTripDetail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTripDetail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripDetailEvent.refreshTripDetail()';
}


}




// dart format on
