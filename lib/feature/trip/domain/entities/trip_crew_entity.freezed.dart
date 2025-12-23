// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_crew_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripCrewEntity {

 int? get tripId; int? get memberId;
/// Create a copy of TripCrewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCrewEntityCopyWith<TripCrewEntity> get copyWith => _$TripCrewEntityCopyWithImpl<TripCrewEntity>(this as TripCrewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripCrewEntity&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,memberId);

@override
String toString() {
  return 'TripCrewEntity(tripId: $tripId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class $TripCrewEntityCopyWith<$Res>  {
  factory $TripCrewEntityCopyWith(TripCrewEntity value, $Res Function(TripCrewEntity) _then) = _$TripCrewEntityCopyWithImpl;
@useResult
$Res call({
 int? tripId, int? memberId
});




}
/// @nodoc
class _$TripCrewEntityCopyWithImpl<$Res>
    implements $TripCrewEntityCopyWith<$Res> {
  _$TripCrewEntityCopyWithImpl(this._self, this._then);

  final TripCrewEntity _self;
  final $Res Function(TripCrewEntity) _then;

/// Create a copy of TripCrewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? memberId = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripCrewEntity].
extension TripCrewEntityPatterns on TripCrewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripCrewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripCrewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripCrewEntity value)  $default,){
final _that = this;
switch (_that) {
case _TripCrewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripCrewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TripCrewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tripId,  int? memberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripCrewEntity() when $default != null:
return $default(_that.tripId,_that.memberId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tripId,  int? memberId)  $default,) {final _that = this;
switch (_that) {
case _TripCrewEntity():
return $default(_that.tripId,_that.memberId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tripId,  int? memberId)?  $default,) {final _that = this;
switch (_that) {
case _TripCrewEntity() when $default != null:
return $default(_that.tripId,_that.memberId);case _:
  return null;

}
}

}

/// @nodoc


class _TripCrewEntity implements TripCrewEntity {
  const _TripCrewEntity({this.tripId, this.memberId});
  

@override final  int? tripId;
@override final  int? memberId;

/// Create a copy of TripCrewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCrewEntityCopyWith<_TripCrewEntity> get copyWith => __$TripCrewEntityCopyWithImpl<_TripCrewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripCrewEntity&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,memberId);

@override
String toString() {
  return 'TripCrewEntity(tripId: $tripId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class _$TripCrewEntityCopyWith<$Res> implements $TripCrewEntityCopyWith<$Res> {
  factory _$TripCrewEntityCopyWith(_TripCrewEntity value, $Res Function(_TripCrewEntity) _then) = __$TripCrewEntityCopyWithImpl;
@override @useResult
$Res call({
 int? tripId, int? memberId
});




}
/// @nodoc
class __$TripCrewEntityCopyWithImpl<$Res>
    implements _$TripCrewEntityCopyWith<$Res> {
  __$TripCrewEntityCopyWithImpl(this._self, this._then);

  final _TripCrewEntity _self;
  final $Res Function(_TripCrewEntity) _then;

/// Create a copy of TripCrewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? memberId = freezed,}) {
  return _then(_TripCrewEntity(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
