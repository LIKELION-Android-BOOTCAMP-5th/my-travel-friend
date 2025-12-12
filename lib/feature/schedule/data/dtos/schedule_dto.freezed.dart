// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleDTO {

 int? get id;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'trip_id') int get tripId;@JsonKey(name: 'user') Map<String, dynamic>? get userJson; String get title; String? get place;@JsonKey(name: 'adress') String? get address; double? get lat; double? get lng; String get date; String? get description;@JsonKey(name: 'category_id') int get categoryId;
/// Create a copy of ScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleDTOCopyWith<ScheduleDTO> get copyWith => _$ScheduleDTOCopyWithImpl<ScheduleDTO>(this as ScheduleDTO, _$identity);

  /// Serializes this ScheduleDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&const DeepCollectionEquality().equals(other.userJson, userJson)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,const DeepCollectionEquality().hash(userJson),title,place,address,lat,lng,date,description,categoryId);

@override
String toString() {
  return 'ScheduleDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userJson: $userJson, title: $title, place: $place, address: $address, lat: $lat, lng: $lng, date: $date, description: $description, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ScheduleDTOCopyWith<$Res>  {
  factory $ScheduleDTOCopyWith(ScheduleDTO value, $Res Function(ScheduleDTO) _then) = _$ScheduleDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user') Map<String, dynamic>? userJson, String title, String? place,@JsonKey(name: 'adress') String? address, double? lat, double? lng, String date, String? description,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class _$ScheduleDTOCopyWithImpl<$Res>
    implements $ScheduleDTOCopyWith<$Res> {
  _$ScheduleDTOCopyWithImpl(this._self, this._then);

  final ScheduleDTO _self;
  final $Res Function(ScheduleDTO) _then;

/// Create a copy of ScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userJson = freezed,Object? title = null,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? date = null,Object? description = freezed,Object? categoryId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userJson: freezed == userJson ? _self.userJson : userJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleDTO].
extension ScheduleDTOPatterns on ScheduleDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleDTO value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user')  Map<String, dynamic>? userJson,  String title,  String? place, @JsonKey(name: 'adress')  String? address,  double? lat,  double? lng,  String date,  String? description, @JsonKey(name: 'category_id')  int categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userJson,_that.title,_that.place,_that.address,_that.lat,_that.lng,_that.date,_that.description,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user')  Map<String, dynamic>? userJson,  String title,  String? place, @JsonKey(name: 'adress')  String? address,  double? lat,  double? lng,  String date,  String? description, @JsonKey(name: 'category_id')  int categoryId)  $default,) {final _that = this;
switch (_that) {
case _ScheduleDTO():
return $default(_that.id,_that.createdAt,_that.tripId,_that.userJson,_that.title,_that.place,_that.address,_that.lat,_that.lng,_that.date,_that.description,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user')  Map<String, dynamic>? userJson,  String title,  String? place, @JsonKey(name: 'adress')  String? address,  double? lat,  double? lng,  String date,  String? description, @JsonKey(name: 'category_id')  int categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userJson,_that.title,_that.place,_that.address,_that.lat,_that.lng,_that.date,_that.description,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleDTO extends ScheduleDTO {
  const _ScheduleDTO({this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'user') final  Map<String, dynamic>? userJson, required this.title, this.place, @JsonKey(name: 'adress') this.address, this.lat, this.lng, required this.date, this.description, @JsonKey(name: 'category_id') required this.categoryId}): _userJson = userJson,super._();
  factory _ScheduleDTO.fromJson(Map<String, dynamic> json) => _$ScheduleDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'trip_id') final  int tripId;
 final  Map<String, dynamic>? _userJson;
@override@JsonKey(name: 'user') Map<String, dynamic>? get userJson {
  final value = _userJson;
  if (value == null) return null;
  if (_userJson is EqualUnmodifiableMapView) return _userJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String title;
@override final  String? place;
@override@JsonKey(name: 'adress') final  String? address;
@override final  double? lat;
@override final  double? lng;
@override final  String date;
@override final  String? description;
@override@JsonKey(name: 'category_id') final  int categoryId;

/// Create a copy of ScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleDTOCopyWith<_ScheduleDTO> get copyWith => __$ScheduleDTOCopyWithImpl<_ScheduleDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&const DeepCollectionEquality().equals(other._userJson, _userJson)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,const DeepCollectionEquality().hash(_userJson),title,place,address,lat,lng,date,description,categoryId);

@override
String toString() {
  return 'ScheduleDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userJson: $userJson, title: $title, place: $place, address: $address, lat: $lat, lng: $lng, date: $date, description: $description, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ScheduleDTOCopyWith<$Res> implements $ScheduleDTOCopyWith<$Res> {
  factory _$ScheduleDTOCopyWith(_ScheduleDTO value, $Res Function(_ScheduleDTO) _then) = __$ScheduleDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user') Map<String, dynamic>? userJson, String title, String? place,@JsonKey(name: 'adress') String? address, double? lat, double? lng, String date, String? description,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class __$ScheduleDTOCopyWithImpl<$Res>
    implements _$ScheduleDTOCopyWith<$Res> {
  __$ScheduleDTOCopyWithImpl(this._self, this._then);

  final _ScheduleDTO _self;
  final $Res Function(_ScheduleDTO) _then;

/// Create a copy of ScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userJson = freezed,Object? title = null,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? date = null,Object? description = freezed,Object? categoryId = null,}) {
  return _then(_ScheduleDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userJson: freezed == userJson ? _self._userJson : userJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
