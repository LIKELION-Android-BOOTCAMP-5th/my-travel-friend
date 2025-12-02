// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripDto {

 int? get id;@JsonKey(name: 'created_at') String? get createdAt; String get title; String get place;@JsonKey(name: 'start_at') String get startAt;@JsonKey(name: 'end_at') String get endAt;@JsonKey(name: 'cover_type') String get coverType;@JsonKey(name: 'cover_img') String? get coverImg;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'deleted_at') String? get deletedAt; String get country;
/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDtoCopyWith<TripDto> get copyWith => _$TripDtoCopyWithImpl<TripDto>(this as TripDto, _$identity);

  /// Serializes this TripDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,place,startAt,endAt,coverType,coverImg,userId,deletedAt,country);

@override
String toString() {
  return 'TripDto(id: $id, createdAt: $createdAt, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, coverImg: $coverImg, userId: $userId, deletedAt: $deletedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class $TripDtoCopyWith<$Res>  {
  factory $TripDtoCopyWith(TripDto value, $Res Function(TripDto) _then) = _$TripDtoCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt, String title, String place,@JsonKey(name: 'start_at') String startAt,@JsonKey(name: 'end_at') String endAt,@JsonKey(name: 'cover_type') String coverType,@JsonKey(name: 'cover_img') String? coverImg,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'deleted_at') String? deletedAt, String country
});




}
/// @nodoc
class _$TripDtoCopyWithImpl<$Res>
    implements $TripDtoCopyWith<$Res> {
  _$TripDtoCopyWithImpl(this._self, this._then);

  final TripDto _self;
  final $Res Function(TripDto) _then;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? coverImg = freezed,Object? userId = null,Object? deletedAt = freezed,Object? country = null,}) {
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
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TripDto].
extension TripDtoPatterns on TripDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripDto value)  $default,){
final _that = this;
switch (_that) {
case _TripDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripDto value)?  $default,){
final _that = this;
switch (_that) {
case _TripDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt,  String title,  String place, @JsonKey(name: 'start_at')  String startAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'cover_type')  String coverType, @JsonKey(name: 'cover_img')  String? coverImg, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'deleted_at')  String? deletedAt,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt,  String title,  String place, @JsonKey(name: 'start_at')  String startAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'cover_type')  String coverType, @JsonKey(name: 'cover_img')  String? coverImg, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'deleted_at')  String? deletedAt,  String country)  $default,) {final _that = this;
switch (_that) {
case _TripDto():
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'created_at')  String? createdAt,  String title,  String place, @JsonKey(name: 'start_at')  String startAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'cover_type')  String coverType, @JsonKey(name: 'cover_img')  String? coverImg, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'deleted_at')  String? deletedAt,  String country)?  $default,) {final _that = this;
switch (_that) {
case _TripDto() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.coverImg,_that.userId,_that.deletedAt,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripDto extends TripDto {
  const _TripDto({this.id, @JsonKey(name: 'created_at') this.createdAt, required this.title, required this.place, @JsonKey(name: 'start_at') required this.startAt, @JsonKey(name: 'end_at') required this.endAt, @JsonKey(name: 'cover_type') required this.coverType, @JsonKey(name: 'cover_img') this.coverImg, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'deleted_at') this.deletedAt, required this.country}): super._();
  factory _TripDto.fromJson(Map<String, dynamic> json) => _$TripDtoFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  String title;
@override final  String place;
@override@JsonKey(name: 'start_at') final  String startAt;
@override@JsonKey(name: 'end_at') final  String endAt;
@override@JsonKey(name: 'cover_type') final  String coverType;
@override@JsonKey(name: 'cover_img') final  String? coverImg;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override final  String country;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripDtoCopyWith<_TripDto> get copyWith => __$TripDtoCopyWithImpl<_TripDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,place,startAt,endAt,coverType,coverImg,userId,deletedAt,country);

@override
String toString() {
  return 'TripDto(id: $id, createdAt: $createdAt, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, coverImg: $coverImg, userId: $userId, deletedAt: $deletedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class _$TripDtoCopyWith<$Res> implements $TripDtoCopyWith<$Res> {
  factory _$TripDtoCopyWith(_TripDto value, $Res Function(_TripDto) _then) = __$TripDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt, String title, String place,@JsonKey(name: 'start_at') String startAt,@JsonKey(name: 'end_at') String endAt,@JsonKey(name: 'cover_type') String coverType,@JsonKey(name: 'cover_img') String? coverImg,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'deleted_at') String? deletedAt, String country
});




}
/// @nodoc
class __$TripDtoCopyWithImpl<$Res>
    implements _$TripDtoCopyWith<$Res> {
  __$TripDtoCopyWithImpl(this._self, this._then);

  final _TripDto _self;
  final $Res Function(_TripDto) _then;

/// Create a copy of TripDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? coverImg = freezed,Object? userId = null,Object? deletedAt = freezed,Object? country = null,}) {
  return _then(_TripDto(
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
as String,
  ));
}


}

// dart format on
