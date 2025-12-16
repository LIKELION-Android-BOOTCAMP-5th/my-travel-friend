// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_pharse_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsefulPharseEntity {

 int get id; String get country; String get native; String get korean; String get mean;
/// Create a copy of UsefulPharseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulPharseEntityCopyWith<UsefulPharseEntity> get copyWith => _$UsefulPharseEntityCopyWithImpl<UsefulPharseEntity>(this as UsefulPharseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulPharseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.country, country) || other.country == country)&&(identical(other.native, native) || other.native == native)&&(identical(other.korean, korean) || other.korean == korean)&&(identical(other.mean, mean) || other.mean == mean));
}


@override
int get hashCode => Object.hash(runtimeType,id,country,native,korean,mean);

@override
String toString() {
  return 'UsefulPharseEntity(id: $id, country: $country, native: $native, korean: $korean, mean: $mean)';
}


}

/// @nodoc
abstract mixin class $UsefulPharseEntityCopyWith<$Res>  {
  factory $UsefulPharseEntityCopyWith(UsefulPharseEntity value, $Res Function(UsefulPharseEntity) _then) = _$UsefulPharseEntityCopyWithImpl;
@useResult
$Res call({
 int id, String country, String native, String korean, String mean
});




}
/// @nodoc
class _$UsefulPharseEntityCopyWithImpl<$Res>
    implements $UsefulPharseEntityCopyWith<$Res> {
  _$UsefulPharseEntityCopyWithImpl(this._self, this._then);

  final UsefulPharseEntity _self;
  final $Res Function(UsefulPharseEntity) _then;

/// Create a copy of UsefulPharseEntity
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


/// Adds pattern-matching-related methods to [UsefulPharseEntity].
extension UsefulPharseEntityPatterns on UsefulPharseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulPharseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulPharseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulPharseEntity value)  $default,){
final _that = this;
switch (_that) {
case _UsefulPharseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulPharseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulPharseEntity() when $default != null:
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
case _UsefulPharseEntity() when $default != null:
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
case _UsefulPharseEntity():
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
case _UsefulPharseEntity() when $default != null:
return $default(_that.id,_that.country,_that.native,_that.korean,_that.mean);case _:
  return null;

}
}

}

/// @nodoc


class _UsefulPharseEntity implements UsefulPharseEntity {
  const _UsefulPharseEntity({required this.id, required this.country, required this.native, required this.korean, required this.mean});
  

@override final  int id;
@override final  String country;
@override final  String native;
@override final  String korean;
@override final  String mean;

/// Create a copy of UsefulPharseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulPharseEntityCopyWith<_UsefulPharseEntity> get copyWith => __$UsefulPharseEntityCopyWithImpl<_UsefulPharseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulPharseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.country, country) || other.country == country)&&(identical(other.native, native) || other.native == native)&&(identical(other.korean, korean) || other.korean == korean)&&(identical(other.mean, mean) || other.mean == mean));
}


@override
int get hashCode => Object.hash(runtimeType,id,country,native,korean,mean);

@override
String toString() {
  return 'UsefulPharseEntity(id: $id, country: $country, native: $native, korean: $korean, mean: $mean)';
}


}

/// @nodoc
abstract mixin class _$UsefulPharseEntityCopyWith<$Res> implements $UsefulPharseEntityCopyWith<$Res> {
  factory _$UsefulPharseEntityCopyWith(_UsefulPharseEntity value, $Res Function(_UsefulPharseEntity) _then) = __$UsefulPharseEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String country, String native, String korean, String mean
});




}
/// @nodoc
class __$UsefulPharseEntityCopyWithImpl<$Res>
    implements _$UsefulPharseEntityCopyWith<$Res> {
  __$UsefulPharseEntityCopyWithImpl(this._self, this._then);

  final _UsefulPharseEntity _self;
  final $Res Function(_UsefulPharseEntity) _then;

/// Create a copy of UsefulPharseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? country = null,Object? native = null,Object? korean = null,Object? mean = null,}) {
  return _then(_UsefulPharseEntity(
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
