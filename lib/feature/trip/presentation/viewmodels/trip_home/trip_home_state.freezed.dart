// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripHomeState {

 int? get tripId; TripEntity? get trip;// 로그인 사용자 id
 int? get myId;// Crew
 List<UserEntity> get crewMembers; bool get isCrewExpanded;// 친구 초대
 List<UserEntity> get friendCandidates; bool get isInviteMode;// 날짜
 DateTime? get selectedDate;// 여행기간 (선택 가능 범위)
 DateTime? get tripStartDate; DateTime? get tripEndDate;// 일정
 List<ScheduleEntity> get allSchedules;// 전체 원본 (페이지1)
 List<ScheduleEntity> get schedulesForSelectedDate;// 현지표현
 List<UsefulPharseEntity> get usefulPhrases; bool get isUsefulPhraseExpanded; List<List<DateTime?>> get calendarPages; int get currentCalendarPage;// 상태
 TripHomePageState get pageState;// 메시지/액션
 String? get message; String? get errorType; String? get actionType;
/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripHomeStateCopyWith<TripHomeState> get copyWith => _$TripHomeStateCopyWithImpl<TripHomeState>(this as TripHomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripHomeState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.myId, myId) || other.myId == myId)&&const DeepCollectionEquality().equals(other.crewMembers, crewMembers)&&(identical(other.isCrewExpanded, isCrewExpanded) || other.isCrewExpanded == isCrewExpanded)&&const DeepCollectionEquality().equals(other.friendCandidates, friendCandidates)&&(identical(other.isInviteMode, isInviteMode) || other.isInviteMode == isInviteMode)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.tripStartDate, tripStartDate) || other.tripStartDate == tripStartDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&const DeepCollectionEquality().equals(other.allSchedules, allSchedules)&&const DeepCollectionEquality().equals(other.schedulesForSelectedDate, schedulesForSelectedDate)&&const DeepCollectionEquality().equals(other.usefulPhrases, usefulPhrases)&&(identical(other.isUsefulPhraseExpanded, isUsefulPhraseExpanded) || other.isUsefulPhraseExpanded == isUsefulPhraseExpanded)&&const DeepCollectionEquality().equals(other.calendarPages, calendarPages)&&(identical(other.currentCalendarPage, currentCalendarPage) || other.currentCalendarPage == currentCalendarPage)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,trip,myId,const DeepCollectionEquality().hash(crewMembers),isCrewExpanded,const DeepCollectionEquality().hash(friendCandidates),isInviteMode,selectedDate,tripStartDate,tripEndDate,const DeepCollectionEquality().hash(allSchedules),const DeepCollectionEquality().hash(schedulesForSelectedDate),const DeepCollectionEquality().hash(usefulPhrases),isUsefulPhraseExpanded,const DeepCollectionEquality().hash(calendarPages),currentCalendarPage,pageState,message,errorType,actionType]);

@override
String toString() {
  return 'TripHomeState(tripId: $tripId, trip: $trip, myId: $myId, crewMembers: $crewMembers, isCrewExpanded: $isCrewExpanded, friendCandidates: $friendCandidates, isInviteMode: $isInviteMode, selectedDate: $selectedDate, tripStartDate: $tripStartDate, tripEndDate: $tripEndDate, allSchedules: $allSchedules, schedulesForSelectedDate: $schedulesForSelectedDate, usefulPhrases: $usefulPhrases, isUsefulPhraseExpanded: $isUsefulPhraseExpanded, calendarPages: $calendarPages, currentCalendarPage: $currentCalendarPage, pageState: $pageState, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $TripHomeStateCopyWith<$Res>  {
  factory $TripHomeStateCopyWith(TripHomeState value, $Res Function(TripHomeState) _then) = _$TripHomeStateCopyWithImpl;
@useResult
$Res call({
 int? tripId, TripEntity? trip, int? myId, List<UserEntity> crewMembers, bool isCrewExpanded, List<UserEntity> friendCandidates, bool isInviteMode, DateTime? selectedDate, DateTime? tripStartDate, DateTime? tripEndDate, List<ScheduleEntity> allSchedules, List<ScheduleEntity> schedulesForSelectedDate, List<UsefulPharseEntity> usefulPhrases, bool isUsefulPhraseExpanded, List<List<DateTime?>> calendarPages, int currentCalendarPage, TripHomePageState pageState, String? message, String? errorType, String? actionType
});


$TripEntityCopyWith<$Res>? get trip;

}
/// @nodoc
class _$TripHomeStateCopyWithImpl<$Res>
    implements $TripHomeStateCopyWith<$Res> {
  _$TripHomeStateCopyWithImpl(this._self, this._then);

  final TripHomeState _self;
  final $Res Function(TripHomeState) _then;

/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? trip = freezed,Object? myId = freezed,Object? crewMembers = null,Object? isCrewExpanded = null,Object? friendCandidates = null,Object? isInviteMode = null,Object? selectedDate = freezed,Object? tripStartDate = freezed,Object? tripEndDate = freezed,Object? allSchedules = null,Object? schedulesForSelectedDate = null,Object? usefulPhrases = null,Object? isUsefulPhraseExpanded = null,Object? calendarPages = null,Object? currentCalendarPage = null,Object? pageState = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripEntity?,myId: freezed == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int?,crewMembers: null == crewMembers ? _self.crewMembers : crewMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isCrewExpanded: null == isCrewExpanded ? _self.isCrewExpanded : isCrewExpanded // ignore: cast_nullable_to_non_nullable
as bool,friendCandidates: null == friendCandidates ? _self.friendCandidates : friendCandidates // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isInviteMode: null == isInviteMode ? _self.isInviteMode : isInviteMode // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripStartDate: freezed == tripStartDate ? _self.tripStartDate : tripStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allSchedules: null == allSchedules ? _self.allSchedules : allSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,schedulesForSelectedDate: null == schedulesForSelectedDate ? _self.schedulesForSelectedDate : schedulesForSelectedDate // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,usefulPhrases: null == usefulPhrases ? _self.usefulPhrases : usefulPhrases // ignore: cast_nullable_to_non_nullable
as List<UsefulPharseEntity>,isUsefulPhraseExpanded: null == isUsefulPhraseExpanded ? _self.isUsefulPhraseExpanded : isUsefulPhraseExpanded // ignore: cast_nullable_to_non_nullable
as bool,calendarPages: null == calendarPages ? _self.calendarPages : calendarPages // ignore: cast_nullable_to_non_nullable
as List<List<DateTime?>>,currentCalendarPage: null == currentCalendarPage ? _self.currentCalendarPage : currentCalendarPage // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripHomePageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripHomeState].
extension TripHomeStatePatterns on TripHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripHomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripHomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripHomeState value)  $default,){
final _that = this;
switch (_that) {
case _TripHomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripHomeState value)?  $default,){
final _that = this;
switch (_that) {
case _TripHomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tripId,  TripEntity? trip,  int? myId,  List<UserEntity> crewMembers,  bool isCrewExpanded,  List<UserEntity> friendCandidates,  bool isInviteMode,  DateTime? selectedDate,  DateTime? tripStartDate,  DateTime? tripEndDate,  List<ScheduleEntity> allSchedules,  List<ScheduleEntity> schedulesForSelectedDate,  List<UsefulPharseEntity> usefulPhrases,  bool isUsefulPhraseExpanded,  List<List<DateTime?>> calendarPages,  int currentCalendarPage,  TripHomePageState pageState,  String? message,  String? errorType,  String? actionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripHomeState() when $default != null:
return $default(_that.tripId,_that.trip,_that.myId,_that.crewMembers,_that.isCrewExpanded,_that.friendCandidates,_that.isInviteMode,_that.selectedDate,_that.tripStartDate,_that.tripEndDate,_that.allSchedules,_that.schedulesForSelectedDate,_that.usefulPhrases,_that.isUsefulPhraseExpanded,_that.calendarPages,_that.currentCalendarPage,_that.pageState,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tripId,  TripEntity? trip,  int? myId,  List<UserEntity> crewMembers,  bool isCrewExpanded,  List<UserEntity> friendCandidates,  bool isInviteMode,  DateTime? selectedDate,  DateTime? tripStartDate,  DateTime? tripEndDate,  List<ScheduleEntity> allSchedules,  List<ScheduleEntity> schedulesForSelectedDate,  List<UsefulPharseEntity> usefulPhrases,  bool isUsefulPhraseExpanded,  List<List<DateTime?>> calendarPages,  int currentCalendarPage,  TripHomePageState pageState,  String? message,  String? errorType,  String? actionType)  $default,) {final _that = this;
switch (_that) {
case _TripHomeState():
return $default(_that.tripId,_that.trip,_that.myId,_that.crewMembers,_that.isCrewExpanded,_that.friendCandidates,_that.isInviteMode,_that.selectedDate,_that.tripStartDate,_that.tripEndDate,_that.allSchedules,_that.schedulesForSelectedDate,_that.usefulPhrases,_that.isUsefulPhraseExpanded,_that.calendarPages,_that.currentCalendarPage,_that.pageState,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tripId,  TripEntity? trip,  int? myId,  List<UserEntity> crewMembers,  bool isCrewExpanded,  List<UserEntity> friendCandidates,  bool isInviteMode,  DateTime? selectedDate,  DateTime? tripStartDate,  DateTime? tripEndDate,  List<ScheduleEntity> allSchedules,  List<ScheduleEntity> schedulesForSelectedDate,  List<UsefulPharseEntity> usefulPhrases,  bool isUsefulPhraseExpanded,  List<List<DateTime?>> calendarPages,  int currentCalendarPage,  TripHomePageState pageState,  String? message,  String? errorType,  String? actionType)?  $default,) {final _that = this;
switch (_that) {
case _TripHomeState() when $default != null:
return $default(_that.tripId,_that.trip,_that.myId,_that.crewMembers,_that.isCrewExpanded,_that.friendCandidates,_that.isInviteMode,_that.selectedDate,_that.tripStartDate,_that.tripEndDate,_that.allSchedules,_that.schedulesForSelectedDate,_that.usefulPhrases,_that.isUsefulPhraseExpanded,_that.calendarPages,_that.currentCalendarPage,_that.pageState,_that.message,_that.errorType,_that.actionType);case _:
  return null;

}
}

}

/// @nodoc


class _TripHomeState implements TripHomeState {
  const _TripHomeState({this.tripId, this.trip, this.myId, final  List<UserEntity> crewMembers = const [], this.isCrewExpanded = false, final  List<UserEntity> friendCandidates = const [], this.isInviteMode = false, this.selectedDate, this.tripStartDate, this.tripEndDate, final  List<ScheduleEntity> allSchedules = const [], final  List<ScheduleEntity> schedulesForSelectedDate = const [], final  List<UsefulPharseEntity> usefulPhrases = const [], this.isUsefulPhraseExpanded = false, final  List<List<DateTime?>> calendarPages = const [], this.currentCalendarPage = 0, this.pageState = TripHomePageState.init, this.message, this.errorType, this.actionType}): _crewMembers = crewMembers,_friendCandidates = friendCandidates,_allSchedules = allSchedules,_schedulesForSelectedDate = schedulesForSelectedDate,_usefulPhrases = usefulPhrases,_calendarPages = calendarPages;
  

@override final  int? tripId;
@override final  TripEntity? trip;
// 로그인 사용자 id
@override final  int? myId;
// Crew
 final  List<UserEntity> _crewMembers;
// Crew
@override@JsonKey() List<UserEntity> get crewMembers {
  if (_crewMembers is EqualUnmodifiableListView) return _crewMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crewMembers);
}

@override@JsonKey() final  bool isCrewExpanded;
// 친구 초대
 final  List<UserEntity> _friendCandidates;
// 친구 초대
@override@JsonKey() List<UserEntity> get friendCandidates {
  if (_friendCandidates is EqualUnmodifiableListView) return _friendCandidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friendCandidates);
}

@override@JsonKey() final  bool isInviteMode;
// 날짜
@override final  DateTime? selectedDate;
// 여행기간 (선택 가능 범위)
@override final  DateTime? tripStartDate;
@override final  DateTime? tripEndDate;
// 일정
 final  List<ScheduleEntity> _allSchedules;
// 일정
@override@JsonKey() List<ScheduleEntity> get allSchedules {
  if (_allSchedules is EqualUnmodifiableListView) return _allSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allSchedules);
}

// 전체 원본 (페이지1)
 final  List<ScheduleEntity> _schedulesForSelectedDate;
// 전체 원본 (페이지1)
@override@JsonKey() List<ScheduleEntity> get schedulesForSelectedDate {
  if (_schedulesForSelectedDate is EqualUnmodifiableListView) return _schedulesForSelectedDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedulesForSelectedDate);
}

// 현지표현
 final  List<UsefulPharseEntity> _usefulPhrases;
// 현지표현
@override@JsonKey() List<UsefulPharseEntity> get usefulPhrases {
  if (_usefulPhrases is EqualUnmodifiableListView) return _usefulPhrases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usefulPhrases);
}

@override@JsonKey() final  bool isUsefulPhraseExpanded;
 final  List<List<DateTime?>> _calendarPages;
@override@JsonKey() List<List<DateTime?>> get calendarPages {
  if (_calendarPages is EqualUnmodifiableListView) return _calendarPages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calendarPages);
}

@override@JsonKey() final  int currentCalendarPage;
// 상태
@override@JsonKey() final  TripHomePageState pageState;
// 메시지/액션
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;

/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripHomeStateCopyWith<_TripHomeState> get copyWith => __$TripHomeStateCopyWithImpl<_TripHomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripHomeState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.myId, myId) || other.myId == myId)&&const DeepCollectionEquality().equals(other._crewMembers, _crewMembers)&&(identical(other.isCrewExpanded, isCrewExpanded) || other.isCrewExpanded == isCrewExpanded)&&const DeepCollectionEquality().equals(other._friendCandidates, _friendCandidates)&&(identical(other.isInviteMode, isInviteMode) || other.isInviteMode == isInviteMode)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.tripStartDate, tripStartDate) || other.tripStartDate == tripStartDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&const DeepCollectionEquality().equals(other._allSchedules, _allSchedules)&&const DeepCollectionEquality().equals(other._schedulesForSelectedDate, _schedulesForSelectedDate)&&const DeepCollectionEquality().equals(other._usefulPhrases, _usefulPhrases)&&(identical(other.isUsefulPhraseExpanded, isUsefulPhraseExpanded) || other.isUsefulPhraseExpanded == isUsefulPhraseExpanded)&&const DeepCollectionEquality().equals(other._calendarPages, _calendarPages)&&(identical(other.currentCalendarPage, currentCalendarPage) || other.currentCalendarPage == currentCalendarPage)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,trip,myId,const DeepCollectionEquality().hash(_crewMembers),isCrewExpanded,const DeepCollectionEquality().hash(_friendCandidates),isInviteMode,selectedDate,tripStartDate,tripEndDate,const DeepCollectionEquality().hash(_allSchedules),const DeepCollectionEquality().hash(_schedulesForSelectedDate),const DeepCollectionEquality().hash(_usefulPhrases),isUsefulPhraseExpanded,const DeepCollectionEquality().hash(_calendarPages),currentCalendarPage,pageState,message,errorType,actionType]);

@override
String toString() {
  return 'TripHomeState(tripId: $tripId, trip: $trip, myId: $myId, crewMembers: $crewMembers, isCrewExpanded: $isCrewExpanded, friendCandidates: $friendCandidates, isInviteMode: $isInviteMode, selectedDate: $selectedDate, tripStartDate: $tripStartDate, tripEndDate: $tripEndDate, allSchedules: $allSchedules, schedulesForSelectedDate: $schedulesForSelectedDate, usefulPhrases: $usefulPhrases, isUsefulPhraseExpanded: $isUsefulPhraseExpanded, calendarPages: $calendarPages, currentCalendarPage: $currentCalendarPage, pageState: $pageState, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class _$TripHomeStateCopyWith<$Res> implements $TripHomeStateCopyWith<$Res> {
  factory _$TripHomeStateCopyWith(_TripHomeState value, $Res Function(_TripHomeState) _then) = __$TripHomeStateCopyWithImpl;
@override @useResult
$Res call({
 int? tripId, TripEntity? trip, int? myId, List<UserEntity> crewMembers, bool isCrewExpanded, List<UserEntity> friendCandidates, bool isInviteMode, DateTime? selectedDate, DateTime? tripStartDate, DateTime? tripEndDate, List<ScheduleEntity> allSchedules, List<ScheduleEntity> schedulesForSelectedDate, List<UsefulPharseEntity> usefulPhrases, bool isUsefulPhraseExpanded, List<List<DateTime?>> calendarPages, int currentCalendarPage, TripHomePageState pageState, String? message, String? errorType, String? actionType
});


@override $TripEntityCopyWith<$Res>? get trip;

}
/// @nodoc
class __$TripHomeStateCopyWithImpl<$Res>
    implements _$TripHomeStateCopyWith<$Res> {
  __$TripHomeStateCopyWithImpl(this._self, this._then);

  final _TripHomeState _self;
  final $Res Function(_TripHomeState) _then;

/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? trip = freezed,Object? myId = freezed,Object? crewMembers = null,Object? isCrewExpanded = null,Object? friendCandidates = null,Object? isInviteMode = null,Object? selectedDate = freezed,Object? tripStartDate = freezed,Object? tripEndDate = freezed,Object? allSchedules = null,Object? schedulesForSelectedDate = null,Object? usefulPhrases = null,Object? isUsefulPhraseExpanded = null,Object? calendarPages = null,Object? currentCalendarPage = null,Object? pageState = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_TripHomeState(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripEntity?,myId: freezed == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int?,crewMembers: null == crewMembers ? _self._crewMembers : crewMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isCrewExpanded: null == isCrewExpanded ? _self.isCrewExpanded : isCrewExpanded // ignore: cast_nullable_to_non_nullable
as bool,friendCandidates: null == friendCandidates ? _self._friendCandidates : friendCandidates // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isInviteMode: null == isInviteMode ? _self.isInviteMode : isInviteMode // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripStartDate: freezed == tripStartDate ? _self.tripStartDate : tripStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allSchedules: null == allSchedules ? _self._allSchedules : allSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,schedulesForSelectedDate: null == schedulesForSelectedDate ? _self._schedulesForSelectedDate : schedulesForSelectedDate // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,usefulPhrases: null == usefulPhrases ? _self._usefulPhrases : usefulPhrases // ignore: cast_nullable_to_non_nullable
as List<UsefulPharseEntity>,isUsefulPhraseExpanded: null == isUsefulPhraseExpanded ? _self.isUsefulPhraseExpanded : isUsefulPhraseExpanded // ignore: cast_nullable_to_non_nullable
as bool,calendarPages: null == calendarPages ? _self._calendarPages : calendarPages // ignore: cast_nullable_to_non_nullable
as List<List<DateTime?>>,currentCalendarPage: null == currentCalendarPage ? _self.currentCalendarPage : currentCalendarPage // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripHomePageState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TripHomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

// dart format on
