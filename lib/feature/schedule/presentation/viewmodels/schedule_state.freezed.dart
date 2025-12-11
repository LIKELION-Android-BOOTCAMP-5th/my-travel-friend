// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleState {

// 전체 스케줄 원본
 List<ScheduleEntity> get schedules;// 날짜 필터링 결과
 List<ScheduleEntity> get dateFilteredSchedules;// 카테고리 필터링 결과
 List<ScheduleEntity> get categoryFilteredSchedules;// 최종 표시할 스케줄
 List<ScheduleEntity> get visibleSchedules;// 스케줄별 참여자 map
 Map<int, List<UserEntity>> get scheduleMembersMap;// 현재 선택된 날짜
 String? get selectedDate;// 현재 선택된 카테고리
 int? get selectedCategoryId;// 현재 필터링
 ScheduleFilterType? get currentFilter;// 페이징
 int get page; bool get hasMore;//페이지별 상태
 SchedulepageState get pageState;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;//메모 펼쳐지는지 아닌지 확인용
 bool get memoOpen;// 네비게이션 (작성 화면 이동)
 bool get navigateToCreate;// 네비게이션 (수정 화면 이동)
 bool get navigateToEdit;
/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleStateCopyWith<ScheduleState> get copyWith => _$ScheduleStateCopyWithImpl<ScheduleState>(this as ScheduleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleState&&const DeepCollectionEquality().equals(other.schedules, schedules)&&const DeepCollectionEquality().equals(other.dateFilteredSchedules, dateFilteredSchedules)&&const DeepCollectionEquality().equals(other.categoryFilteredSchedules, categoryFilteredSchedules)&&const DeepCollectionEquality().equals(other.visibleSchedules, visibleSchedules)&&const DeepCollectionEquality().equals(other.scheduleMembersMap, scheduleMembersMap)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.memoOpen, memoOpen) || other.memoOpen == memoOpen)&&(identical(other.navigateToCreate, navigateToCreate) || other.navigateToCreate == navigateToCreate)&&(identical(other.navigateToEdit, navigateToEdit) || other.navigateToEdit == navigateToEdit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedules),const DeepCollectionEquality().hash(dateFilteredSchedules),const DeepCollectionEquality().hash(categoryFilteredSchedules),const DeepCollectionEquality().hash(visibleSchedules),const DeepCollectionEquality().hash(scheduleMembersMap),selectedDate,selectedCategoryId,currentFilter,page,hasMore,pageState,message,errorType,actionType,memoOpen,navigateToCreate,navigateToEdit);

@override
String toString() {
  return 'ScheduleState(schedules: $schedules, dateFilteredSchedules: $dateFilteredSchedules, categoryFilteredSchedules: $categoryFilteredSchedules, visibleSchedules: $visibleSchedules, scheduleMembersMap: $scheduleMembersMap, selectedDate: $selectedDate, selectedCategoryId: $selectedCategoryId, currentFilter: $currentFilter, page: $page, hasMore: $hasMore, pageState: $pageState, message: $message, errorType: $errorType, actionType: $actionType, memoOpen: $memoOpen, navigateToCreate: $navigateToCreate, navigateToEdit: $navigateToEdit)';
}


}

/// @nodoc
abstract mixin class $ScheduleStateCopyWith<$Res>  {
  factory $ScheduleStateCopyWith(ScheduleState value, $Res Function(ScheduleState) _then) = _$ScheduleStateCopyWithImpl;
@useResult
$Res call({
 List<ScheduleEntity> schedules, List<ScheduleEntity> dateFilteredSchedules, List<ScheduleEntity> categoryFilteredSchedules, List<ScheduleEntity> visibleSchedules, Map<int, List<UserEntity>> scheduleMembersMap, String? selectedDate, int? selectedCategoryId, ScheduleFilterType? currentFilter, int page, bool hasMore, SchedulepageState pageState, String? message, String? errorType, String? actionType, bool memoOpen, bool navigateToCreate, bool navigateToEdit
});




}
/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._self, this._then);

  final ScheduleState _self;
  final $Res Function(ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedules = null,Object? dateFilteredSchedules = null,Object? categoryFilteredSchedules = null,Object? visibleSchedules = null,Object? scheduleMembersMap = null,Object? selectedDate = freezed,Object? selectedCategoryId = freezed,Object? currentFilter = freezed,Object? page = null,Object? hasMore = null,Object? pageState = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? memoOpen = null,Object? navigateToCreate = null,Object? navigateToEdit = null,}) {
  return _then(_self.copyWith(
schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,dateFilteredSchedules: null == dateFilteredSchedules ? _self.dateFilteredSchedules : dateFilteredSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,categoryFilteredSchedules: null == categoryFilteredSchedules ? _self.categoryFilteredSchedules : categoryFilteredSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,visibleSchedules: null == visibleSchedules ? _self.visibleSchedules : visibleSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,scheduleMembersMap: null == scheduleMembersMap ? _self.scheduleMembersMap : scheduleMembersMap // ignore: cast_nullable_to_non_nullable
as Map<int, List<UserEntity>>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as ScheduleFilterType?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as SchedulepageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,memoOpen: null == memoOpen ? _self.memoOpen : memoOpen // ignore: cast_nullable_to_non_nullable
as bool,navigateToCreate: null == navigateToCreate ? _self.navigateToCreate : navigateToCreate // ignore: cast_nullable_to_non_nullable
as bool,navigateToEdit: null == navigateToEdit ? _self.navigateToEdit : navigateToEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleState].
extension ScheduleStatePatterns on ScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScheduleEntity> schedules,  List<ScheduleEntity> dateFilteredSchedules,  List<ScheduleEntity> categoryFilteredSchedules,  List<ScheduleEntity> visibleSchedules,  Map<int, List<UserEntity>> scheduleMembersMap,  String? selectedDate,  int? selectedCategoryId,  ScheduleFilterType? currentFilter,  int page,  bool hasMore,  SchedulepageState pageState,  String? message,  String? errorType,  String? actionType,  bool memoOpen,  bool navigateToCreate,  bool navigateToEdit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.schedules,_that.dateFilteredSchedules,_that.categoryFilteredSchedules,_that.visibleSchedules,_that.scheduleMembersMap,_that.selectedDate,_that.selectedCategoryId,_that.currentFilter,_that.page,_that.hasMore,_that.pageState,_that.message,_that.errorType,_that.actionType,_that.memoOpen,_that.navigateToCreate,_that.navigateToEdit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScheduleEntity> schedules,  List<ScheduleEntity> dateFilteredSchedules,  List<ScheduleEntity> categoryFilteredSchedules,  List<ScheduleEntity> visibleSchedules,  Map<int, List<UserEntity>> scheduleMembersMap,  String? selectedDate,  int? selectedCategoryId,  ScheduleFilterType? currentFilter,  int page,  bool hasMore,  SchedulepageState pageState,  String? message,  String? errorType,  String? actionType,  bool memoOpen,  bool navigateToCreate,  bool navigateToEdit)  $default,) {final _that = this;
switch (_that) {
case _ScheduleState():
return $default(_that.schedules,_that.dateFilteredSchedules,_that.categoryFilteredSchedules,_that.visibleSchedules,_that.scheduleMembersMap,_that.selectedDate,_that.selectedCategoryId,_that.currentFilter,_that.page,_that.hasMore,_that.pageState,_that.message,_that.errorType,_that.actionType,_that.memoOpen,_that.navigateToCreate,_that.navigateToEdit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScheduleEntity> schedules,  List<ScheduleEntity> dateFilteredSchedules,  List<ScheduleEntity> categoryFilteredSchedules,  List<ScheduleEntity> visibleSchedules,  Map<int, List<UserEntity>> scheduleMembersMap,  String? selectedDate,  int? selectedCategoryId,  ScheduleFilterType? currentFilter,  int page,  bool hasMore,  SchedulepageState pageState,  String? message,  String? errorType,  String? actionType,  bool memoOpen,  bool navigateToCreate,  bool navigateToEdit)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.schedules,_that.dateFilteredSchedules,_that.categoryFilteredSchedules,_that.visibleSchedules,_that.scheduleMembersMap,_that.selectedDate,_that.selectedCategoryId,_that.currentFilter,_that.page,_that.hasMore,_that.pageState,_that.message,_that.errorType,_that.actionType,_that.memoOpen,_that.navigateToCreate,_that.navigateToEdit);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleState implements ScheduleState {
  const _ScheduleState({final  List<ScheduleEntity> schedules = const [], final  List<ScheduleEntity> dateFilteredSchedules = const [], final  List<ScheduleEntity> categoryFilteredSchedules = const [], final  List<ScheduleEntity> visibleSchedules = const [], final  Map<int, List<UserEntity>> scheduleMembersMap = const {}, this.selectedDate, this.selectedCategoryId, this.currentFilter, this.page = 1, this.hasMore = false, this.pageState = SchedulepageState.init, this.message, this.errorType, this.actionType, this.memoOpen = false, this.navigateToCreate = false, this.navigateToEdit = false}): _schedules = schedules,_dateFilteredSchedules = dateFilteredSchedules,_categoryFilteredSchedules = categoryFilteredSchedules,_visibleSchedules = visibleSchedules,_scheduleMembersMap = scheduleMembersMap;
  

// 전체 스케줄 원본
 final  List<ScheduleEntity> _schedules;
// 전체 스케줄 원본
@override@JsonKey() List<ScheduleEntity> get schedules {
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedules);
}

// 날짜 필터링 결과
 final  List<ScheduleEntity> _dateFilteredSchedules;
// 날짜 필터링 결과
@override@JsonKey() List<ScheduleEntity> get dateFilteredSchedules {
  if (_dateFilteredSchedules is EqualUnmodifiableListView) return _dateFilteredSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dateFilteredSchedules);
}

// 카테고리 필터링 결과
 final  List<ScheduleEntity> _categoryFilteredSchedules;
// 카테고리 필터링 결과
@override@JsonKey() List<ScheduleEntity> get categoryFilteredSchedules {
  if (_categoryFilteredSchedules is EqualUnmodifiableListView) return _categoryFilteredSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryFilteredSchedules);
}

// 최종 표시할 스케줄
 final  List<ScheduleEntity> _visibleSchedules;
// 최종 표시할 스케줄
@override@JsonKey() List<ScheduleEntity> get visibleSchedules {
  if (_visibleSchedules is EqualUnmodifiableListView) return _visibleSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visibleSchedules);
}

// 스케줄별 참여자 map
 final  Map<int, List<UserEntity>> _scheduleMembersMap;
// 스케줄별 참여자 map
@override@JsonKey() Map<int, List<UserEntity>> get scheduleMembersMap {
  if (_scheduleMembersMap is EqualUnmodifiableMapView) return _scheduleMembersMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scheduleMembersMap);
}

// 현재 선택된 날짜
@override final  String? selectedDate;
// 현재 선택된 카테고리
@override final  int? selectedCategoryId;
// 현재 필터링
@override final  ScheduleFilterType? currentFilter;
// 페이징
@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
//페이지별 상태
@override@JsonKey() final  SchedulepageState pageState;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
//메모 펼쳐지는지 아닌지 확인용
@override@JsonKey() final  bool memoOpen;
// 네비게이션 (작성 화면 이동)
@override@JsonKey() final  bool navigateToCreate;
// 네비게이션 (수정 화면 이동)
@override@JsonKey() final  bool navigateToEdit;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleStateCopyWith<_ScheduleState> get copyWith => __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleState&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&const DeepCollectionEquality().equals(other._dateFilteredSchedules, _dateFilteredSchedules)&&const DeepCollectionEquality().equals(other._categoryFilteredSchedules, _categoryFilteredSchedules)&&const DeepCollectionEquality().equals(other._visibleSchedules, _visibleSchedules)&&const DeepCollectionEquality().equals(other._scheduleMembersMap, _scheduleMembersMap)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.memoOpen, memoOpen) || other.memoOpen == memoOpen)&&(identical(other.navigateToCreate, navigateToCreate) || other.navigateToCreate == navigateToCreate)&&(identical(other.navigateToEdit, navigateToEdit) || other.navigateToEdit == navigateToEdit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedules),const DeepCollectionEquality().hash(_dateFilteredSchedules),const DeepCollectionEquality().hash(_categoryFilteredSchedules),const DeepCollectionEquality().hash(_visibleSchedules),const DeepCollectionEquality().hash(_scheduleMembersMap),selectedDate,selectedCategoryId,currentFilter,page,hasMore,pageState,message,errorType,actionType,memoOpen,navigateToCreate,navigateToEdit);

@override
String toString() {
  return 'ScheduleState(schedules: $schedules, dateFilteredSchedules: $dateFilteredSchedules, categoryFilteredSchedules: $categoryFilteredSchedules, visibleSchedules: $visibleSchedules, scheduleMembersMap: $scheduleMembersMap, selectedDate: $selectedDate, selectedCategoryId: $selectedCategoryId, currentFilter: $currentFilter, page: $page, hasMore: $hasMore, pageState: $pageState, message: $message, errorType: $errorType, actionType: $actionType, memoOpen: $memoOpen, navigateToCreate: $navigateToCreate, navigateToEdit: $navigateToEdit)';
}


}

/// @nodoc
abstract mixin class _$ScheduleStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(_ScheduleState value, $Res Function(_ScheduleState) _then) = __$ScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 List<ScheduleEntity> schedules, List<ScheduleEntity> dateFilteredSchedules, List<ScheduleEntity> categoryFilteredSchedules, List<ScheduleEntity> visibleSchedules, Map<int, List<UserEntity>> scheduleMembersMap, String? selectedDate, int? selectedCategoryId, ScheduleFilterType? currentFilter, int page, bool hasMore, SchedulepageState pageState, String? message, String? errorType, String? actionType, bool memoOpen, bool navigateToCreate, bool navigateToEdit
});




}
/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(this._self, this._then);

  final _ScheduleState _self;
  final $Res Function(_ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedules = null,Object? dateFilteredSchedules = null,Object? categoryFilteredSchedules = null,Object? visibleSchedules = null,Object? scheduleMembersMap = null,Object? selectedDate = freezed,Object? selectedCategoryId = freezed,Object? currentFilter = freezed,Object? page = null,Object? hasMore = null,Object? pageState = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? memoOpen = null,Object? navigateToCreate = null,Object? navigateToEdit = null,}) {
  return _then(_ScheduleState(
schedules: null == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,dateFilteredSchedules: null == dateFilteredSchedules ? _self._dateFilteredSchedules : dateFilteredSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,categoryFilteredSchedules: null == categoryFilteredSchedules ? _self._categoryFilteredSchedules : categoryFilteredSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,visibleSchedules: null == visibleSchedules ? _self._visibleSchedules : visibleSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,scheduleMembersMap: null == scheduleMembersMap ? _self._scheduleMembersMap : scheduleMembersMap // ignore: cast_nullable_to_non_nullable
as Map<int, List<UserEntity>>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as ScheduleFilterType?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as SchedulepageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,memoOpen: null == memoOpen ? _self.memoOpen : memoOpen // ignore: cast_nullable_to_non_nullable
as bool,navigateToCreate: null == navigateToCreate ? _self.navigateToCreate : navigateToCreate // ignore: cast_nullable_to_non_nullable
as bool,navigateToEdit: null == navigateToEdit ? _self.navigateToEdit : navigateToEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
