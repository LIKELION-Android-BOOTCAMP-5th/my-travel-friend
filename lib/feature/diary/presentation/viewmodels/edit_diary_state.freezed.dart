// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditDiaryState {

 DiaryEntity? get updatedDiary; String? get message; String? get errorType; EditDiaryPageState get pageState;
/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditDiaryStateCopyWith<EditDiaryState> get copyWith => _$EditDiaryStateCopyWithImpl<EditDiaryState>(this as EditDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDiaryState&&(identical(other.updatedDiary, updatedDiary) || other.updatedDiary == updatedDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,updatedDiary,message,errorType,pageState);

@override
String toString() {
  return 'EditDiaryState(updatedDiary: $updatedDiary, message: $message, errorType: $errorType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $EditDiaryStateCopyWith<$Res>  {
  factory $EditDiaryStateCopyWith(EditDiaryState value, $Res Function(EditDiaryState) _then) = _$EditDiaryStateCopyWithImpl;
@useResult
$Res call({
 DiaryEntity? updatedDiary, String? message, String? errorType, EditDiaryPageState pageState
});


$DiaryEntityCopyWith<$Res>? get updatedDiary;

}
/// @nodoc
class _$EditDiaryStateCopyWithImpl<$Res>
    implements $EditDiaryStateCopyWith<$Res> {
  _$EditDiaryStateCopyWithImpl(this._self, this._then);

  final EditDiaryState _self;
  final $Res Function(EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updatedDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
updatedDiary: freezed == updatedDiary ? _self.updatedDiary : updatedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditDiaryPageState,
  ));
}
/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get updatedDiary {
    if (_self.updatedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.updatedDiary!, (value) {
    return _then(_self.copyWith(updatedDiary: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditDiaryState].
extension EditDiaryStatePatterns on EditDiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditDiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditDiaryState value)  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditDiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DiaryEntity? updatedDiary,  String? message,  String? errorType,  EditDiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.updatedDiary,_that.message,_that.errorType,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DiaryEntity? updatedDiary,  String? message,  String? errorType,  EditDiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState():
return $default(_that.updatedDiary,_that.message,_that.errorType,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DiaryEntity? updatedDiary,  String? message,  String? errorType,  EditDiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.updatedDiary,_that.message,_that.errorType,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _EditDiaryState implements EditDiaryState {
  const _EditDiaryState({this.updatedDiary, this.message, this.errorType, this.pageState = EditDiaryPageState.init});
  

@override final  DiaryEntity? updatedDiary;
@override final  String? message;
@override final  String? errorType;
@override@JsonKey() final  EditDiaryPageState pageState;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditDiaryStateCopyWith<_EditDiaryState> get copyWith => __$EditDiaryStateCopyWithImpl<_EditDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditDiaryState&&(identical(other.updatedDiary, updatedDiary) || other.updatedDiary == updatedDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,updatedDiary,message,errorType,pageState);

@override
String toString() {
  return 'EditDiaryState(updatedDiary: $updatedDiary, message: $message, errorType: $errorType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$EditDiaryStateCopyWith<$Res> implements $EditDiaryStateCopyWith<$Res> {
  factory _$EditDiaryStateCopyWith(_EditDiaryState value, $Res Function(_EditDiaryState) _then) = __$EditDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 DiaryEntity? updatedDiary, String? message, String? errorType, EditDiaryPageState pageState
});


@override $DiaryEntityCopyWith<$Res>? get updatedDiary;

}
/// @nodoc
class __$EditDiaryStateCopyWithImpl<$Res>
    implements _$EditDiaryStateCopyWith<$Res> {
  __$EditDiaryStateCopyWithImpl(this._self, this._then);

  final _EditDiaryState _self;
  final $Res Function(_EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updatedDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? pageState = null,}) {
  return _then(_EditDiaryState(
updatedDiary: freezed == updatedDiary ? _self.updatedDiary : updatedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditDiaryPageState,
  ));
}

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get updatedDiary {
    if (_self.updatedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.updatedDiary!, (value) {
    return _then(_self.copyWith(updatedDiary: value));
  });
}
}

// dart format on
