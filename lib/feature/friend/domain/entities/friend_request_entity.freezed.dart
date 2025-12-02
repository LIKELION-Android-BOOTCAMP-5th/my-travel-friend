// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendRequestEntity {

 int? get id;// 친구 관계 id
 int get requestId;// 요청한 친구
 int get targetId;// 받은 친구
 String? get answeredAt;// 친구 수락 시점
 String? get createdAt;
/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestEntityCopyWith<FriendRequestEntity> get copyWith => _$FriendRequestEntityCopyWithImpl<FriendRequestEntity>(this as FriendRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,answeredAt,createdAt);

@override
String toString() {
  return 'FriendRequestEntity(id: $id, requestId: $requestId, targetId: $targetId, answeredAt: $answeredAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FriendRequestEntityCopyWith<$Res>  {
  factory $FriendRequestEntityCopyWith(FriendRequestEntity value, $Res Function(FriendRequestEntity) _then) = _$FriendRequestEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int requestId, int targetId, String? answeredAt, String? createdAt
});




}
/// @nodoc
class _$FriendRequestEntityCopyWithImpl<$Res>
    implements $FriendRequestEntityCopyWith<$Res> {
  _$FriendRequestEntityCopyWithImpl(this._self, this._then);

  final FriendRequestEntity _self;
  final $Res Function(FriendRequestEntity) _then;

/// Create a copy of FriendRequestEntity
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


/// Adds pattern-matching-related methods to [FriendRequestEntity].
extension FriendRequestEntityPatterns on FriendRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int requestId,  int targetId,  String? answeredAt,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int requestId,  int targetId,  String? answeredAt,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int requestId,  int targetId,  String? answeredAt,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
return $default(_that.id,_that.requestId,_that.targetId,_that.answeredAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FriendRequestEntity implements FriendRequestEntity {
  const _FriendRequestEntity({this.id, required this.requestId, required this.targetId, this.answeredAt, this.createdAt});
  

@override final  int? id;
// 친구 관계 id
@override final  int requestId;
// 요청한 친구
@override final  int targetId;
// 받은 친구
@override final  String? answeredAt;
// 친구 수락 시점
@override final  String? createdAt;

/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestEntityCopyWith<_FriendRequestEntity> get copyWith => __$FriendRequestEntityCopyWithImpl<_FriendRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,requestId,targetId,answeredAt,createdAt);

@override
String toString() {
  return 'FriendRequestEntity(id: $id, requestId: $requestId, targetId: $targetId, answeredAt: $answeredAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestEntityCopyWith<$Res> implements $FriendRequestEntityCopyWith<$Res> {
  factory _$FriendRequestEntityCopyWith(_FriendRequestEntity value, $Res Function(_FriendRequestEntity) _then) = __$FriendRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int requestId, int targetId, String? answeredAt, String? createdAt
});




}
/// @nodoc
class __$FriendRequestEntityCopyWithImpl<$Res>
    implements _$FriendRequestEntityCopyWith<$Res> {
  __$FriendRequestEntityCopyWithImpl(this._self, this._then);

  final _FriendRequestEntity _self;
  final $Res Function(_FriendRequestEntity) _then;

/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? requestId = null,Object? targetId = null,Object? answeredAt = freezed,Object? createdAt = freezed,}) {
  return _then(_FriendRequestEntity(
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
