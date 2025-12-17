// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_pharse_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsefulPharseDTO {

 int get id; String get country; String get native; String get korean; String get mean;
/// Create a copy of UsefulPharseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulPharseDTOCopyWith<UsefulPharseDTO> get copyWith => _$UsefulPharseDTOCopyWithImpl<UsefulPharseDTO>(this as UsefulPharseDTO, _$identity);

  /// Serializes this UsefulPharseDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulPharseDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.country, country) || other.country == country)&&(identical(other.native, native) || other.native == native)&&(identical(other.korean, korean) || other.korean == korean)&&(identical(other.mean, mean) || other.mean == mean));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,country,native,korean,mean);

@override
String toString() {
  return 'UsefulPharseDTO(id: $id, country: $country, native: $native, korean: $korean, mean: $mean)';
}


}

/// @nodoc
abstract mixin class $UsefulPharseDTOCopyWith<$Res>  {
  factory $UsefulPharseDTOCopyWith(UsefulPharseDTO value, $Res Function(UsefulPharseDTO) _then) = _$UsefulPharseDTOCopyWithImpl;
@useResult
$Res call({
 int id, String country, String native, String korean, String mean
});




}
/// @nodoc
class _$UsefulPharseDTOCopyWithImpl<$Res>
    implements $UsefulPharseDTOCopyWith<$Res> {
  _$UsefulPharseDTOCopyWithImpl(this._self, this._then);

  final UsefulPharseDTO _self;
  final $Res Function(UsefulPharseDTO) _then;

/// Create a copy of UsefulPharseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? country = null,Object? native = null,Object? korean = null,Object? mean = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,native: null == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String,korean: null == korean ? _self.korean : korean // ignore: cast_nullable_to_non_nullable
as String,mean: null == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsefulPharseDTO].
extension UsefulPharseDTOPatterns on UsefulPharseDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulPharseDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulPharseDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulPharseDTO value)  $default,){
final _that = this;
switch (_that) {
case _UsefulPharseDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulPharseDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulPharseDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String country,  String native,  String korean,  String mean)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsefulPharseDTO() when $default != null:
return $default(_that.id,_that.country,_that.native,_that.korean,_that.mean);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String country,  String native,  String korean,  String mean)  $default,) {final _that = this;
switch (_that) {
case _UsefulPharseDTO():
return $default(_that.id,_that.country,_that.native,_that.korean,_that.mean);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String country,  String native,  String korean,  String mean)?  $default,) {final _that = this;
switch (_that) {
case _UsefulPharseDTO() when $default != null:
return $default(_that.id,_that.country,_that.native,_that.korean,_that.mean);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsefulPharseDTO extends UsefulPharseDTO {
  const _UsefulPharseDTO({required this.id, required this.country, required this.native, required this.korean, required this.mean}): super._();
  factory _UsefulPharseDTO.fromJson(Map<String, dynamic> json) => _$UsefulPharseDTOFromJson(json);

@override final  int id;
@override final  String country;
@override final  String native;
@override final  String korean;
@override final  String mean;

/// Create a copy of UsefulPharseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulPharseDTOCopyWith<_UsefulPharseDTO> get copyWith => __$UsefulPharseDTOCopyWithImpl<_UsefulPharseDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsefulPharseDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulPharseDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.country, country) || other.country == country)&&(identical(other.native, native) || other.native == native)&&(identical(other.korean, korean) || other.korean == korean)&&(identical(other.mean, mean) || other.mean == mean));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,country,native,korean,mean);

@override
String toString() {
  return 'UsefulPharseDTO(id: $id, country: $country, native: $native, korean: $korean, mean: $mean)';
}


}

/// @nodoc
abstract mixin class _$UsefulPharseDTOCopyWith<$Res> implements $UsefulPharseDTOCopyWith<$Res> {
  factory _$UsefulPharseDTOCopyWith(_UsefulPharseDTO value, $Res Function(_UsefulPharseDTO) _then) = __$UsefulPharseDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String country, String native, String korean, String mean
});




}
/// @nodoc
class __$UsefulPharseDTOCopyWithImpl<$Res>
    implements _$UsefulPharseDTOCopyWith<$Res> {
  __$UsefulPharseDTOCopyWithImpl(this._self, this._then);

  final _UsefulPharseDTO _self;
  final $Res Function(_UsefulPharseDTO) _then;

/// Create a copy of UsefulPharseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? country = null,Object? native = null,Object? korean = null,Object? mean = null,}) {
  return _then(_UsefulPharseDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,native: null == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String,korean: null == korean ? _self.korean : korean // ignore: cast_nullable_to_non_nullable
as String,mean: null == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
