// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripRequestEntity {

 int? get id; String? get createdAt; int get requestId; int get targetId; int? get tripId; String? get answeredAt;
/// Create a copy of TripRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripRequestEntityCopyWith<TripRequestEntity> get copyWith => _$TripRequestEntityCopyWithImpl<TripRequestEntity>(this as TripRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,requestId,targetId,tripId,answeredAt);

@override
String toString() {
  return 'TripRequestEntity(id: $id, createdAt: $createdAt, requestId: $requestId, targetId: $targetId, tripId: $tripId, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class $TripRequestEntityCopyWith<$Res>  {
  factory $TripRequestEntityCopyWith(TripRequestEntity value, $Res Function(TripRequestEntity) _then) = _$TripRequestEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, int requestId, int targetId, int? tripId, String? answeredAt
});




}
/// @nodoc
class _$TripRequestEntityCopyWithImpl<$Res>
    implements $TripRequestEntityCopyWith<$Res> {
  _$TripRequestEntityCopyWithImpl(this._self, this._then);

  final TripRequestEntity _self;
  final $Res Function(TripRequestEntity) _then;

/// Create a copy of TripRequestEntity
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


/// Adds pattern-matching-related methods to [TripRequestEntity].
extension TripRequestEntityPatterns on TripRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _TripRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TripRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int requestId,  int targetId,  int? tripId,  String? answeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripRequestEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int requestId,  int targetId,  int? tripId,  String? answeredAt)  $default,) {final _that = this;
switch (_that) {
case _TripRequestEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  int requestId,  int targetId,  int? tripId,  String? answeredAt)?  $default,) {final _that = this;
switch (_that) {
case _TripRequestEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.requestId,_that.targetId,_that.tripId,_that.answeredAt);case _:
  return null;

}
}

}

/// @nodoc


class _TripRequestEntity implements TripRequestEntity {
  const _TripRequestEntity({this.id, this.createdAt, required this.requestId, required this.targetId, this.tripId, this.answeredAt});
  

@override final  int? id;
@override final  String? createdAt;
@override final  int requestId;
@override final  int targetId;
@override final  int? tripId;
@override final  String? answeredAt;

/// Create a copy of TripRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripRequestEntityCopyWith<_TripRequestEntity> get copyWith => __$TripRequestEntityCopyWithImpl<_TripRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,requestId,targetId,tripId,answeredAt);

@override
String toString() {
  return 'TripRequestEntity(id: $id, createdAt: $createdAt, requestId: $requestId, targetId: $targetId, tripId: $tripId, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class _$TripRequestEntityCopyWith<$Res> implements $TripRequestEntityCopyWith<$Res> {
  factory _$TripRequestEntityCopyWith(_TripRequestEntity value, $Res Function(_TripRequestEntity) _then) = __$TripRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, int requestId, int targetId, int? tripId, String? answeredAt
});




}
/// @nodoc
class __$TripRequestEntityCopyWithImpl<$Res>
    implements _$TripRequestEntityCopyWith<$Res> {
  __$TripRequestEntityCopyWithImpl(this._self, this._then);

  final _TripRequestEntity _self;
  final $Res Function(_TripRequestEntity) _then;

/// Create a copy of TripRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? requestId = null,Object? targetId = null,Object? tripId = freezed,Object? answeredAt = freezed,}) {
  return _then(_TripRequestEntity(
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
