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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStarted value)?  authStarted,TResult Function( SignInWithGooglePressed value)?  signInWithGooglePressed,TResult Function( SignInWithKakaoPressed value)?  signInWithKakaoPressed,TResult Function( SignedOut value)?  signedOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted(_that);case SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case SignInWithKakaoPressed() when signInWithKakaoPressed != null:
return signInWithKakaoPressed(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStarted value)  authStarted,required TResult Function( SignInWithGooglePressed value)  signInWithGooglePressed,required TResult Function( SignInWithKakaoPressed value)  signInWithKakaoPressed,required TResult Function( SignedOut value)  signedOut,}){
final _that = this;
switch (_that) {
case AuthStarted():
return authStarted(_that);case SignInWithGooglePressed():
return signInWithGooglePressed(_that);case SignInWithKakaoPressed():
return signInWithKakaoPressed(_that);case SignedOut():
return signedOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStarted value)?  authStarted,TResult? Function( SignInWithGooglePressed value)?  signInWithGooglePressed,TResult? Function( SignInWithKakaoPressed value)?  signInWithKakaoPressed,TResult? Function( SignedOut value)?  signedOut,}){
final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted(_that);case SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case SignInWithKakaoPressed() when signInWithKakaoPressed != null:
return signInWithKakaoPressed(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authStarted,TResult Function()?  signInWithGooglePressed,TResult Function()?  signInWithKakaoPressed,TResult Function()?  signedOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted();case SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case SignInWithKakaoPressed() when signInWithKakaoPressed != null:
return signInWithKakaoPressed();case SignedOut() when signedOut != null:
return signedOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authStarted,required TResult Function()  signInWithGooglePressed,required TResult Function()  signInWithKakaoPressed,required TResult Function()  signedOut,}) {final _that = this;
switch (_that) {
case AuthStarted():
return authStarted();case SignInWithGooglePressed():
return signInWithGooglePressed();case SignInWithKakaoPressed():
return signInWithKakaoPressed();case SignedOut():
return signedOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authStarted,TResult? Function()?  signInWithGooglePressed,TResult? Function()?  signInWithKakaoPressed,TResult? Function()?  signedOut,}) {final _that = this;
switch (_that) {
case AuthStarted() when authStarted != null:
return authStarted();case SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case SignInWithKakaoPressed() when signInWithKakaoPressed != null:
return signInWithKakaoPressed();case SignedOut() when signedOut != null:
return signedOut();case _:
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


class SignInWithGooglePressed implements AuthEvent {
  const SignInWithGooglePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGooglePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithGooglePressed()';
}


}




/// @nodoc


class SignInWithKakaoPressed implements AuthEvent {
  const SignInWithKakaoPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithKakaoPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithKakaoPressed()';
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




// dart format on
