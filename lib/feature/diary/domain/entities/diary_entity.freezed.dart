// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryEntity {

 int? get id; String? get createdAt; int get tripId; int get userId; UserEntity? get user; bool get isPublic; String get type; String? get title; int? get scheduleId; String? get img; double? get rating; String? get content; int? get cost;
/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<DiaryEntity> get copyWith => _$DiaryEntityCopyWithImpl<DiaryEntity>(this as DiaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.img, img) || other.img == img)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.cost, cost) || other.cost == cost));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,user,isPublic,type,title,scheduleId,img,rating,content,cost);

@override
String toString() {
  return 'DiaryEntity(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, user: $user, isPublic: $isPublic, type: $type, title: $title, scheduleId: $scheduleId, img: $img, rating: $rating, content: $content, cost: $cost)';
}


}

/// @nodoc
abstract mixin class $DiaryEntityCopyWith<$Res>  {
  factory $DiaryEntityCopyWith(DiaryEntity value, $Res Function(DiaryEntity) _then) = _$DiaryEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, int tripId, int userId, UserEntity? user, bool isPublic, String type, String? title, int? scheduleId, String? img, double? rating, String? content, int? cost
});


$UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class _$DiaryEntityCopyWithImpl<$Res>
    implements $DiaryEntityCopyWith<$Res> {
  _$DiaryEntityCopyWithImpl(this._self, this._then);

  final DiaryEntity _self;
  final $Res Function(DiaryEntity) _then;

/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? user = freezed,Object? isPublic = null,Object? type = null,Object? title = freezed,Object? scheduleId = freezed,Object? img = freezed,Object? rating = freezed,Object? content = freezed,Object? cost = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiaryEntity].
extension DiaryEntityPatterns on DiaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _DiaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int tripId,  int userId,  UserEntity? user,  bool isPublic,  String type,  String? title,  int? scheduleId,  String? img,  double? rating,  String? content,  int? cost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.user,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  int tripId,  int userId,  UserEntity? user,  bool isPublic,  String type,  String? title,  int? scheduleId,  String? img,  double? rating,  String? content,  int? cost)  $default,) {final _that = this;
switch (_that) {
case _DiaryEntity():
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.user,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  int tripId,  int userId,  UserEntity? user,  bool isPublic,  String type,  String? title,  int? scheduleId,  String? img,  double? rating,  String? content,  int? cost)?  $default,) {final _that = this;
switch (_that) {
case _DiaryEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.user,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryEntity implements DiaryEntity {
  const _DiaryEntity({this.id, this.createdAt, required this.tripId, required this.userId, this.user, required this.isPublic, required this.type, this.title, this.scheduleId, this.img, this.rating, this.content, this.cost});
  

@override final  int? id;
@override final  String? createdAt;
@override final  int tripId;
@override final  int userId;
@override final  UserEntity? user;
@override final  bool isPublic;
@override final  String type;
@override final  String? title;
@override final  int? scheduleId;
@override final  String? img;
@override final  double? rating;
@override final  String? content;
@override final  int? cost;

/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryEntityCopyWith<_DiaryEntity> get copyWith => __$DiaryEntityCopyWithImpl<_DiaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.img, img) || other.img == img)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.cost, cost) || other.cost == cost));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,user,isPublic,type,title,scheduleId,img,rating,content,cost);

@override
String toString() {
  return 'DiaryEntity(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, user: $user, isPublic: $isPublic, type: $type, title: $title, scheduleId: $scheduleId, img: $img, rating: $rating, content: $content, cost: $cost)';
}


}

/// @nodoc
abstract mixin class _$DiaryEntityCopyWith<$Res> implements $DiaryEntityCopyWith<$Res> {
  factory _$DiaryEntityCopyWith(_DiaryEntity value, $Res Function(_DiaryEntity) _then) = __$DiaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, int tripId, int userId, UserEntity? user, bool isPublic, String type, String? title, int? scheduleId, String? img, double? rating, String? content, int? cost
});


@override $UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class __$DiaryEntityCopyWithImpl<$Res>
    implements _$DiaryEntityCopyWith<$Res> {
  __$DiaryEntityCopyWithImpl(this._self, this._then);

  final _DiaryEntity _self;
  final $Res Function(_DiaryEntity) _then;

/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? user = freezed,Object? isPublic = null,Object? type = null,Object? title = freezed,Object? scheduleId = freezed,Object? img = freezed,Object? rating = freezed,Object? content = freezed,Object? cost = freezed,}) {
  return _then(_DiaryEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DiaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
