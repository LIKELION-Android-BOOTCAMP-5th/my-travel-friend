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

// 조회 정보
 int get tripId; int? get userId; bool get isMyDiaries;// 다이어리 목록 데이터
 List<DiaryEntity> get diaries; List<DiaryEntity> get allDiaries; String? get currentFilter;// 상세 조회 데이터
 DiaryEntity? get selectedDiary;// 페이지네이션
 int get currentPage; bool get hasMore; bool get isLoadingMore;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;// 페이지 상태
 DiaryPageState get pageState;
/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryStateCopyWith<DiaryState> get copyWith => _$DiaryStateCopyWithImpl<DiaryState>(this as DiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isMyDiaries, isMyDiaries) || other.isMyDiaries == isMyDiaries)&&const DeepCollectionEquality().equals(other.diaries, diaries)&&const DeepCollectionEquality().equals(other.allDiaries, allDiaries)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.selectedDiary, selectedDiary) || other.selectedDiary == selectedDiary)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,isMyDiaries,const DeepCollectionEquality().hash(diaries),const DeepCollectionEquality().hash(allDiaries),currentFilter,selectedDiary,currentPage,hasMore,isLoadingMore,message,errorType,actionType,pageState);

@override
String toString() {
  return 'DiaryState(tripId: $tripId, userId: $userId, isMyDiaries: $isMyDiaries, diaries: $diaries, allDiaries: $allDiaries, currentFilter: $currentFilter, selectedDiary: $selectedDiary, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $DiaryStateCopyWith<$Res>  {
  factory $DiaryStateCopyWith(DiaryState value, $Res Function(DiaryState) _then) = _$DiaryStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int? userId, bool isMyDiaries, List<DiaryEntity> diaries, List<DiaryEntity> allDiaries, String? currentFilter, DiaryEntity? selectedDiary, int currentPage, bool hasMore, bool isLoadingMore, String? message, String? errorType, String? actionType, DiaryPageState pageState
});


$DiaryEntityCopyWith<$Res>? get selectedDiary;

}
/// @nodoc
class _$DiaryStateCopyWithImpl<$Res>
    implements $DiaryStateCopyWith<$Res> {
  _$DiaryStateCopyWithImpl(this._self, this._then);

  final DiaryState _self;
  final $Res Function(DiaryState) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = freezed,Object? isMyDiaries = null,Object? diaries = null,Object? allDiaries = null,Object? currentFilter = freezed,Object? selectedDiary = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,isMyDiaries: null == isMyDiaries ? _self.isMyDiaries : isMyDiaries // ignore: cast_nullable_to_non_nullable
as bool,diaries: null == diaries ? _self.diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,allDiaries: null == allDiaries ? _self.allDiaries : allDiaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,selectedDiary: freezed == selectedDiary ? _self.selectedDiary : selectedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as DiaryPageState,
  ));
}
/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get selectedDiary {
    if (_self.selectedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.selectedDiary!, (value) {
    return _then(_self.copyWith(selectedDiary: value));
  });
}
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryState value)  $default,){
final _that = this;
switch (_that) {
case _DiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int? userId,  bool isMyDiaries,  List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  DiaryEntity? selectedDiary,  int currentPage,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType,  DiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.diaries,_that.allDiaries,_that.currentFilter,_that.selectedDiary,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int? userId,  bool isMyDiaries,  List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  DiaryEntity? selectedDiary,  int currentPage,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType,  DiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _DiaryState():
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.diaries,_that.allDiaries,_that.currentFilter,_that.selectedDiary,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int? userId,  bool isMyDiaries,  List<DiaryEntity> diaries,  List<DiaryEntity> allDiaries,  String? currentFilter,  DiaryEntity? selectedDiary,  int currentPage,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType,  DiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.diaries,_that.allDiaries,_that.currentFilter,_that.selectedDiary,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryState implements DiaryState {
  const _DiaryState({this.tripId = 0, this.userId, this.isMyDiaries = false, final  List<DiaryEntity> diaries = const [], final  List<DiaryEntity> allDiaries = const [], this.currentFilter, this.selectedDiary, this.currentPage = 0, this.hasMore = false, this.isLoadingMore = false, this.message, this.errorType, this.actionType, this.pageState = DiaryPageState.init}): _diaries = diaries,_allDiaries = allDiaries;
  

// 조회 정보
@override@JsonKey() final  int tripId;
@override final  int? userId;
@override@JsonKey() final  bool isMyDiaries;
// 다이어리 목록 데이터
 final  List<DiaryEntity> _diaries;
// 다이어리 목록 데이터
@override@JsonKey() List<DiaryEntity> get diaries {
  if (_diaries is EqualUnmodifiableListView) return _diaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diaries);
}

 final  List<DiaryEntity> _allDiaries;
@override@JsonKey() List<DiaryEntity> get allDiaries {
  if (_allDiaries is EqualUnmodifiableListView) return _allDiaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allDiaries);
}

@override final  String? currentFilter;
// 상세 조회 데이터
@override final  DiaryEntity? selectedDiary;
// 페이지네이션
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
// 페이지 상태
@override@JsonKey() final  DiaryPageState pageState;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryStateCopyWith<_DiaryState> get copyWith => __$DiaryStateCopyWithImpl<_DiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isMyDiaries, isMyDiaries) || other.isMyDiaries == isMyDiaries)&&const DeepCollectionEquality().equals(other._diaries, _diaries)&&const DeepCollectionEquality().equals(other._allDiaries, _allDiaries)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.selectedDiary, selectedDiary) || other.selectedDiary == selectedDiary)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,isMyDiaries,const DeepCollectionEquality().hash(_diaries),const DeepCollectionEquality().hash(_allDiaries),currentFilter,selectedDiary,currentPage,hasMore,isLoadingMore,message,errorType,actionType,pageState);

@override
String toString() {
  return 'DiaryState(tripId: $tripId, userId: $userId, isMyDiaries: $isMyDiaries, diaries: $diaries, allDiaries: $allDiaries, currentFilter: $currentFilter, selectedDiary: $selectedDiary, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$DiaryStateCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory _$DiaryStateCopyWith(_DiaryState value, $Res Function(_DiaryState) _then) = __$DiaryStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int? userId, bool isMyDiaries, List<DiaryEntity> diaries, List<DiaryEntity> allDiaries, String? currentFilter, DiaryEntity? selectedDiary, int currentPage, bool hasMore, bool isLoadingMore, String? message, String? errorType, String? actionType, DiaryPageState pageState
});


@override $DiaryEntityCopyWith<$Res>? get selectedDiary;

}
/// @nodoc
class __$DiaryStateCopyWithImpl<$Res>
    implements _$DiaryStateCopyWith<$Res> {
  __$DiaryStateCopyWithImpl(this._self, this._then);

  final _DiaryState _self;
  final $Res Function(_DiaryState) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = freezed,Object? isMyDiaries = null,Object? diaries = null,Object? allDiaries = null,Object? currentFilter = freezed,Object? selectedDiary = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_DiaryState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,isMyDiaries: null == isMyDiaries ? _self.isMyDiaries : isMyDiaries // ignore: cast_nullable_to_non_nullable
as bool,diaries: null == diaries ? _self._diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,allDiaries: null == allDiaries ? _self._allDiaries : allDiaries // ignore: cast_nullable_to_non_nullable
as List<DiaryEntity>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,selectedDiary: freezed == selectedDiary ? _self.selectedDiary : selectedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as DiaryPageState,
  ));
}

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get selectedDiary {
    if (_self.selectedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.selectedDiary!, (value) {
    return _then(_self.copyWith(selectedDiary: value));
  });
}
}

// dart format on
