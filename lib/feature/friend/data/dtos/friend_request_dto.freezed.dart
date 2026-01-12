// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendRequestDTO {

 int? get id;@JsonKey(name: 'request_id') int get requestId;@JsonKey(name: 'target_id') int get targetId;@JsonKey(name: 'answered_at') String? get answeredAt;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of FriendRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestDTOCopyWith<FriendRequestDTO> get copyWith => _$FriendRequestDTOCopyWithImpl<FriendRequestDTO>(this as FriendRequestDTO, _$identity);

  /// Serializes this FriendRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,answeredAt,createdAt);

@override
String toString() {
  return 'FriendRequestDTO(id: $id, requestId: $requestId, targetId: $targetId, answeredAt: $answeredAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FriendRequestDTOCopyWith<$Res>  {
  factory $FriendRequestDTOCopyWith(FriendRequestDTO value, $Res Function(FriendRequestDTO) _then) = _$FriendRequestDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'answered_at') String? answeredAt,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$FriendRequestDTOCopyWithImpl<$Res>
    implements $FriendRequestDTOCopyWith<$Res> {
  _$FriendRequestDTOCopyWithImpl(this._self, this._then);

  final FriendRequestDTO _self;
  final $Res Function(FriendRequestDTO) _then;

/// Create a copy of FriendRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? requestId = null,Object? targetId = null,Object? answeredAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRequestDTO].
extension FriendRequestDTOPatterns on FriendRequestDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestDTO value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestDTO value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'answered_at')  String? answeredAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestDTO() when $default != null:
return $default(_that.id,_that.requestId,_that.targetId,_that.answeredAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'answered_at')  String? answeredAt, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestDTO():
return $default(_that.id,_that.requestId,_that.targetId,_that.answeredAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'answered_at')  String? answeredAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestDTO() when $default != null:
return $default(_that.id,_that.requestId,_that.targetId,_that.answeredAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendRequestDTO extends FriendRequestDTO {
  const _FriendRequestDTO({this.id, @JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'target_id') required this.targetId, @JsonKey(name: 'answered_at') this.answeredAt, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _FriendRequestDTO.fromJson(Map<String, dynamic> json) => _$FriendRequestDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'request_id') final  int requestId;
@override@JsonKey(name: 'target_id') final  int targetId;
@override@JsonKey(name: 'answered_at') final  String? answeredAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of FriendRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestDTOCopyWith<_FriendRequestDTO> get copyWith => __$FriendRequestDTOCopyWithImpl<_FriendRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,answeredAt,createdAt);

@override
String toString() {
  return 'FriendRequestDTO(id: $id, requestId: $requestId, targetId: $targetId, answeredAt: $answeredAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestDTOCopyWith<$Res> implements $FriendRequestDTOCopyWith<$Res> {
  factory _$FriendRequestDTOCopyWith(_FriendRequestDTO value, $Res Function(_FriendRequestDTO) _then) = __$FriendRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'answered_at') String? answeredAt,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$FriendRequestDTOCopyWithImpl<$Res>
    implements _$FriendRequestDTOCopyWith<$Res> {
  __$FriendRequestDTOCopyWithImpl(this._self, this._then);

  final _FriendRequestDTO _self;
  final $Res Function(_FriendRequestDTO) _then;

/// Create a copy of FriendRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? requestId = null,Object? targetId = null,Object? answeredAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FriendRequestDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
