// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoListEntity {

 int? get id; String? get createdAt; int get tripId; int get userId; String get content; bool get isChecked;
/// Create a copy of TodoListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListEntityCopyWith<TodoListEntity> get copyWith => _$TodoListEntityCopyWithImpl<TodoListEntity>(this as TodoListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,content,isChecked);

@override
String toString() {
  return 'TodoListEntity(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, content: $content, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class $TodoListEntityCopyWith<$Res>  {
  factory $TodoListEntityCopyWith(TodoListEntity value, $Res Function(TodoListEntity) _then) = _$TodoListEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, int tripId, int userId, String content, bool isChecked
});




}
/// @nodoc
class _$TodoListEntityCopyWithImpl<$Res>
    implements $TodoListEntityCopyWith<$Res> {
  _$TodoListEntityCopyWithImpl(this._self, this._then);

  final TodoListEntity _self;
  final $Res Function(TodoListEntity) _then;

/// Create a copy of TodoListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? content = null,Object? isChecked = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListEntity].
extension TodoListEntityPatterns on TodoListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListEntity value)  $default,){
final _that = this;
switch (_that) {
case _TodoListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int tripId,  int userId,  String content,  bool isChecked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int tripId,  int userId,  String content,  bool isChecked)  $default,) {final _that = this;
switch (_that) {
case _TodoListEntity():
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  int tripId,  int userId,  String content,  bool isChecked)?  $default,) {final _that = this;
switch (_that) {
case _TodoListEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.content,_that.isChecked);case _:
  return null;

}
}

}

/// @nodoc


class _TodoListEntity implements TodoListEntity {
  const _TodoListEntity({this.id, this.createdAt, required this.tripId, required this.userId, required this.content, required this.isChecked});
  

@override final  int? id;
@override final  String? createdAt;
@override final  int tripId;
@override final  int userId;
@override final  String content;
@override final  bool isChecked;

/// Create a copy of TodoListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListEntityCopyWith<_TodoListEntity> get copyWith => __$TodoListEntityCopyWithImpl<_TodoListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,content,isChecked);

@override
String toString() {
  return 'TodoListEntity(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, content: $content, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class _$TodoListEntityCopyWith<$Res> implements $TodoListEntityCopyWith<$Res> {
  factory _$TodoListEntityCopyWith(_TodoListEntity value, $Res Function(_TodoListEntity) _then) = __$TodoListEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, int tripId, int userId, String content, bool isChecked
});




}
/// @nodoc
class __$TodoListEntityCopyWithImpl<$Res>
    implements _$TodoListEntityCopyWith<$Res> {
  __$TodoListEntityCopyWithImpl(this._self, this._then);

  final _TodoListEntity _self;
  final $Res Function(_TodoListEntity) _then;

/// Create a copy of TodoListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? content = null,Object? isChecked = null,}) {
  return _then(_TodoListEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
