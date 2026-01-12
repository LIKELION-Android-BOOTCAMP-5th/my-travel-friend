// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStarted value)?  authStarted,TResult Function( SignInWithSocialPressed value)?  signInWithSocialPressed,TResult Function( SignInCanceled value)?  signInCancelled,TResult Function( SignedOut value)?  signedOut,TResult Function( Authenticated value)?  authenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted(_that);case SignInWithSocialPressed() when signInWithSocialPressed != null:
return signInWithSocialPressed(_that);case SignInCanceled() when signInCancelled != null:
return signInCancelled(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStarted value)  authStarted,required TResult Function( SignInWithSocialPressed value)  signInWithSocialPressed,required TResult Function( SignInCanceled value)  signInCancelled,required TResult Function( SignedOut value)  signedOut,required TResult Function( Authenticated value)  authenticated,}){
final _that = this;
switch (_that) {
case AuthStarted():
return authStarted(_that);case SignInWithSocialPressed():
return signInWithSocialPressed(_that);case SignInCanceled():
return signInCancelled(_that);case SignedOut():
return signedOut(_that);case Authenticated():
return authenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStarted value)?  authStarted,TResult? Function( SignInWithSocialPressed value)?  signInWithSocialPressed,TResult? Function( SignInCanceled value)?  signInCancelled,TResult? Function( SignedOut value)?  signedOut,TResult? Function( Authenticated value)?  authenticated,}){
final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted(_that);case SignInWithSocialPressed() when signInWithSocialPressed != null:
return signInWithSocialPressed(_that);case SignInCanceled() when signInCancelled != null:
return signInCancelled(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authStarted,TResult Function( SocialLoginType type)?  signInWithSocialPressed,TResult Function()?  signInCancelled,TResult Function()?  signedOut,TResult Function()?  authenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted();case SignInWithSocialPressed() when signInWithSocialPressed != null:
return signInWithSocialPressed(_that.type);case SignInCanceled() when signInCancelled != null:
return signInCancelled();case SignedOut() when signedOut != null:
return signedOut();case Authenticated() when authenticated != null:
return authenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authStarted,required TResult Function( SocialLoginType type)  signInWithSocialPressed,required TResult Function()  signInCancelled,required TResult Function()  signedOut,required TResult Function()  authenticated,}) {final _that = this;
switch (_that) {
case AuthStarted():
return authStarted();case SignInWithSocialPressed():
return signInWithSocialPressed(_that.type);case SignInCanceled():
return signInCancelled();case SignedOut():
return signedOut();case Authenticated():
return authenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authStarted,TResult? Function( SocialLoginType type)?  signInWithSocialPressed,TResult? Function()?  signInCancelled,TResult? Function()?  signedOut,TResult? Function()?  authenticated,}) {final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted();case SignInWithSocialPressed() when signInWithSocialPressed != null:
return signInWithSocialPressed(_that.type);case SignInCanceled() when signInCancelled != null:
return signInCancelled();case SignedOut() when signedOut != null:
return signedOut();case Authenticated() when authenticated != null:
return authenticated();case _:
  return null;

}
}

}

/// @nodoc


class AuthStarted implements AuthEvent {
  const AuthStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authStarted()';
}


}




/// @nodoc


class SignInWithSocialPressed implements AuthEvent {
  const SignInWithSocialPressed({required this.type});
  

 final  SocialLoginType type;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInWithSocialPressedCopyWith<SignInWithSocialPressed> get copyWith => _$SignInWithSocialPressedCopyWithImpl<SignInWithSocialPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithSocialPressed&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'AuthEvent.signInWithSocialPressed(type: $type)';
}


}

/// @nodoc
abstract mixin class $SignInWithSocialPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignInWithSocialPressedCopyWith(SignInWithSocialPressed value, $Res Function(SignInWithSocialPressed) _then) = _$SignInWithSocialPressedCopyWithImpl;
@useResult
$Res call({
 SocialLoginType type
});




}
/// @nodoc
class _$SignInWithSocialPressedCopyWithImpl<$Res>
    implements $SignInWithSocialPressedCopyWith<$Res> {
  _$SignInWithSocialPressedCopyWithImpl(this._self, this._then);

  final SignInWithSocialPressed _self;
  final $Res Function(SignInWithSocialPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(SignInWithSocialPressed(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SocialLoginType,
  ));
}


}

/// @nodoc


class SignInCanceled implements AuthEvent {
  const SignInCanceled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInCanceled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInCancelled()';
}


}




/// @nodoc


class SignedOut implements AuthEvent {
  const SignedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signedOut()';
}


}




/// @nodoc


class Authenticated implements AuthEvent {
  const Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authenticated()';
}


}




// dart format on
