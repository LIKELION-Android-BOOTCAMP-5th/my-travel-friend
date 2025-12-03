// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendDTO {

 int? get id;@JsonKey(name: 'user1_id') int? get userId1;@JsonKey(name: 'user2_id') int? get userId2;@JsonKey(name: 'create_at') String? get createdAt;
/// Create a copy of FriendDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendDTOCopyWith<FriendDTO> get copyWith => _$FriendDTOCopyWithImpl<FriendDTO>(this as FriendDTO, _$identity);

  /// Serializes this FriendDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId1, userId1) || other.userId1 == userId1)&&(identical(other.userId2, userId2) || other.userId2 == userId2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId1,userId2,createdAt);

@override
String toString() {
  return 'FriendDTO(id: $id, userId1: $userId1, userId2: $userId2, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FriendDTOCopyWith<$Res>  {
  factory $FriendDTOCopyWith(FriendDTO value, $Res Function(FriendDTO) _then) = _$FriendDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'user1_id') int? userId1,@JsonKey(name: 'user2_id') int? userId2,@JsonKey(name: 'create_at') String? createdAt
});




}
/// @nodoc
class _$FriendDTOCopyWithImpl<$Res>
    implements $FriendDTOCopyWith<$Res> {
  _$FriendDTOCopyWithImpl(this._self, this._then);

  final FriendDTO _self;
  final $Res Function(FriendDTO) _then;

/// Create a copy of FriendDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId1 = freezed,Object? userId2 = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId1: freezed == userId1 ? _self.userId1 : userId1 // ignore: cast_nullable_to_non_nullable
as int?,userId2: freezed == userId2 ? _self.userId2 : userId2 // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendDTO].
extension FriendDTOPatterns on FriendDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendDTO value)  $default,){
final _that = this;
switch (_that) {
case _FriendDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendDTO value)?  $default,){
final _that = this;
switch (_that) {
case _FriendDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user1_id')  int? userId1, @JsonKey(name: 'user2_id')  int? userId2, @JsonKey(name: 'create_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendDTO() when $default != null:
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user1_id')  int? userId1, @JsonKey(name: 'user2_id')  int? userId2, @JsonKey(name: 'create_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FriendDTO():
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'user1_id')  int? userId1, @JsonKey(name: 'user2_id')  int? userId2, @JsonKey(name: 'create_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FriendDTO() when $default != null:
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendDTO extends FriendDTO {
  const _FriendDTO({this.id, @JsonKey(name: 'user1_id') this.userId1, @JsonKey(name: 'user2_id') this.userId2, @JsonKey(name: 'create_at') this.createdAt}): super._();
  factory _FriendDTO.fromJson(Map<String, dynamic> json) => _$FriendDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'user1_id') final  int? userId1;
@override@JsonKey(name: 'user2_id') final  int? userId2;
@override@JsonKey(name: 'create_at') final  String? createdAt;

/// Create a copy of FriendDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendDTOCopyWith<_FriendDTO> get copyWith => __$FriendDTOCopyWithImpl<_FriendDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId1, userId1) || other.userId1 == userId1)&&(identical(other.userId2, userId2) || other.userId2 == userId2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId1,userId2,createdAt);

@override
String toString() {
  return 'FriendDTO(id: $id, userId1: $userId1, userId2: $userId2, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FriendDTOCopyWith<$Res> implements $FriendDTOCopyWith<$Res> {
  factory _$FriendDTOCopyWith(_FriendDTO value, $Res Function(_FriendDTO) _then) = __$FriendDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'user1_id') int? userId1,@JsonKey(name: 'user2_id') int? userId2,@JsonKey(name: 'create_at') String? createdAt
});




}
/// @nodoc
class __$FriendDTOCopyWithImpl<$Res>
    implements _$FriendDTOCopyWith<$Res> {
  __$FriendDTOCopyWithImpl(this._self, this._then);

  final _FriendDTO _self;
  final $Res Function(_FriendDTO) _then;

/// Create a copy of FriendDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId1 = freezed,Object? userId2 = freezed,Object? createdAt = freezed,}) {
  return _then(_FriendDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId1: freezed == userId1 ? _self.userId1 : userId1 // ignore: cast_nullable_to_non_nullable
as int?,userId2: freezed == userId2 ? _self.userId2 : userId2 // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
