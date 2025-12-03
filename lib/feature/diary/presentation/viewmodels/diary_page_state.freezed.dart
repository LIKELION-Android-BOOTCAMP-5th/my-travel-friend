// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryPageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryPageState()';
}


}

/// @nodoc
class $DiaryPageStateCopyWith<$Res>  {
$DiaryPageStateCopyWith(DiaryPageState _, $Res Function(DiaryPageState) __);
}


/// Adds pattern-matching-related methods to [DiaryPageState].
extension DiaryPageStatePatterns on DiaryPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiaryPageInitial value)?  initial,TResult Function( DiaryPageLoading value)?  loading,TResult Function( DiaryPageLoaded value)?  loaded,TResult Function( DiaryPageDetailLoaded value)?  detailLoaded,TResult Function( DiaryPageSuccess value)?  success,TResult Function( DiaryPageError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiaryPageInitial() when initial != null:
return initial(_that);case DiaryPageLoading() when loading != null:
return loading(_that);case DiaryPageLoaded() when loaded != null:
return loaded(_that);case DiaryPageDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case DiaryPageSuccess() when success != null:
return success(_that);case DiaryPageError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiaryPageInitial value)  initial,required TResult Function( DiaryPageLoading value)  loading,required TResult Function( DiaryPageLoaded value)  loaded,required TResult Function( DiaryPageDetailLoaded value)  detailLoaded,required TResult Function( DiaryPageSuccess value)  success,required TResult Function( DiaryPageError value)  error,}){
final _that = this;
switch (_that) {
case DiaryPageInitial():
return initial(_that);case DiaryPageLoading():
return loading(_that);case DiaryPageLoaded():
return loaded(_that);case DiaryPageDetailLoaded():
return detailLoaded(_that);case DiaryPageSuccess():
return success(_that);case DiaryPageError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiaryPageInitial value)?  initial,TResult? Function( DiaryPageLoading value)?  loading,TResult? Function( DiaryPageLoaded value)?  loaded,TResult? Function( DiaryPageDetailLoaded value)?  detailLoaded,TResult? Function( DiaryPageSuccess value)?  success,TResult? Function( DiaryPageError value)?  error,}){
final _that = this;
switch (_that) {
case DiaryPageInitial() when initial != null:
return initial(_that);case DiaryPageLoading() when loading != null:
return loading(_that);case DiaryPageLoaded() when loaded != null:
return loaded(_that);case DiaryPageDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case DiaryPageSuccess() when success != null:
return success(_that);case DiaryPageError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( DiaryEntity diary)?  detailLoaded,TResult Function( String? message,  String? actionType)?  success,TResult Function( String message,  String? errorType)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiaryPageInitial() when initial != null:
return initial();case DiaryPageLoading() when loading != null:
return loading();case DiaryPageLoaded() when loaded != null:
return loaded(_that.diaries,_that.allDiaries,_that.currentFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case DiaryPageDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.diary);case DiaryPageSuccess() when success != null:
return success(_that.message,_that.actionType);case DiaryPageError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( DiaryEntity diary)  detailLoaded,required TResult Function( String? message,  String? actionType)  success,required TResult Function( String message,  String? errorType)  error,}) {final _that = this;
switch (_that) {
case DiaryPageInitial():
return initial();case DiaryPageLoading():
return loading();case DiaryPageLoaded():
return loaded(_that.diaries,_that.allDiaries,_that.currentFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case DiaryPageDetailLoaded():
return detailLoaded(_that.diary);case DiaryPageSuccess():
return success(_that.message,_that.actionType);case DiaryPageError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( DiaryEntity diary)?  detailLoaded,TResult? Function( String? message,  String? actionType)?  success,TResult? Function( String message,  String? errorType)?  error,}) {final _that = this;
switch (_that) {
case DiaryPageInitial() when initial != null:
return initial();case DiaryPageLoading() when loading != null:
return loading();case DiaryPageLoaded() when loaded != null:
return loaded(_that.diaries,_that.allDiaries,_that.currentFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case DiaryPageDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.diary);case DiaryPageSuccess() when success != null:
return success(_that.message,_that.actionType);case DiaryPageError() when error != null:
return error(_that.message,_that.errorType);case _:
  return null;

}
}

}

/// @nodoc


class DiaryPageInitial implements DiaryPageState {
  const DiaryPageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryPageState.initial()';
}


}




/// @nodoc


class DiaryPageLoading implements DiaryPageState {
  const DiaryPageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryPageState.loading()';
}


}




/// @nodoc


class DiaryPageLoaded implements DiaryPageState {
  const DiaryPageLoaded({required final  List<DiaryEntity> diaries, required final  List<DiaryEntity> allDiaries, this.currentFilter, this.currentPage = 0, this.hasMore = false, this.isLoadingMore = false}): _diaries = diaries,_allDiaries = allDiaries;
  

 final  List<DiaryEntity> _diaries;
 List<DiaryEntity> get diaries {
  if (_diaries is EqualUnmodifiableListView) return _diaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diaries);
}

 final  List<DiaryEntity> _allDiaries;
 List<DiaryEntity> get allDiaries {
  if (_allDiaries is EqualUnmodifiableListView) return _allDiaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allDiaries);
}

 final  String? currentFilter;
@JsonKey() final  int currentPage;
@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryPageLoadedCopyWith<DiaryPageLoaded> get copyWith => _$DiaryPageLoadedCopyWithImpl<DiaryPageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageLoaded&&const DeepCollectionEquality().equals(other._diaries, _diaries)&&const DeepCollectionEquality().equals(other._allDiaries, _allDiaries)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_diaries),const DeepCollectionEquality().hash(_allDiaries),currentFilter,currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'DiaryPageState.loaded(diaries: $diaries, allDiaries: $allDiaries, currentFilter: $currentFilter, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $DiaryPageLoadedCopyWith<$Res> implements $DiaryPageStateCopyWith<$Res> {
  factory $DiaryPageLoadedCopyWith(DiaryPageLoaded value, $Res Function(DiaryPageLoaded) _then) = _$DiaryPageLoadedCopyWithImpl;
@useResult
$Res call({
 List<DiaryEntity> diaries, List<DiaryEntity> allDiaries, String? currentFilter, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$DiaryPageLoadedCopyWithImpl<$Res>
    implements $DiaryPageLoadedCopyWith<$Res> {
  _$DiaryPageLoadedCopyWithImpl(this._self, this._then);

  final DiaryPageLoaded _self;
  final $Res Function(DiaryPageLoaded) _then;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diaries = null,Object? allDiaries = null,Object? currentFilter = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(DiaryPageLoaded(
diaries: null == diaries ? _self._diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,allDiaries: null == allDiaries ? _self._allDiaries : allDiaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class DiaryPageDetailLoaded implements DiaryPageState {
  const DiaryPageDetailLoaded({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryPageDetailLoadedCopyWith<DiaryPageDetailLoaded> get copyWith => _$DiaryPageDetailLoadedCopyWithImpl<DiaryPageDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageDetailLoaded&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'DiaryPageState.detailLoaded(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $DiaryPageDetailLoadedCopyWith<$Res> implements $DiaryPageStateCopyWith<$Res> {
  factory $DiaryPageDetailLoadedCopyWith(DiaryPageDetailLoaded value, $Res Function(DiaryPageDetailLoaded) _then) = _$DiaryPageDetailLoadedCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$DiaryPageDetailLoadedCopyWithImpl<$Res>
    implements $DiaryPageDetailLoadedCopyWith<$Res> {
  _$DiaryPageDetailLoadedCopyWithImpl(this._self, this._then);

  final DiaryPageDetailLoaded _self;
  final $Res Function(DiaryPageDetailLoaded) _then;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(DiaryPageDetailLoaded(
diary: null == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as DiaryEntity,
  ));
}

/// Create a copy of DiaryPageState
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


class DiaryPageSuccess implements DiaryPageState {
  const DiaryPageSuccess({this.message, this.actionType});
  

 final  String? message;
 final  String? actionType;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryPageSuccessCopyWith<DiaryPageSuccess> get copyWith => _$DiaryPageSuccessCopyWithImpl<DiaryPageSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageSuccess&&(identical(other.message, message) || other.message == message)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,message,actionType);

@override
String toString() {
  return 'DiaryPageState.success(message: $message, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $DiaryPageSuccessCopyWith<$Res> implements $DiaryPageStateCopyWith<$Res> {
  factory $DiaryPageSuccessCopyWith(DiaryPageSuccess value, $Res Function(DiaryPageSuccess) _then) = _$DiaryPageSuccessCopyWithImpl;
@useResult
$Res call({
 String? message, String? actionType
});




}
/// @nodoc
class _$DiaryPageSuccessCopyWithImpl<$Res>
    implements $DiaryPageSuccessCopyWith<$Res> {
  _$DiaryPageSuccessCopyWithImpl(this._self, this._then);

  final DiaryPageSuccess _self;
  final $Res Function(DiaryPageSuccess) _then;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? actionType = freezed,}) {
  return _then(DiaryPageSuccess(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DiaryPageError implements DiaryPageState {
  const DiaryPageError({required this.message, this.errorType});
  

 final  String message;
 final  String? errorType;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryPageErrorCopyWith<DiaryPageError> get copyWith => _$DiaryPageErrorCopyWithImpl<DiaryPageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPageError&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType));
}


@override
int get hashCode => Object.hash(runtimeType,message,errorType);

@override
String toString() {
  return 'DiaryPageState.error(message: $message, errorType: $errorType)';
}


}

/// @nodoc
abstract mixin class $DiaryPageErrorCopyWith<$Res> implements $DiaryPageStateCopyWith<$Res> {
  factory $DiaryPageErrorCopyWith(DiaryPageError value, $Res Function(DiaryPageError) _then) = _$DiaryPageErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? errorType
});




}
/// @nodoc
class _$DiaryPageErrorCopyWithImpl<$Res>
    implements $DiaryPageErrorCopyWith<$Res> {
  _$DiaryPageErrorCopyWithImpl(this._self, this._then);

  final DiaryPageError _self;
  final $Res Function(DiaryPageError) _then;

/// Create a copy of DiaryPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? errorType = freezed,}) {
  return _then(DiaryPageError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
