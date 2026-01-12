// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmEntity {

 int? get id; String? get createdAt; int get userId; String get type; String get content; bool get isChecked; Map<String, dynamic>? get data;
/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<AlarmEntity> get copyWith => _$AlarmEntityCopyWithImpl<AlarmEntity>(this as AlarmEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,userId,type,content,isChecked,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AlarmEntity(id: $id, createdAt: $createdAt, userId: $userId, type: $type, content: $content, isChecked: $isChecked, data: $data)';
}


}

/// @nodoc
abstract mixin class $AlarmEntityCopyWith<$Res>  {
  factory $AlarmEntityCopyWith(AlarmEntity value, $Res Function(AlarmEntity) _then) = _$AlarmEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, int userId, String type, String content, bool isChecked, Map<String, dynamic>? data
});




}
/// @nodoc
class _$AlarmEntityCopyWithImpl<$Res>
    implements $AlarmEntityCopyWith<$Res> {
  _$AlarmEntityCopyWithImpl(this._self, this._then);

  final AlarmEntity _self;
  final $Res Function(AlarmEntity) _then;

/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? userId = null,Object? type = null,Object? content = null,Object? isChecked = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmEntity].
extension AlarmEntityPatterns on AlarmEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmEntity value)  $default,){
final _that = this;
switch (_that) {
case _AlarmEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int userId,  String type,  String content,  bool isChecked,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.userId,_that.type,_that.content,_that.isChecked,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int userId,  String type,  String content,  bool isChecked,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _AlarmEntity():
return $default(_that.id,_that.createdAt,_that.userId,_that.type,_that.content,_that.isChecked,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  int userId,  String type,  String content,  bool isChecked,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _AlarmEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.userId,_that.type,_that.content,_that.isChecked,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmEntity implements AlarmEntity {
  const _AlarmEntity({this.id, this.createdAt, required this.userId, required this.type, required this.content, required this.isChecked, required final  Map<String, dynamic>? data}): _data = data;
  

@override final  int? id;
@override final  String? createdAt;
@override final  int userId;
@override final  String type;
@override final  String content;
@override final  bool isChecked;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmEntityCopyWith<_AlarmEntity> get copyWith => __$AlarmEntityCopyWithImpl<_AlarmEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,userId,type,content,isChecked,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AlarmEntity(id: $id, createdAt: $createdAt, userId: $userId, type: $type, content: $content, isChecked: $isChecked, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AlarmEntityCopyWith<$Res> implements $AlarmEntityCopyWith<$Res> {
  factory _$AlarmEntityCopyWith(_AlarmEntity value, $Res Function(_AlarmEntity) _then) = __$AlarmEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, int userId, String type, String content, bool isChecked, Map<String, dynamic>? data
});




}
/// @nodoc
class __$AlarmEntityCopyWithImpl<$Res>
    implements _$AlarmEntityCopyWith<$Res> {
  __$AlarmEntityCopyWithImpl(this._self, this._then);

  final _AlarmEntity _self;
  final $Res Function(_AlarmEntity) _then;

/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? userId = null,Object? type = null,Object? content = null,Object? isChecked = null,Object? data = freezed,}) {
  return _then(_AlarmEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
