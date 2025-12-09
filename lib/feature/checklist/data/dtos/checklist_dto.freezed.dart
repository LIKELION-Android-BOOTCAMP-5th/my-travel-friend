// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistDTO {

 int get id;@JsonKey(name: 'trip_id') int get tripId;@JsonKey(name: 'user_id') int get userId; String get content;@JsonKey(name: 'is_checked') bool get isChecked;
/// Create a copy of ChecklistDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistDTOCopyWith<ChecklistDTO> get copyWith => _$ChecklistDTOCopyWithImpl<ChecklistDTO>(this as ChecklistDTO, _$identity);

  /// Serializes this ChecklistDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,content,isChecked);

@override
String toString() {
  return 'ChecklistDTO(id: $id, tripId: $tripId, userId: $userId, content: $content, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class $ChecklistDTOCopyWith<$Res>  {
  factory $ChecklistDTOCopyWith(ChecklistDTO value, $Res Function(ChecklistDTO) _then) = _$ChecklistDTOCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId, String content,@JsonKey(name: 'is_checked') bool isChecked
});




}
/// @nodoc
class _$ChecklistDTOCopyWithImpl<$Res>
    implements $ChecklistDTOCopyWith<$Res> {
  _$ChecklistDTOCopyWithImpl(this._self, this._then);

  final ChecklistDTO _self;
  final $Res Function(ChecklistDTO) _then;

/// Create a copy of ChecklistDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? userId = null,Object? content = null,Object? isChecked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistDTO].
extension ChecklistDTOPatterns on ChecklistDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistDTO value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId,  String content, @JsonKey(name: 'is_checked')  bool isChecked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistDTO() when $default != null:
return $default(_that.id,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId,  String content, @JsonKey(name: 'is_checked')  bool isChecked)  $default,) {final _that = this;
switch (_that) {
case _ChecklistDTO():
return $default(_that.id,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId,  String content, @JsonKey(name: 'is_checked')  bool isChecked)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistDTO() when $default != null:
return $default(_that.id,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistDTO extends ChecklistDTO {
  const _ChecklistDTO({required this.id, @JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'user_id') required this.userId, required this.content, @JsonKey(name: 'is_checked') required this.isChecked}): super._();
  factory _ChecklistDTO.fromJson(Map<String, dynamic> json) => _$ChecklistDTOFromJson(json);

@override final  int id;
@override@JsonKey(name: 'trip_id') final  int tripId;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String content;
@override@JsonKey(name: 'is_checked') final  bool isChecked;

/// Create a copy of ChecklistDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistDTOCopyWith<_ChecklistDTO> get copyWith => __$ChecklistDTOCopyWithImpl<_ChecklistDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tripId,userId,content,isChecked);

@override
String toString() {
  return 'ChecklistDTO(id: $id, tripId: $tripId, userId: $userId, content: $content, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class _$ChecklistDTOCopyWith<$Res> implements $ChecklistDTOCopyWith<$Res> {
  factory _$ChecklistDTOCopyWith(_ChecklistDTO value, $Res Function(_ChecklistDTO) _then) = __$ChecklistDTOCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId, String content,@JsonKey(name: 'is_checked') bool isChecked
});




}
/// @nodoc
class __$ChecklistDTOCopyWithImpl<$Res>
    implements _$ChecklistDTOCopyWith<$Res> {
  __$ChecklistDTOCopyWithImpl(this._self, this._then);

  final _ChecklistDTO _self;
  final $Res Function(_ChecklistDTO) _then;

/// Create a copy of ChecklistDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? userId = null,Object? content = null,Object? isChecked = null,}) {
  return _then(_ChecklistDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
