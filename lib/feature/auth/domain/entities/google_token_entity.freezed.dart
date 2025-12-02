// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoogleTokenEntity {

 String get idToken; String get accessToken;
/// Create a copy of GoogleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleTokenEntityCopyWith<GoogleTokenEntity> get copyWith => _$GoogleTokenEntityCopyWithImpl<GoogleTokenEntity>(this as GoogleTokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleTokenEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,accessToken);

@override
String toString() {
  return 'GoogleTokenEntity(idToken: $idToken, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $GoogleTokenEntityCopyWith<$Res>  {
  factory $GoogleTokenEntityCopyWith(GoogleTokenEntity value, $Res Function(GoogleTokenEntity) _then) = _$GoogleTokenEntityCopyWithImpl;
@useResult
$Res call({
 String idToken, String accessToken
});




}
/// @nodoc
class _$GoogleTokenEntityCopyWithImpl<$Res>
    implements $GoogleTokenEntityCopyWith<$Res> {
  _$GoogleTokenEntityCopyWithImpl(this._self, this._then);

  final GoogleTokenEntity _self;
  final $Res Function(GoogleTokenEntity) _then;

/// Create a copy of GoogleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? accessToken = null,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleTokenEntity].
extension GoogleTokenEntityPatterns on GoogleTokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleTokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleTokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleTokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _GoogleTokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleTokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleTokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idToken,  String accessToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleTokenEntity() when $default != null:
return $default(_that.idToken,_that.accessToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idToken,  String accessToken)  $default,) {final _that = this;
switch (_that) {
case _GoogleTokenEntity():
return $default(_that.idToken,_that.accessToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idToken,  String accessToken)?  $default,) {final _that = this;
switch (_that) {
case _GoogleTokenEntity() when $default != null:
return $default(_that.idToken,_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc


class _GoogleTokenEntity implements GoogleTokenEntity {
  const _GoogleTokenEntity({required this.idToken, required this.accessToken});
  

@override final  String idToken;
@override final  String accessToken;

/// Create a copy of GoogleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleTokenEntityCopyWith<_GoogleTokenEntity> get copyWith => __$GoogleTokenEntityCopyWithImpl<_GoogleTokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleTokenEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,accessToken);

@override
String toString() {
  return 'GoogleTokenEntity(idToken: $idToken, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$GoogleTokenEntityCopyWith<$Res> implements $GoogleTokenEntityCopyWith<$Res> {
  factory _$GoogleTokenEntityCopyWith(_GoogleTokenEntity value, $Res Function(_GoogleTokenEntity) _then) = __$GoogleTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String idToken, String accessToken
});




}
/// @nodoc
class __$GoogleTokenEntityCopyWithImpl<$Res>
    implements _$GoogleTokenEntityCopyWith<$Res> {
  __$GoogleTokenEntityCopyWithImpl(this._self, this._then);

  final _GoogleTokenEntity _self;
  final $Res Function(_GoogleTokenEntity) _then;

/// Create a copy of GoogleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? accessToken = null,}) {
  return _then(_GoogleTokenEntity(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
