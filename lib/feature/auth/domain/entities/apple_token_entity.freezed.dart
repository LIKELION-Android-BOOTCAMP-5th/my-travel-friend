// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppleTokenEntity {

 String get idToken; String? get authorizationCode;
/// Create a copy of AppleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppleTokenEntityCopyWith<AppleTokenEntity> get copyWith => _$AppleTokenEntityCopyWithImpl<AppleTokenEntity>(this as AppleTokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppleTokenEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.authorizationCode, authorizationCode) || other.authorizationCode == authorizationCode));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,authorizationCode);

@override
String toString() {
  return 'AppleTokenEntity(idToken: $idToken, authorizationCode: $authorizationCode)';
}


}

/// @nodoc
abstract mixin class $AppleTokenEntityCopyWith<$Res>  {
  factory $AppleTokenEntityCopyWith(AppleTokenEntity value, $Res Function(AppleTokenEntity) _then) = _$AppleTokenEntityCopyWithImpl;
@useResult
$Res call({
 String idToken, String? authorizationCode
});




}
/// @nodoc
class _$AppleTokenEntityCopyWithImpl<$Res>
    implements $AppleTokenEntityCopyWith<$Res> {
  _$AppleTokenEntityCopyWithImpl(this._self, this._then);

  final AppleTokenEntity _self;
  final $Res Function(AppleTokenEntity) _then;

/// Create a copy of AppleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? authorizationCode = freezed,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,authorizationCode: freezed == authorizationCode ? _self.authorizationCode : authorizationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppleTokenEntity].
extension AppleTokenEntityPatterns on AppleTokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppleTokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppleTokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppleTokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppleTokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppleTokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppleTokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idToken,  String? authorizationCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppleTokenEntity() when $default != null:
return $default(_that.idToken,_that.authorizationCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idToken,  String? authorizationCode)  $default,) {final _that = this;
switch (_that) {
case _AppleTokenEntity():
return $default(_that.idToken,_that.authorizationCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idToken,  String? authorizationCode)?  $default,) {final _that = this;
switch (_that) {
case _AppleTokenEntity() when $default != null:
return $default(_that.idToken,_that.authorizationCode);case _:
  return null;

}
}

}

/// @nodoc


class _AppleTokenEntity implements AppleTokenEntity {
  const _AppleTokenEntity({required this.idToken, this.authorizationCode});
  

@override final  String idToken;
@override final  String? authorizationCode;

/// Create a copy of AppleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppleTokenEntityCopyWith<_AppleTokenEntity> get copyWith => __$AppleTokenEntityCopyWithImpl<_AppleTokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppleTokenEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.authorizationCode, authorizationCode) || other.authorizationCode == authorizationCode));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,authorizationCode);

@override
String toString() {
  return 'AppleTokenEntity(idToken: $idToken, authorizationCode: $authorizationCode)';
}


}

/// @nodoc
abstract mixin class _$AppleTokenEntityCopyWith<$Res> implements $AppleTokenEntityCopyWith<$Res> {
  factory _$AppleTokenEntityCopyWith(_AppleTokenEntity value, $Res Function(_AppleTokenEntity) _then) = __$AppleTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String idToken, String? authorizationCode
});




}
/// @nodoc
class __$AppleTokenEntityCopyWithImpl<$Res>
    implements _$AppleTokenEntityCopyWith<$Res> {
  __$AppleTokenEntityCopyWithImpl(this._self, this._then);

  final _AppleTokenEntity _self;
  final $Res Function(_AppleTokenEntity) _then;

/// Create a copy of AppleTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? authorizationCode = freezed,}) {
  return _then(_AppleTokenEntity(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,authorizationCode: freezed == authorizationCode ? _self.authorizationCode : authorizationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
