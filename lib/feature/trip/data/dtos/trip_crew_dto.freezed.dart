// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_crew_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripCrewDTO {

@JsonKey(name: 'trip_id') int? get tripId;@JsonKey(name: 'member_id') int? get memberId;
/// Create a copy of TripCrewDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCrewDTOCopyWith<TripCrewDTO> get copyWith => _$TripCrewDTOCopyWithImpl<TripCrewDTO>(this as TripCrewDTO, _$identity);

  /// Serializes this TripCrewDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripCrewDTO&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,memberId);

@override
String toString() {
  return 'TripCrewDTO(tripId: $tripId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class $TripCrewDTOCopyWith<$Res>  {
  factory $TripCrewDTOCopyWith(TripCrewDTO value, $Res Function(TripCrewDTO) _then) = _$TripCrewDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'trip_id') int? tripId,@JsonKey(name: 'member_id') int? memberId
});




}
/// @nodoc
class _$TripCrewDTOCopyWithImpl<$Res>
    implements $TripCrewDTOCopyWith<$Res> {
  _$TripCrewDTOCopyWithImpl(this._self, this._then);

  final TripCrewDTO _self;
  final $Res Function(TripCrewDTO) _then;

/// Create a copy of TripCrewDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? memberId = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripCrewDTO].
extension TripCrewDTOPatterns on TripCrewDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripCrewDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripCrewDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripCrewDTO value)  $default,){
final _that = this;
switch (_that) {
case _TripCrewDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripCrewDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TripCrewDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'member_id')  int? memberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripCrewDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'member_id')  int? memberId)  $default,) {final _that = this;
switch (_that) {
case _TripCrewDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'member_id')  int? memberId)?  $default,) {final _that = this;
switch (_that) {
case _TripCrewDTO() when $default != null:
return $default(_that.tripId,_that.memberId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripCrewDTO extends TripCrewDTO {
  const _TripCrewDTO({@JsonKey(name: 'trip_id') this.tripId, @JsonKey(name: 'member_id') this.memberId}): super._();
  factory _TripCrewDTO.fromJson(Map<String, dynamic> json) => _$TripCrewDTOFromJson(json);

@override@JsonKey(name: 'trip_id') final  int? tripId;
@override@JsonKey(name: 'member_id') final  int? memberId;

/// Create a copy of TripCrewDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCrewDTOCopyWith<_TripCrewDTO> get copyWith => __$TripCrewDTOCopyWithImpl<_TripCrewDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripCrewDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripCrewDTO&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,memberId);

@override
String toString() {
  return 'TripCrewDTO(tripId: $tripId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class _$TripCrewDTOCopyWith<$Res> implements $TripCrewDTOCopyWith<$Res> {
  factory _$TripCrewDTOCopyWith(_TripCrewDTO value, $Res Function(_TripCrewDTO) _then) = __$TripCrewDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'trip_id') int? tripId,@JsonKey(name: 'member_id') int? memberId
});




}
/// @nodoc
class __$TripCrewDTOCopyWithImpl<$Res>
    implements _$TripCrewDTOCopyWith<$Res> {
  __$TripCrewDTOCopyWithImpl(this._self, this._then);

  final _TripCrewDTO _self;
  final $Res Function(_TripCrewDTO) _then;

/// Create a copy of TripCrewDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? memberId = freezed,}) {
  return _then(_TripCrewDTO(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
