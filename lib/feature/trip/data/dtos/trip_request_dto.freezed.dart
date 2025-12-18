// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripRequestDto {

 int? get id;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'request_id') int get requestId;@JsonKey(name: 'target_id') int get targetId;@JsonKey(name: 'trip_id') int? get tripId;@JsonKey(name: 'answered_at') String? get answeredAt;
/// Create a copy of TripRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripRequestDtoCopyWith<TripRequestDto> get copyWith => _$TripRequestDtoCopyWithImpl<TripRequestDto>(this as TripRequestDto, _$identity);

  /// Serializes this TripRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,requestId,targetId,tripId,answeredAt);

@override
String toString() {
  return 'TripRequestDto(id: $id, createdAt: $createdAt, requestId: $requestId, targetId: $targetId, tripId: $tripId, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class $TripRequestDtoCopyWith<$Res>  {
  factory $TripRequestDtoCopyWith(TripRequestDto value, $Res Function(TripRequestDto) _then) = _$TripRequestDtoCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'trip_id') int? tripId,@JsonKey(name: 'answered_at') String? answeredAt
});




}
/// @nodoc
class _$TripRequestDtoCopyWithImpl<$Res>
    implements $TripRequestDtoCopyWith<$Res> {
  _$TripRequestDtoCopyWithImpl(this._self, this._then);

  final TripRequestDto _self;
  final $Res Function(TripRequestDto) _then;

/// Create a copy of TripRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? requestId = null,Object? targetId = null,Object? tripId = freezed,Object? answeredAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripRequestDto].
extension TripRequestDtoPatterns on TripRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _TripRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _TripRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'answered_at')  String? answeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripRequestDto() when $default != null:
return $default(_that.id,_that.createdAt,_that.requestId,_that.targetId,_that.tripId,_that.answeredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'answered_at')  String? answeredAt)  $default,) {final _that = this;
switch (_that) {
case _TripRequestDto():
return $default(_that.id,_that.createdAt,_that.requestId,_that.targetId,_that.tripId,_that.answeredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'trip_id')  int? tripId, @JsonKey(name: 'answered_at')  String? answeredAt)?  $default,) {final _that = this;
switch (_that) {
case _TripRequestDto() when $default != null:
return $default(_that.id,_that.createdAt,_that.requestId,_that.targetId,_that.tripId,_that.answeredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripRequestDto extends TripRequestDto {
  const _TripRequestDto({this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'target_id') required this.targetId, @JsonKey(name: 'trip_id') this.tripId, @JsonKey(name: 'answered_at') this.answeredAt}): super._();
  factory _TripRequestDto.fromJson(Map<String, dynamic> json) => _$TripRequestDtoFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'request_id') final  int requestId;
@override@JsonKey(name: 'target_id') final  int targetId;
@override@JsonKey(name: 'trip_id') final  int? tripId;
@override@JsonKey(name: 'answered_at') final  String? answeredAt;

/// Create a copy of TripRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripRequestDtoCopyWith<_TripRequestDto> get copyWith => __$TripRequestDtoCopyWithImpl<_TripRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,requestId,targetId,tripId,answeredAt);

@override
String toString() {
  return 'TripRequestDto(id: $id, createdAt: $createdAt, requestId: $requestId, targetId: $targetId, tripId: $tripId, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class _$TripRequestDtoCopyWith<$Res> implements $TripRequestDtoCopyWith<$Res> {
  factory _$TripRequestDtoCopyWith(_TripRequestDto value, $Res Function(_TripRequestDto) _then) = __$TripRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'trip_id') int? tripId,@JsonKey(name: 'answered_at') String? answeredAt
});




}
/// @nodoc
class __$TripRequestDtoCopyWithImpl<$Res>
    implements _$TripRequestDtoCopyWith<$Res> {
  __$TripRequestDtoCopyWithImpl(this._self, this._then);

  final _TripRequestDto _self;
  final $Res Function(_TripRequestDto) _then;

/// Create a copy of TripRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? requestId = null,Object? targetId = null,Object? tripId = freezed,Object? answeredAt = freezed,}) {
  return _then(_TripRequestDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
