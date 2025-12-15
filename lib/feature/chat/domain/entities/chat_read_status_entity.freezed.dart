// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_read_status_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatReadStatusEntity {

 int? get id; int get tripId; int get userId; int? get lastReadChatId; String? get lastReadAt;
/// Create a copy of ChatReadStatusEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatReadStatusEntityCopyWith<ChatReadStatusEntity> get copyWith => _$ChatReadStatusEntityCopyWithImpl<ChatReadStatusEntity>(this as ChatReadStatusEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatReadStatusEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,lastReadChatId,lastReadAt);

@override
String toString() {
  return 'ChatReadStatusEntity(id: $id, tripId: $tripId, userId: $userId, lastReadChatId: $lastReadChatId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ChatReadStatusEntityCopyWith<$Res>  {
  factory $ChatReadStatusEntityCopyWith(ChatReadStatusEntity value, $Res Function(ChatReadStatusEntity) _then) = _$ChatReadStatusEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int tripId, int userId, int? lastReadChatId, String? lastReadAt
});




}
/// @nodoc
class _$ChatReadStatusEntityCopyWithImpl<$Res>
    implements $ChatReadStatusEntityCopyWith<$Res> {
  _$ChatReadStatusEntityCopyWithImpl(this._self, this._then);

  final ChatReadStatusEntity _self;
  final $Res Function(ChatReadStatusEntity) _then;

/// Create a copy of ChatReadStatusEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tripId = null,Object? userId = null,Object? lastReadChatId = freezed,Object? lastReadAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,lastReadChatId: freezed == lastReadChatId ? _self.lastReadChatId : lastReadChatId // ignore: cast_nullable_to_non_nullable
as int?,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatReadStatusEntity].
extension ChatReadStatusEntityPatterns on ChatReadStatusEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatReadStatusEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatReadStatusEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatReadStatusEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatReadStatusEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatReadStatusEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatReadStatusEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int tripId,  int userId,  int? lastReadChatId,  String? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatReadStatusEntity() when $default != null:
return $default(_that.id,_that.tripId,_that.userId,_that.lastReadChatId,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int tripId,  int userId,  int? lastReadChatId,  String? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ChatReadStatusEntity():
return $default(_that.id,_that.tripId,_that.userId,_that.lastReadChatId,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int tripId,  int userId,  int? lastReadChatId,  String? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatReadStatusEntity() when $default != null:
return $default(_that.id,_that.tripId,_that.userId,_that.lastReadChatId,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChatReadStatusEntity implements ChatReadStatusEntity {
  const _ChatReadStatusEntity({this.id, required this.tripId, required this.userId, this.lastReadChatId, this.lastReadAt});
  

@override final  int? id;
@override final  int tripId;
@override final  int userId;
@override final  int? lastReadChatId;
@override final  String? lastReadAt;

/// Create a copy of ChatReadStatusEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatReadStatusEntityCopyWith<_ChatReadStatusEntity> get copyWith => __$ChatReadStatusEntityCopyWithImpl<_ChatReadStatusEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatReadStatusEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,lastReadChatId,lastReadAt);

@override
String toString() {
  return 'ChatReadStatusEntity(id: $id, tripId: $tripId, userId: $userId, lastReadChatId: $lastReadChatId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ChatReadStatusEntityCopyWith<$Res> implements $ChatReadStatusEntityCopyWith<$Res> {
  factory _$ChatReadStatusEntityCopyWith(_ChatReadStatusEntity value, $Res Function(_ChatReadStatusEntity) _then) = __$ChatReadStatusEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int tripId, int userId, int? lastReadChatId, String? lastReadAt
});




}
/// @nodoc
class __$ChatReadStatusEntityCopyWithImpl<$Res>
    implements _$ChatReadStatusEntityCopyWith<$Res> {
  __$ChatReadStatusEntityCopyWithImpl(this._self, this._then);

  final _ChatReadStatusEntity _self;
  final $Res Function(_ChatReadStatusEntity) _then;

/// Create a copy of ChatReadStatusEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tripId = null,Object? userId = null,Object? lastReadChatId = freezed,Object? lastReadAt = freezed,}) {
  return _then(_ChatReadStatusEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,lastReadChatId: freezed == lastReadChatId ? _self.lastReadChatId : lastReadChatId // ignore: cast_nullable_to_non_nullable
as int?,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
