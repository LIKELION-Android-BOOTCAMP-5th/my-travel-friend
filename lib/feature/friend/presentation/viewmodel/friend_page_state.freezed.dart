// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendPageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendPageState()';
}


}

/// @nodoc
class $FriendPageStateCopyWith<$Res>  {
$FriendPageStateCopyWith(FriendPageState _, $Res Function(FriendPageState) __);
}


/// Adds pattern-matching-related methods to [FriendPageState].
extension FriendPageStatePatterns on FriendPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FriendPageInitial value)?  initial,TResult Function( FriendPageLoading value)?  loading,TResult Function( FriendPageLoaded value)?  loaded,TResult Function( FriendPageError value)?  error,TResult Function( FriendPageSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FriendPageInitial() when initial != null:
return initial(_that);case FriendPageLoading() when loading != null:
return loading(_that);case FriendPageLoaded() when loaded != null:
return loaded(_that);case FriendPageError() when error != null:
return error(_that);case FriendPageSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FriendPageInitial value)  initial,required TResult Function( FriendPageLoading value)  loading,required TResult Function( FriendPageLoaded value)  loaded,required TResult Function( FriendPageError value)  error,required TResult Function( FriendPageSuccess value)  success,}){
final _that = this;
switch (_that) {
case FriendPageInitial():
return initial(_that);case FriendPageLoading():
return loading(_that);case FriendPageLoaded():
return loaded(_that);case FriendPageError():
return error(_that);case FriendPageSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FriendPageInitial value)?  initial,TResult? Function( FriendPageLoading value)?  loading,TResult? Function( FriendPageLoaded value)?  loaded,TResult? Function( FriendPageError value)?  error,TResult? Function( FriendPageSuccess value)?  success,}){
final _that = this;
switch (_that) {
case FriendPageInitial() when initial != null:
return initial(_that);case FriendPageLoading() when loading != null:
return loading(_that);case FriendPageLoaded() when loaded != null:
return loaded(_that);case FriendPageError() when error != null:
return error(_that);case FriendPageSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FriendEntity> friends)?  loaded,TResult Function( String message,  String? errorType)?  error,TResult Function( String? message,  String? actionType)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FriendPageInitial() when initial != null:
return initial();case FriendPageLoading() when loading != null:
return loading();case FriendPageLoaded() when loaded != null:
return loaded(_that.friends);case FriendPageError() when error != null:
return error(_that.message,_that.errorType);case FriendPageSuccess() when success != null:
return success(_that.message,_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FriendEntity> friends)  loaded,required TResult Function( String message,  String? errorType)  error,required TResult Function( String? message,  String? actionType)  success,}) {final _that = this;
switch (_that) {
case FriendPageInitial():
return initial();case FriendPageLoading():
return loading();case FriendPageLoaded():
return loaded(_that.friends);case FriendPageError():
return error(_that.message,_that.errorType);case FriendPageSuccess():
return success(_that.message,_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FriendEntity> friends)?  loaded,TResult? Function( String message,  String? errorType)?  error,TResult? Function( String? message,  String? actionType)?  success,}) {final _that = this;
switch (_that) {
case FriendPageInitial() when initial != null:
return initial();case FriendPageLoading() when loading != null:
return loading();case FriendPageLoaded() when loaded != null:
return loaded(_that.friends);case FriendPageError() when error != null:
return error(_that.message,_that.errorType);case FriendPageSuccess() when success != null:
return success(_that.message,_that.actionType);case _:
  return null;

}
}

}

/// @nodoc


class FriendPageInitial implements FriendPageState {
  const FriendPageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendPageState.initial()';
}


}




/// @nodoc


class FriendPageLoading implements FriendPageState {
  const FriendPageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendPageState.loading()';
}


}




/// @nodoc


class FriendPageLoaded implements FriendPageState {
  const FriendPageLoaded({required final  List<FriendEntity> friends}): _friends = friends;
  

 final  List<FriendEntity> _friends;
 List<FriendEntity> get friends {
  if (_friends is EqualUnmodifiableListView) return _friends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friends);
}


/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendPageLoadedCopyWith<FriendPageLoaded> get copyWith => _$FriendPageLoadedCopyWithImpl<FriendPageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageLoaded&&const DeepCollectionEquality().equals(other._friends, _friends));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_friends));

@override
String toString() {
  return 'FriendPageState.loaded(friends: $friends)';
}


}

/// @nodoc
abstract mixin class $FriendPageLoadedCopyWith<$Res> implements $FriendPageStateCopyWith<$Res> {
  factory $FriendPageLoadedCopyWith(FriendPageLoaded value, $Res Function(FriendPageLoaded) _then) = _$FriendPageLoadedCopyWithImpl;
@useResult
$Res call({
 List<FriendEntity> friends
});




}
/// @nodoc
class _$FriendPageLoadedCopyWithImpl<$Res>
    implements $FriendPageLoadedCopyWith<$Res> {
  _$FriendPageLoadedCopyWithImpl(this._self, this._then);

  final FriendPageLoaded _self;
  final $Res Function(FriendPageLoaded) _then;

/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? friends = null,}) {
  return _then(FriendPageLoaded(
friends: null == friends ? _self._friends : friends // ignore: cast_nullable_to_non_nullable
as List<FriendEntity>,
  ));
}


}

/// @nodoc


class FriendPageError implements FriendPageState {
  const FriendPageError({required this.message, this.errorType});
  

 final  String message;
 final  String? errorType;

/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendPageErrorCopyWith<FriendPageError> get copyWith => _$FriendPageErrorCopyWithImpl<FriendPageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageError&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType));
}


@override
int get hashCode => Object.hash(runtimeType,message,errorType);

@override
String toString() {
  return 'FriendPageState.error(message: $message, errorType: $errorType)';
}


}

/// @nodoc
abstract mixin class $FriendPageErrorCopyWith<$Res> implements $FriendPageStateCopyWith<$Res> {
  factory $FriendPageErrorCopyWith(FriendPageError value, $Res Function(FriendPageError) _then) = _$FriendPageErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? errorType
});




}
/// @nodoc
class _$FriendPageErrorCopyWithImpl<$Res>
    implements $FriendPageErrorCopyWith<$Res> {
  _$FriendPageErrorCopyWithImpl(this._self, this._then);

  final FriendPageError _self;
  final $Res Function(FriendPageError) _then;

/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? errorType = freezed,}) {
  return _then(FriendPageError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FriendPageSuccess implements FriendPageState {
  const FriendPageSuccess({this.message, this.actionType});
  

 final  String? message;
 final  String? actionType;

/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendPageSuccessCopyWith<FriendPageSuccess> get copyWith => _$FriendPageSuccessCopyWithImpl<FriendPageSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendPageSuccess&&(identical(other.message, message) || other.message == message)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,message,actionType);

@override
String toString() {
  return 'FriendPageState.success(message: $message, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $FriendPageSuccessCopyWith<$Res> implements $FriendPageStateCopyWith<$Res> {
  factory $FriendPageSuccessCopyWith(FriendPageSuccess value, $Res Function(FriendPageSuccess) _then) = _$FriendPageSuccessCopyWithImpl;
@useResult
$Res call({
 String? message, String? actionType
});




}
/// @nodoc
class _$FriendPageSuccessCopyWithImpl<$Res>
    implements $FriendPageSuccessCopyWith<$Res> {
  _$FriendPageSuccessCopyWithImpl(this._self, this._then);

  final FriendPageSuccess _self;
  final $Res Function(FriendPageSuccess) _then;

/// Create a copy of FriendPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? actionType = freezed,}) {
  return _then(FriendPageSuccess(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
