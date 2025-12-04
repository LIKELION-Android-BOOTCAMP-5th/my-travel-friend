// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileState()';
}


}

/// @nodoc
class $AuthProfileStateCopyWith<$Res>  {
$AuthProfileStateCopyWith(AuthProfileState _, $Res Function(AuthProfileState) __);
}


/// Adds pattern-matching-related methods to [AuthProfileState].
extension AuthProfileStatePatterns on AuthProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthProfileInitial value)?  initial,TResult Function( AuthProfileLoading value)?  loading,TResult Function( AuthProfileAuthenticated value)?  authenticated,TResult Function( AuthProfileUnauthenticated value)?  unauthenticated,TResult Function( AuthProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthProfileInitial() when initial != null:
return initial(_that);case AuthProfileLoading() when loading != null:
return loading(_that);case AuthProfileAuthenticated() when authenticated != null:
return authenticated(_that);case AuthProfileUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthProfileError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthProfileInitial value)  initial,required TResult Function( AuthProfileLoading value)  loading,required TResult Function( AuthProfileAuthenticated value)  authenticated,required TResult Function( AuthProfileUnauthenticated value)  unauthenticated,required TResult Function( AuthProfileError value)  error,}){
final _that = this;
switch (_that) {
case AuthProfileInitial():
return initial(_that);case AuthProfileLoading():
return loading(_that);case AuthProfileAuthenticated():
return authenticated(_that);case AuthProfileUnauthenticated():
return unauthenticated(_that);case AuthProfileError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthProfileInitial value)?  initial,TResult? Function( AuthProfileLoading value)?  loading,TResult? Function( AuthProfileAuthenticated value)?  authenticated,TResult? Function( AuthProfileUnauthenticated value)?  unauthenticated,TResult? Function( AuthProfileError value)?  error,}){
final _that = this;
switch (_that) {
case AuthProfileInitial() when initial != null:
return initial(_that);case AuthProfileLoading() when loading != null:
return loading(_that);case AuthProfileAuthenticated() when authenticated != null:
return authenticated(_that);case AuthProfileUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthProfileError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String uuid,  UserEntity userInfo)?  authenticated,TResult Function()?  unauthenticated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthProfileInitial() when initial != null:
return initial();case AuthProfileLoading() when loading != null:
return loading();case AuthProfileAuthenticated() when authenticated != null:
return authenticated(_that.uuid,_that.userInfo);case AuthProfileUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthProfileError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String uuid,  UserEntity userInfo)  authenticated,required TResult Function()  unauthenticated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthProfileInitial():
return initial();case AuthProfileLoading():
return loading();case AuthProfileAuthenticated():
return authenticated(_that.uuid,_that.userInfo);case AuthProfileUnauthenticated():
return unauthenticated();case AuthProfileError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String uuid,  UserEntity userInfo)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthProfileInitial() when initial != null:
return initial();case AuthProfileLoading() when loading != null:
return loading();case AuthProfileAuthenticated() when authenticated != null:
return authenticated(_that.uuid,_that.userInfo);case AuthProfileUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthProfileError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthProfileInitial extends AuthProfileState {
  const AuthProfileInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileState.initial()';
}


}




/// @nodoc


class AuthProfileLoading extends AuthProfileState {
  const AuthProfileLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileState.loading()';
}


}




/// @nodoc


class AuthProfileAuthenticated extends AuthProfileState {
  const AuthProfileAuthenticated({required this.uuid, required this.userInfo}): super._();
  

 final  String uuid;
 final  UserEntity userInfo;

/// Create a copy of AuthProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthProfileAuthenticatedCopyWith<AuthProfileAuthenticated> get copyWith => _$AuthProfileAuthenticatedCopyWithImpl<AuthProfileAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileAuthenticated&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,userInfo);

@override
String toString() {
  return 'AuthProfileState.authenticated(uuid: $uuid, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $AuthProfileAuthenticatedCopyWith<$Res> implements $AuthProfileStateCopyWith<$Res> {
  factory $AuthProfileAuthenticatedCopyWith(AuthProfileAuthenticated value, $Res Function(AuthProfileAuthenticated) _then) = _$AuthProfileAuthenticatedCopyWithImpl;
@useResult
$Res call({
 String uuid, UserEntity userInfo
});


$UserEntityCopyWith<$Res> get userInfo;

}
/// @nodoc
class _$AuthProfileAuthenticatedCopyWithImpl<$Res>
    implements $AuthProfileAuthenticatedCopyWith<$Res> {
  _$AuthProfileAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthProfileAuthenticated _self;
  final $Res Function(AuthProfileAuthenticated) _then;

/// Create a copy of AuthProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? userInfo = null,}) {
  return _then(AuthProfileAuthenticated(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of AuthProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get userInfo {
  
  return $UserEntityCopyWith<$Res>(_self.userInfo, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}

/// @nodoc


class AuthProfileUnauthenticated extends AuthProfileState {
  const AuthProfileUnauthenticated(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileState.unauthenticated()';
}


}




/// @nodoc


class AuthProfileError extends AuthProfileState {
  const AuthProfileError({required this.message}): super._();
  

 final  String message;

/// Create a copy of AuthProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthProfileErrorCopyWith<AuthProfileError> get copyWith => _$AuthProfileErrorCopyWithImpl<AuthProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthProfileErrorCopyWith<$Res> implements $AuthProfileStateCopyWith<$Res> {
  factory $AuthProfileErrorCopyWith(AuthProfileError value, $Res Function(AuthProfileError) _then) = _$AuthProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthProfileErrorCopyWithImpl<$Res>
    implements $AuthProfileErrorCopyWith<$Res> {
  _$AuthProfileErrorCopyWithImpl(this._self, this._then);

  final AuthProfileError _self;
  final $Res Function(AuthProfileError) _then;

/// Create a copy of AuthProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthProfileError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
