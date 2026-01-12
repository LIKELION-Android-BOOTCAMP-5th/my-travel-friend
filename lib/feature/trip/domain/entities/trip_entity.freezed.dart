// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripEntity {

 int? get id; String? get createdAt; String get title; String get place; String get startAt; String get endAt; String get coverType; String? get coverImg; int get userId; String? get deletedAt; String get country; int? get crewCount;
/// Create a copy of TripEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripEntityCopyWith<TripEntity> get copyWith => _$TripEntityCopyWithImpl<TripEntity>(this as TripEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.country, country) || other.country == country)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,place,startAt,endAt,coverType,coverImg,userId,deletedAt,country,crewCount);

@override
String toString() {
  return 'TripEntity(id: $id, createdAt: $createdAt, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, coverImg: $coverImg, userId: $userId, deletedAt: $deletedAt, country: $country, crewCount: $crewCount)';
}


}

/// @nodoc
abstract mixin class $TripEntityCopyWith<$Res>  {
  factory $TripEntityCopyWith(TripEntity value, $Res Function(TripEntity) _then) = _$TripEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String title, String place, String startAt, String endAt, String coverType, String? coverImg, int userId, String? deletedAt, String country, int? crewCount
});




}
/// @nodoc
class _$TripEntityCopyWithImpl<$Res>
    implements $TripEntityCopyWith<$Res> {
  _$TripEntityCopyWithImpl(this._self, this._then);

  final TripEntity _self;
  final $Res Function(TripEntity) _then;

/// Create a copy of TripEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? coverImg = freezed,Object? userId = null,Object? deletedAt = freezed,Object? country = null,Object? crewCount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,crewCount: freezed == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripEntity].
extension TripEntityPatterns on TripEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripEntity value)  $default,){
final _that = this;
switch (_that) {
case _TripEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TripEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String title,  String place,  String startAt,  String endAt,  String coverType,  String? coverImg,  int userId,  String? deletedAt,  String country,  int? crewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country,_that.crewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String title,  String place,  String startAt,  String endAt,  String coverType,  String? coverImg,  int userId,  String? deletedAt,  String country,  int? crewCount)  $default,) {final _that = this;
switch (_that) {
case _TripEntity():
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country,_that.crewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  String title,  String place,  String startAt,  String endAt,  String coverType,  String? coverImg,  int userId,  String? deletedAt,  String country,  int? crewCount)?  $default,) {final _that = this;
switch (_that) {
case _TripEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country,_that.crewCount);case _:
  return null;

}
}

}

/// @nodoc


class _TripEntity implements TripEntity {
  const _TripEntity({this.id, this.createdAt, required this.title, required this.place, required this.startAt, required this.endAt, required this.coverType, this.coverImg, required this.userId, this.deletedAt, required this.country, this.crewCount});
  

@override final  int? id;
@override final  String? createdAt;
@override final  String title;
@override final  String place;
@override final  String startAt;
@override final  String endAt;
@override final  String coverType;
@override final  String? coverImg;
@override final  int userId;
@override final  String? deletedAt;
@override final  String country;
@override final  int? crewCount;

/// Create a copy of TripEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripEntityCopyWith<_TripEntity> get copyWith => __$TripEntityCopyWithImpl<_TripEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.country, country) || other.country == country)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,place,startAt,endAt,coverType,coverImg,userId,deletedAt,country,crewCount);

@override
String toString() {
  return 'TripEntity(id: $id, createdAt: $createdAt, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, coverImg: $coverImg, userId: $userId, deletedAt: $deletedAt, country: $country, crewCount: $crewCount)';
}


}

/// @nodoc
abstract mixin class _$TripEntityCopyWith<$Res> implements $TripEntityCopyWith<$Res> {
  factory _$TripEntityCopyWith(_TripEntity value, $Res Function(_TripEntity) _then) = __$TripEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String title, String place, String startAt, String endAt, String coverType, String? coverImg, int userId, String? deletedAt, String country, int? crewCount
});




}
/// @nodoc
class __$TripEntityCopyWithImpl<$Res>
    implements _$TripEntityCopyWith<$Res> {
  __$TripEntityCopyWithImpl(this._self, this._then);

  final _TripEntity _self;
  final $Res Function(_TripEntity) _then;

/// Create a copy of TripEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? coverImg = freezed,Object? userId = null,Object? deletedAt = freezed,Object? country = null,Object? crewCount = freezed,}) {
  return _then(_TripEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,crewCount: freezed == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
