// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryState()';
}


}

/// @nodoc
class $DiaryStateCopyWith<$Res>  {
$DiaryStateCopyWith(DiaryState _, $Res Function(DiaryState) __);
}


/// Adds pattern-matching-related methods to [DiaryState].
extension DiaryStatePatterns on DiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiaryInitial value)?  initial,TResult Function( DiaryLoading value)?  loading,TResult Function( DiaryLoaded value)?  loaded,TResult Function( DiaryDetailLoaded value)?  detailLoaded,TResult Function( DiarySuccess value)?  success,TResult Function( DiaryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiaryInitial() when initial != null:
return initial(_that);case DiaryLoading() when loading != null:
return loading(_that);case DiaryLoaded() when loaded != null:
return loaded(_that);case DiaryDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case DiarySuccess() when success != null:
return success(_that);case DiaryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiaryInitial value)  initial,required TResult Function( DiaryLoading value)  loading,required TResult Function( DiaryLoaded value)  loaded,required TResult Function( DiaryDetailLoaded value)  detailLoaded,required TResult Function( DiarySuccess value)  success,required TResult Function( DiaryError value)  error,}){
final _that = this;
switch (_that) {
case DiaryInitial():
return initial(_that);case DiaryLoading():
return loading(_that);case DiaryLoaded():
return loaded(_that);case DiaryDetailLoaded():
return detailLoaded(_that);case DiarySuccess():
return success(_that);case DiaryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiaryInitial value)?  initial,TResult? Function( DiaryLoading value)?  loading,TResult? Function( DiaryLoaded value)?  loaded,TResult? Function( DiaryDetailLoaded value)?  detailLoaded,TResult? Function( DiarySuccess value)?  success,TResult? Function( DiaryError value)?  error,}){
final _that = this;
switch (_that) {
case DiaryInitial() when initial != null:
return initial(_that);case DiaryLoading() when loading != null:
return loading(_that);case DiaryLoaded() when loaded != null:
return loaded(_that);case DiaryDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case DiarySuccess() when success != null:
return success(_that);case DiaryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DiaryEntity> diaries,  String? currentFilter)?  loaded,TResult Function( DiaryEntity diary)?  detailLoaded,TResult Function( String? message,  String? actionType)?  success,TResult Function( String message,  String? errorType)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiaryInitial() when initial != null:
return initial();case DiaryLoading() when loading != null:
return loading();case DiaryLoaded() when loaded != null:
return loaded(_that.diaries,_that.currentFilter);case DiaryDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.diary);case DiarySuccess() when success != null:
return success(_that.message,_that.actionType);case DiaryError() when error != null:
return error(_that.message,_that.errorType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DiaryEntity> diaries,  String? currentFilter)  loaded,required TResult Function( DiaryEntity diary)  detailLoaded,required TResult Function( String? message,  String? actionType)  success,required TResult Function( String message,  String? errorType)  error,}) {final _that = this;
switch (_that) {
case DiaryInitial():
return initial();case DiaryLoading():
return loading();case DiaryLoaded():
return loaded(_that.diaries,_that.currentFilter);case DiaryDetailLoaded():
return detailLoaded(_that.diary);case DiarySuccess():
return success(_that.message,_that.actionType);case DiaryError():
return error(_that.message,_that.errorType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DiaryEntity> diaries,  String? currentFilter)?  loaded,TResult? Function( DiaryEntity diary)?  detailLoaded,TResult? Function( String? message,  String? actionType)?  success,TResult? Function( String message,  String? errorType)?  error,}) {final _that = this;
switch (_that) {
case DiaryInitial() when initial != null:
return initial();case DiaryLoading() when loading != null:
return loading();case DiaryLoaded() when loaded != null:
return loaded(_that.diaries,_that.currentFilter);case DiaryDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.diary);case DiarySuccess() when success != null:
return success(_that.message,_that.actionType);case DiaryError() when error != null:
return error(_that.message,_that.errorType);case _:
  return null;

}
}

}

/// @nodoc


class DiaryInitial implements DiaryState {
  const DiaryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryState.initial()';
}


}




/// @nodoc


class DiaryLoading implements DiaryState {
  const DiaryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryState.loading()';
}


}




/// @nodoc


class DiaryLoaded implements DiaryState {
  const DiaryLoaded({required final  List<DiaryEntity> diaries, this.currentFilter}): _diaries = diaries;
  

 final  List<DiaryEntity> _diaries;
 List<DiaryEntity> get diaries {
  if (_diaries is EqualUnmodifiableListView) return _diaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diaries);
}

 final  String? currentFilter;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryLoadedCopyWith<DiaryLoaded> get copyWith => _$DiaryLoadedCopyWithImpl<DiaryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryLoaded&&const DeepCollectionEquality().equals(other._diaries, _diaries)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_diaries),currentFilter);

@override
String toString() {
  return 'DiaryState.loaded(diaries: $diaries, currentFilter: $currentFilter)';
}


}

/// @nodoc
abstract mixin class $DiaryLoadedCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryLoadedCopyWith(DiaryLoaded value, $Res Function(DiaryLoaded) _then) = _$DiaryLoadedCopyWithImpl;
@useResult
$Res call({
 List<DiaryEntity> diaries, String? currentFilter
});




}
/// @nodoc
class _$DiaryLoadedCopyWithImpl<$Res>
    implements $DiaryLoadedCopyWith<$Res> {
  _$DiaryLoadedCopyWithImpl(this._self, this._then);

  final DiaryLoaded _self;
  final $Res Function(DiaryLoaded) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diaries = null,Object? currentFilter = freezed,}) {
  return _then(DiaryLoaded(
diaries: null == diaries ? _self._diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DiaryDetailLoaded implements DiaryState {
  const DiaryDetailLoaded({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryDetailLoadedCopyWith<DiaryDetailLoaded> get copyWith => _$DiaryDetailLoadedCopyWithImpl<DiaryDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryDetailLoaded&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'DiaryState.detailLoaded(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $DiaryDetailLoadedCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryDetailLoadedCopyWith(DiaryDetailLoaded value, $Res Function(DiaryDetailLoaded) _then) = _$DiaryDetailLoadedCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$DiaryDetailLoadedCopyWithImpl<$Res>
    implements $DiaryDetailLoadedCopyWith<$Res> {
  _$DiaryDetailLoadedCopyWithImpl(this._self, this._then);

  final DiaryDetailLoaded _self;
  final $Res Function(DiaryDetailLoaded) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(DiaryDetailLoaded(
diary: null == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as DiaryEntity,
  ));
}

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res> get diary {
  
  return $DiaryEntityCopyWith<$Res>(_self.diary, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}

/// @nodoc


class DiarySuccess implements DiaryState {
  const DiarySuccess({this.message, this.actionType});
  

 final  String? message;
 final  String? actionType;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiarySuccessCopyWith<DiarySuccess> get copyWith => _$DiarySuccessCopyWithImpl<DiarySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiarySuccess&&(identical(other.message, message) || other.message == message)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,message,actionType);

@override
String toString() {
  return 'DiaryState.success(message: $message, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $DiarySuccessCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiarySuccessCopyWith(DiarySuccess value, $Res Function(DiarySuccess) _then) = _$DiarySuccessCopyWithImpl;
@useResult
$Res call({
 String? message, String? actionType
});




}
/// @nodoc
class _$DiarySuccessCopyWithImpl<$Res>
    implements $DiarySuccessCopyWith<$Res> {
  _$DiarySuccessCopyWithImpl(this._self, this._then);

  final DiarySuccess _self;
  final $Res Function(DiarySuccess) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? actionType = freezed,}) {
  return _then(DiarySuccess(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DiaryError implements DiaryState {
  const DiaryError({required this.message, this.errorType});
  

 final  String message;
 final  String? errorType;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryErrorCopyWith<DiaryError> get copyWith => _$DiaryErrorCopyWithImpl<DiaryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryError&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType));
}


@override
int get hashCode => Object.hash(runtimeType,message,errorType);

@override
String toString() {
  return 'DiaryState.error(message: $message, errorType: $errorType)';
}


}

/// @nodoc
abstract mixin class $DiaryErrorCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryErrorCopyWith(DiaryError value, $Res Function(DiaryError) _then) = _$DiaryErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? errorType
});




}
/// @nodoc
class _$DiaryErrorCopyWithImpl<$Res>
    implements $DiaryErrorCopyWith<$Res> {
  _$DiaryErrorCopyWithImpl(this._self, this._then);

  final DiaryError _self;
  final $Res Function(DiaryError) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? errorType = freezed,}) {
  return _then(DiaryError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
