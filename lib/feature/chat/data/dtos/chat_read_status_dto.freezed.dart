// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_read_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatReadStatusDTO {

 int? get id;@JsonKey(name: 'trip_id') int get tripId;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'last_read_chat_id') int? get lastReadChatId;@JsonKey(name: 'last_read_at') String? get lastReadAt;
/// Create a copy of ChatReadStatusDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatReadStatusDTOCopyWith<ChatReadStatusDTO> get copyWith => _$ChatReadStatusDTOCopyWithImpl<ChatReadStatusDTO>(this as ChatReadStatusDTO, _$identity);

  /// Serializes this ChatReadStatusDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatReadStatusDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,lastReadChatId,lastReadAt);

@override
String toString() {
  return 'ChatReadStatusDTO(id: $id, tripId: $tripId, userId: $userId, lastReadChatId: $lastReadChatId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ChatReadStatusDTOCopyWith<$Res>  {
  factory $ChatReadStatusDTOCopyWith(ChatReadStatusDTO value, $Res Function(ChatReadStatusDTO) _then) = _$ChatReadStatusDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'last_read_chat_id') int? lastReadChatId,@JsonKey(name: 'last_read_at') String? lastReadAt
});




}
/// @nodoc
class _$ChatReadStatusDTOCopyWithImpl<$Res>
    implements $ChatReadStatusDTOCopyWith<$Res> {
  _$ChatReadStatusDTOCopyWithImpl(this._self, this._then);

  final ChatReadStatusDTO _self;
  final $Res Function(ChatReadStatusDTO) _then;

/// Create a copy of ChatReadStatusDTO
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


/// Adds pattern-matching-related methods to [ChatReadStatusDTO].
extension ChatReadStatusDTOPatterns on ChatReadStatusDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatReadStatusDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatReadStatusDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatReadStatusDTO value)  $default,){
final _that = this;
switch (_that) {
case _ChatReadStatusDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatReadStatusDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ChatReadStatusDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'last_read_chat_id')  int? lastReadChatId, @JsonKey(name: 'last_read_at')  String? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatReadStatusDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'last_read_chat_id')  int? lastReadChatId, @JsonKey(name: 'last_read_at')  String? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ChatReadStatusDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'last_read_chat_id')  int? lastReadChatId, @JsonKey(name: 'last_read_at')  String? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatReadStatusDTO() when $default != null:
return $default(_that.id,_that.tripId,_that.userId,_that.lastReadChatId,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatReadStatusDTO extends ChatReadStatusDTO {
  const _ChatReadStatusDTO({this.id, @JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'last_read_chat_id') this.lastReadChatId, @JsonKey(name: 'last_read_at') this.lastReadAt}): super._();
  factory _ChatReadStatusDTO.fromJson(Map<String, dynamic> json) => _$ChatReadStatusDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'trip_id') final  int tripId;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'last_read_chat_id') final  int? lastReadChatId;
@override@JsonKey(name: 'last_read_at') final  String? lastReadAt;

/// Create a copy of ChatReadStatusDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatReadStatusDTOCopyWith<_ChatReadStatusDTO> get copyWith => __$ChatReadStatusDTOCopyWithImpl<_ChatReadStatusDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatReadStatusDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatReadStatusDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,lastReadChatId,lastReadAt);

@override
String toString() {
  return 'ChatReadStatusDTO(id: $id, tripId: $tripId, userId: $userId, lastReadChatId: $lastReadChatId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ChatReadStatusDTOCopyWith<$Res> implements $ChatReadStatusDTOCopyWith<$Res> {
  factory _$ChatReadStatusDTOCopyWith(_ChatReadStatusDTO value, $Res Function(_ChatReadStatusDTO) _then) = __$ChatReadStatusDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'last_read_chat_id') int? lastReadChatId,@JsonKey(name: 'last_read_at') String? lastReadAt
});




}
/// @nodoc
class __$ChatReadStatusDTOCopyWithImpl<$Res>
    implements _$ChatReadStatusDTOCopyWith<$Res> {
  __$ChatReadStatusDTOCopyWithImpl(this._self, this._then);

  final _ChatReadStatusDTO _self;
  final $Res Function(_ChatReadStatusDTO) _then;

/// Create a copy of ChatReadStatusDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tripId = null,Object? userId = null,Object? lastReadChatId = freezed,Object? lastReadAt = freezed,}) {
  return _then(_ChatReadStatusDTO(
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
