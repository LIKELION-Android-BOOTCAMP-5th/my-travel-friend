// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileEvent()';
}


}

/// @nodoc
class $AuthProfileEventCopyWith<$Res>  {
$AuthProfileEventCopyWith(AuthProfileEvent _, $Res Function(AuthProfileEvent) __);
}


/// Adds pattern-matching-related methods to [AuthProfileEvent].
extension AuthProfileEventPatterns on AuthProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStateChanged value)?  authStateChanged,TResult Function( FetchUserProfile value)?  fetchUserProfile,TResult Function( UserRefreshed value)?  userRefreshed,TResult Function( HandleFCMToken value)?  handleFCMToken,TResult Function( UpdateUserInfo value)?  updateUserInfo,TResult Function( SignOut value)?  signOut,TResult Function( DeleteUser value)?  deleteUser,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case FetchUserProfile() when fetchUserProfile != null:
return fetchUserProfile(_that);case UserRefreshed() when userRefreshed != null:
return userRefreshed(_that);case HandleFCMToken() when handleFCMToken != null:
return handleFCMToken(_that);case UpdateUserInfo() when updateUserInfo != null:
return updateUserInfo(_that);case SignOut() when signOut != null:
return signOut(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStateChanged value)  authStateChanged,required TResult Function( FetchUserProfile value)  fetchUserProfile,required TResult Function( UserRefreshed value)  userRefreshed,required TResult Function( HandleFCMToken value)  handleFCMToken,required TResult Function( UpdateUserInfo value)  updateUserInfo,required TResult Function( SignOut value)  signOut,required TResult Function( DeleteUser value)  deleteUser,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case AuthStateChanged():
return authStateChanged(_that);case FetchUserProfile():
return fetchUserProfile(_that);case UserRefreshed():
return userRefreshed(_that);case HandleFCMToken():
return handleFCMToken(_that);case UpdateUserInfo():
return updateUserInfo(_that);case SignOut():
return signOut(_that);case DeleteUser():
return deleteUser(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStateChanged value)?  authStateChanged,TResult? Function( FetchUserProfile value)?  fetchUserProfile,TResult? Function( UserRefreshed value)?  userRefreshed,TResult? Function( HandleFCMToken value)?  handleFCMToken,TResult? Function( UpdateUserInfo value)?  updateUserInfo,TResult? Function( SignOut value)?  signOut,TResult? Function( DeleteUser value)?  deleteUser,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case FetchUserProfile() when fetchUserProfile != null:
return fetchUserProfile(_that);case UserRefreshed() when userRefreshed != null:
return userRefreshed(_that);case HandleFCMToken() when handleFCMToken != null:
return handleFCMToken(_that);case UpdateUserInfo() when updateUserInfo != null:
return updateUserInfo(_that);case SignOut() when signOut != null:
return signOut(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Result<UserEntity?> userResult)?  authStateChanged,TResult Function( String uuid)?  fetchUserProfile,TResult Function( String uuid)?  userRefreshed,TResult Function( String? uuid,  bool isSignIn)?  handleFCMToken,TResult Function( UserEntity userInfo)?  updateUserInfo,TResult Function()?  signOut,TResult Function()?  deleteUser,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.userResult);case FetchUserProfile() when fetchUserProfile != null:
return fetchUserProfile(_that.uuid);case UserRefreshed() when userRefreshed != null:
return userRefreshed(_that.uuid);case HandleFCMToken() when handleFCMToken != null:
return handleFCMToken(_that.uuid,_that.isSignIn);case UpdateUserInfo() when updateUserInfo != null:
return updateUserInfo(_that.userInfo);case SignOut() when signOut != null:
return signOut();case DeleteUser() when deleteUser != null:
return deleteUser();case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Result<UserEntity?> userResult)  authStateChanged,required TResult Function( String uuid)  fetchUserProfile,required TResult Function( String uuid)  userRefreshed,required TResult Function( String? uuid,  bool isSignIn)  handleFCMToken,required TResult Function( UserEntity userInfo)  updateUserInfo,required TResult Function()  signOut,required TResult Function()  deleteUser,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthStateChanged():
return authStateChanged(_that.userResult);case FetchUserProfile():
return fetchUserProfile(_that.uuid);case UserRefreshed():
return userRefreshed(_that.uuid);case HandleFCMToken():
return handleFCMToken(_that.uuid,_that.isSignIn);case UpdateUserInfo():
return updateUserInfo(_that.userInfo);case SignOut():
return signOut();case DeleteUser():
return deleteUser();case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Result<UserEntity?> userResult)?  authStateChanged,TResult? Function( String uuid)?  fetchUserProfile,TResult? Function( String uuid)?  userRefreshed,TResult? Function( String? uuid,  bool isSignIn)?  handleFCMToken,TResult? Function( UserEntity userInfo)?  updateUserInfo,TResult? Function()?  signOut,TResult? Function()?  deleteUser,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.userResult);case FetchUserProfile() when fetchUserProfile != null:
return fetchUserProfile(_that.uuid);case UserRefreshed() when userRefreshed != null:
return userRefreshed(_that.uuid);case HandleFCMToken() when handleFCMToken != null:
return handleFCMToken(_that.uuid,_that.isSignIn);case UpdateUserInfo() when updateUserInfo != null:
return updateUserInfo(_that.userInfo);case SignOut() when signOut != null:
return signOut();case DeleteUser() when deleteUser != null:
return deleteUser();case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthStateChanged implements AuthProfileEvent {
  const AuthStateChanged(this.userResult);
  

 final  Result<UserEntity?> userResult;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateChangedCopyWith<AuthStateChanged> get copyWith => _$AuthStateChangedCopyWithImpl<AuthStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateChanged&&(identical(other.userResult, userResult) || other.userResult == userResult));
}


@override
int get hashCode => Object.hash(runtimeType,userResult);

@override
String toString() {
  return 'AuthProfileEvent.authStateChanged(userResult: $userResult)';
}


}

/// @nodoc
abstract mixin class $AuthStateChangedCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $AuthStateChangedCopyWith(AuthStateChanged value, $Res Function(AuthStateChanged) _then) = _$AuthStateChangedCopyWithImpl;
@useResult
$Res call({
 Result<UserEntity?> userResult
});


$ResultCopyWith<UserEntity?, $Res> get userResult;

}
/// @nodoc
class _$AuthStateChangedCopyWithImpl<$Res>
    implements $AuthStateChangedCopyWith<$Res> {
  _$AuthStateChangedCopyWithImpl(this._self, this._then);

  final AuthStateChanged _self;
  final $Res Function(AuthStateChanged) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userResult = null,}) {
  return _then(AuthStateChanged(
null == userResult ? _self.userResult : userResult // ignore: cast_nullable_to_non_nullable
as Result<UserEntity?>,
  ));
}

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<UserEntity?, $Res> get userResult {
  
  return $ResultCopyWith<UserEntity?, $Res>(_self.userResult, (value) {
    return _then(_self.copyWith(userResult: value));
  });
}
}

/// @nodoc


class FetchUserProfile implements AuthProfileEvent {
  const FetchUserProfile(this.uuid);
  

 final  String uuid;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchUserProfileCopyWith<FetchUserProfile> get copyWith => _$FetchUserProfileCopyWithImpl<FetchUserProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchUserProfile&&(identical(other.uuid, uuid) || other.uuid == uuid));
}


@override
int get hashCode => Object.hash(runtimeType,uuid);

@override
String toString() {
  return 'AuthProfileEvent.fetchUserProfile(uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $FetchUserProfileCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $FetchUserProfileCopyWith(FetchUserProfile value, $Res Function(FetchUserProfile) _then) = _$FetchUserProfileCopyWithImpl;
@useResult
$Res call({
 String uuid
});




}
/// @nodoc
class _$FetchUserProfileCopyWithImpl<$Res>
    implements $FetchUserProfileCopyWith<$Res> {
  _$FetchUserProfileCopyWithImpl(this._self, this._then);

  final FetchUserProfile _self;
  final $Res Function(FetchUserProfile) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uuid = null,}) {
  return _then(FetchUserProfile(
null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserRefreshed implements AuthProfileEvent {
  const UserRefreshed(this.uuid);
  

 final  String uuid;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRefreshedCopyWith<UserRefreshed> get copyWith => _$UserRefreshedCopyWithImpl<UserRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRefreshed&&(identical(other.uuid, uuid) || other.uuid == uuid));
}


@override
int get hashCode => Object.hash(runtimeType,uuid);

@override
String toString() {
  return 'AuthProfileEvent.userRefreshed(uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $UserRefreshedCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $UserRefreshedCopyWith(UserRefreshed value, $Res Function(UserRefreshed) _then) = _$UserRefreshedCopyWithImpl;
@useResult
$Res call({
 String uuid
});




}
/// @nodoc
class _$UserRefreshedCopyWithImpl<$Res>
    implements $UserRefreshedCopyWith<$Res> {
  _$UserRefreshedCopyWithImpl(this._self, this._then);

  final UserRefreshed _self;
  final $Res Function(UserRefreshed) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uuid = null,}) {
  return _then(UserRefreshed(
null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HandleFCMToken implements AuthProfileEvent {
  const HandleFCMToken({required this.uuid, required this.isSignIn});
  

 final  String? uuid;
 final  bool isSignIn;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HandleFCMTokenCopyWith<HandleFCMToken> get copyWith => _$HandleFCMTokenCopyWithImpl<HandleFCMToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HandleFCMToken&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.isSignIn, isSignIn) || other.isSignIn == isSignIn));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,isSignIn);

@override
String toString() {
  return 'AuthProfileEvent.handleFCMToken(uuid: $uuid, isSignIn: $isSignIn)';
}


}

/// @nodoc
abstract mixin class $HandleFCMTokenCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $HandleFCMTokenCopyWith(HandleFCMToken value, $Res Function(HandleFCMToken) _then) = _$HandleFCMTokenCopyWithImpl;
@useResult
$Res call({
 String? uuid, bool isSignIn
});




}
/// @nodoc
class _$HandleFCMTokenCopyWithImpl<$Res>
    implements $HandleFCMTokenCopyWith<$Res> {
  _$HandleFCMTokenCopyWithImpl(this._self, this._then);

  final HandleFCMToken _self;
  final $Res Function(HandleFCMToken) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? isSignIn = null,}) {
  return _then(HandleFCMToken(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,isSignIn: null == isSignIn ? _self.isSignIn : isSignIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UpdateUserInfo implements AuthProfileEvent {
  const UpdateUserInfo({required this.userInfo});
  

 final  UserEntity userInfo;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserInfoCopyWith<UpdateUserInfo> get copyWith => _$UpdateUserInfoCopyWithImpl<UpdateUserInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserInfo&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}


@override
int get hashCode => Object.hash(runtimeType,userInfo);

@override
String toString() {
  return 'AuthProfileEvent.updateUserInfo(userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $UpdateUserInfoCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $UpdateUserInfoCopyWith(UpdateUserInfo value, $Res Function(UpdateUserInfo) _then) = _$UpdateUserInfoCopyWithImpl;
@useResult
$Res call({
 UserEntity userInfo
});


$UserEntityCopyWith<$Res> get userInfo;

}
/// @nodoc
class _$UpdateUserInfoCopyWithImpl<$Res>
    implements $UpdateUserInfoCopyWith<$Res> {
  _$UpdateUserInfoCopyWithImpl(this._self, this._then);

  final UpdateUserInfo _self;
  final $Res Function(UpdateUserInfo) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userInfo = null,}) {
  return _then(UpdateUserInfo(
userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of AuthProfileEvent
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


class SignOut implements AuthProfileEvent {
  const SignOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileEvent.signOut()';
}


}




/// @nodoc


class DeleteUser implements AuthProfileEvent {
  const DeleteUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthProfileEvent.deleteUser()';
}


}




/// @nodoc


class Error implements AuthProfileEvent {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthProfileEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AuthProfileEventCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of AuthProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
