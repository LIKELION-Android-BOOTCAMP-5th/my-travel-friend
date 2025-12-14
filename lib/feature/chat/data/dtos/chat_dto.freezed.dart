// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDTO {

 int? get id;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'trip_id') int get tripId;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'content') String get message;
/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDTOCopyWith<ChatDTO> get copyWith => _$ChatDTOCopyWithImpl<ChatDTO>(this as ChatDTO, _$identity);

  /// Serializes this ChatDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,message);

@override
String toString() {
  return 'ChatDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatDTOCopyWith<$Res>  {
  factory $ChatDTOCopyWith(ChatDTO value, $Res Function(ChatDTO) _then) = _$ChatDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'content') String message
});




}
/// @nodoc
class _$ChatDTOCopyWithImpl<$Res>
    implements $ChatDTOCopyWith<$Res> {
  _$ChatDTOCopyWithImpl(this._self, this._then);

  final ChatDTO _self;
  final $Res Function(ChatDTO) _then;

/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? message = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatDTO].
extension ChatDTOPatterns on ChatDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDTO value)  $default,){
final _that = this;
switch (_that) {
case _ChatDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String message)  $default,) {final _that = this;
switch (_that) {
case _ChatDTO():
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String message)?  $default,) {final _that = this;
switch (_that) {
case _ChatDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatDTO extends ChatDTO {
  const _ChatDTO({this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'content') required this.message}): super._();
  factory _ChatDTO.fromJson(Map<String, dynamic> json) => _$ChatDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'trip_id') final  int tripId;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'content') final  String message;

/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDTOCopyWith<_ChatDTO> get copyWith => __$ChatDTOCopyWithImpl<_ChatDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,message);

@override
String toString() {
  return 'ChatDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ChatDTOCopyWith<$Res> implements $ChatDTOCopyWith<$Res> {
  factory _$ChatDTOCopyWith(_ChatDTO value, $Res Function(_ChatDTO) _then) = __$ChatDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'content') String message
});




}
/// @nodoc
class __$ChatDTOCopyWithImpl<$Res>
    implements _$ChatDTOCopyWith<$Res> {
  __$ChatDTOCopyWithImpl(this._self, this._then);

  final _ChatDTO _self;
  final $Res Function(_ChatDTO) _then;

/// Create a copy of ChatDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? message = null,}) {
  return _then(_ChatDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
