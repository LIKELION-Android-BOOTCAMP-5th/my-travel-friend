// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryDTO {

 int? get id;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'trip_id') int get tripId;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'is_public') bool get isPublic; String get type; String? get title;@JsonKey(name: 'schedule_id') int? get scheduleId; String? get img; int? get rating; String? get content; int? get cost;
/// Create a copy of DiaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryDTOCopyWith<DiaryDTO> get copyWith => _$DiaryDTOCopyWithImpl<DiaryDTO>(this as DiaryDTO, _$identity);

  /// Serializes this DiaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.img, img) || other.img == img)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.cost, cost) || other.cost == cost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,isPublic,type,title,scheduleId,img,rating,content,cost);

@override
String toString() {
  return 'DiaryDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, isPublic: $isPublic, type: $type, title: $title, scheduleId: $scheduleId, img: $img, rating: $rating, content: $content, cost: $cost)';
}


}

/// @nodoc
abstract mixin class $DiaryDTOCopyWith<$Res>  {
  factory $DiaryDTOCopyWith(DiaryDTO value, $Res Function(DiaryDTO) _then) = _$DiaryDTOCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'is_public') bool isPublic, String type, String? title,@JsonKey(name: 'schedule_id') int? scheduleId, String? img, int? rating, String? content, int? cost
});




}
/// @nodoc
class _$DiaryDTOCopyWithImpl<$Res>
    implements $DiaryDTOCopyWith<$Res> {
  _$DiaryDTOCopyWithImpl(this._self, this._then);

  final DiaryDTO _self;
  final $Res Function(DiaryDTO) _then;

/// Create a copy of DiaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? isPublic = null,Object? type = null,Object? title = freezed,Object? scheduleId = freezed,Object? img = freezed,Object? rating = freezed,Object? content = freezed,Object? cost = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryDTO].
extension DiaryDTOPatterns on DiaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _DiaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'is_public')  bool isPublic,  String type,  String? title, @JsonKey(name: 'schedule_id')  int? scheduleId,  String? img,  int? rating,  String? content,  int? cost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'is_public')  bool isPublic,  String type,  String? title, @JsonKey(name: 'schedule_id')  int? scheduleId,  String? img,  int? rating,  String? content,  int? cost)  $default,) {final _that = this;
switch (_that) {
case _DiaryDTO():
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'trip_id')  int tripId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'is_public')  bool isPublic,  String type,  String? title, @JsonKey(name: 'schedule_id')  int? scheduleId,  String? img,  int? rating,  String? content,  int? cost)?  $default,) {final _that = this;
switch (_that) {
case _DiaryDTO() when $default != null:
return $default(_that.id,_that.createdAt,_that.tripId,_that.userId,_that.isPublic,_that.type,_that.title,_that.scheduleId,_that.img,_that.rating,_that.content,_that.cost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiaryDTO extends DiaryDTO {
  const _DiaryDTO({this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'is_public') required this.isPublic, required this.type, this.title, @JsonKey(name: 'schedule_id') this.scheduleId, this.img, this.rating, this.content, this.cost}): super._();
  factory _DiaryDTO.fromJson(Map<String, dynamic> json) => _$DiaryDTOFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'trip_id') final  int tripId;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'is_public') final  bool isPublic;
@override final  String type;
@override final  String? title;
@override@JsonKey(name: 'schedule_id') final  int? scheduleId;
@override final  String? img;
@override final  int? rating;
@override final  String? content;
@override final  int? cost;

/// Create a copy of DiaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryDTOCopyWith<_DiaryDTO> get copyWith => __$DiaryDTOCopyWithImpl<_DiaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.img, img) || other.img == img)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.cost, cost) || other.cost == cost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,tripId,userId,isPublic,type,title,scheduleId,img,rating,content,cost);

@override
String toString() {
  return 'DiaryDTO(id: $id, createdAt: $createdAt, tripId: $tripId, userId: $userId, isPublic: $isPublic, type: $type, title: $title, scheduleId: $scheduleId, img: $img, rating: $rating, content: $content, cost: $cost)';
}


}

/// @nodoc
abstract mixin class _$DiaryDTOCopyWith<$Res> implements $DiaryDTOCopyWith<$Res> {
  factory _$DiaryDTOCopyWith(_DiaryDTO value, $Res Function(_DiaryDTO) _then) = __$DiaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'trip_id') int tripId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'is_public') bool isPublic, String type, String? title,@JsonKey(name: 'schedule_id') int? scheduleId, String? img, int? rating, String? content, int? cost
});




}
/// @nodoc
class __$DiaryDTOCopyWithImpl<$Res>
    implements _$DiaryDTOCopyWith<$Res> {
  __$DiaryDTOCopyWithImpl(this._self, this._then);

  final _DiaryDTO _self;
  final $Res Function(_DiaryDTO) _then;

/// Create a copy of DiaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? tripId = null,Object? userId = null,Object? isPublic = null,Object? type = null,Object? title = freezed,Object? scheduleId = freezed,Object? img = freezed,Object? rating = freezed,Object? content = freezed,Object? cost = freezed,}) {
  return _then(_DiaryDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
