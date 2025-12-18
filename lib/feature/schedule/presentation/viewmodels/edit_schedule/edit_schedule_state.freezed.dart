// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditScheduleState {

 int? get tripId; int? get scheduleId; ScheduleEntity? get originalSchedule; String? get title; DateTime? get date; TimeOfDay? get time; DateTime? get startAt; String? get place; String? get address; double? get lat; double? get lng; bool get isPlaceFromMap; String? get description;// 카테고리
 int? get selectedCategoryId;// 참여자
 List<UserEntity> get tripMembers; List<UserEntity> get selectedScheduleCrew;// ===== 상태 =====
 bool get isValid; bool get isSubmitting; bool get isDirty;// UI 상태
 EditSchedulePageState get pageState; DateTime? get tripStartDate; DateTime? get tripEndDate;// 메시지
 String? get message; String? get errorType; String? get actionType;
/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditScheduleStateCopyWith<EditScheduleState> get copyWith => _$EditScheduleStateCopyWithImpl<EditScheduleState>(this as EditScheduleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditScheduleState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.originalSchedule, originalSchedule) || other.originalSchedule == originalSchedule)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isPlaceFromMap, isPlaceFromMap) || other.isPlaceFromMap == isPlaceFromMap)&&(identical(other.description, description) || other.description == description)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&const DeepCollectionEquality().equals(other.tripMembers, tripMembers)&&const DeepCollectionEquality().equals(other.selectedScheduleCrew, selectedScheduleCrew)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.tripStartDate, tripStartDate) || other.tripStartDate == tripStartDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,scheduleId,originalSchedule,title,date,time,startAt,place,address,lat,lng,isPlaceFromMap,description,selectedCategoryId,const DeepCollectionEquality().hash(tripMembers),const DeepCollectionEquality().hash(selectedScheduleCrew),isValid,isSubmitting,isDirty,pageState,tripStartDate,tripEndDate,message,errorType,actionType]);

@override
String toString() {
  return 'EditScheduleState(tripId: $tripId, scheduleId: $scheduleId, originalSchedule: $originalSchedule, title: $title, date: $date, time: $time, startAt: $startAt, place: $place, address: $address, lat: $lat, lng: $lng, isPlaceFromMap: $isPlaceFromMap, description: $description, selectedCategoryId: $selectedCategoryId, tripMembers: $tripMembers, selectedScheduleCrew: $selectedScheduleCrew, isValid: $isValid, isSubmitting: $isSubmitting, isDirty: $isDirty, pageState: $pageState, tripStartDate: $tripStartDate, tripEndDate: $tripEndDate, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $EditScheduleStateCopyWith<$Res>  {
  factory $EditScheduleStateCopyWith(EditScheduleState value, $Res Function(EditScheduleState) _then) = _$EditScheduleStateCopyWithImpl;
@useResult
$Res call({
 int? tripId, int? scheduleId, ScheduleEntity? originalSchedule, String? title, DateTime? date, TimeOfDay? time, DateTime? startAt, String? place, String? address, double? lat, double? lng, bool isPlaceFromMap, String? description, int? selectedCategoryId, List<UserEntity> tripMembers, List<UserEntity> selectedScheduleCrew, bool isValid, bool isSubmitting, bool isDirty, EditSchedulePageState pageState, DateTime? tripStartDate, DateTime? tripEndDate, String? message, String? errorType, String? actionType
});


$ScheduleEntityCopyWith<$Res>? get originalSchedule;

}
/// @nodoc
class _$EditScheduleStateCopyWithImpl<$Res>
    implements $EditScheduleStateCopyWith<$Res> {
  _$EditScheduleStateCopyWithImpl(this._self, this._then);

  final EditScheduleState _self;
  final $Res Function(EditScheduleState) _then;

/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? scheduleId = freezed,Object? originalSchedule = freezed,Object? title = freezed,Object? date = freezed,Object? time = freezed,Object? startAt = freezed,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? isPlaceFromMap = null,Object? description = freezed,Object? selectedCategoryId = freezed,Object? tripMembers = null,Object? selectedScheduleCrew = null,Object? isValid = null,Object? isSubmitting = null,Object? isDirty = null,Object? pageState = null,Object? tripStartDate = freezed,Object? tripEndDate = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,originalSchedule: freezed == originalSchedule ? _self.originalSchedule : originalSchedule // ignore: cast_nullable_to_non_nullable
as ScheduleEntity?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isPlaceFromMap: null == isPlaceFromMap ? _self.isPlaceFromMap : isPlaceFromMap // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,tripMembers: null == tripMembers ? _self.tripMembers : tripMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedScheduleCrew: null == selectedScheduleCrew ? _self.selectedScheduleCrew : selectedScheduleCrew // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditSchedulePageState,tripStartDate: freezed == tripStartDate ? _self.tripStartDate : tripStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<$Res>? get originalSchedule {
    if (_self.originalSchedule == null) {
    return null;
  }

  return $ScheduleEntityCopyWith<$Res>(_self.originalSchedule!, (value) {
    return _then(_self.copyWith(originalSchedule: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditScheduleState].
extension EditScheduleStatePatterns on EditScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _EditScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _EditScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tripId,  int? scheduleId,  ScheduleEntity? originalSchedule,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool isPlaceFromMap,  String? description,  int? selectedCategoryId,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew,  bool isValid,  bool isSubmitting,  bool isDirty,  EditSchedulePageState pageState,  DateTime? tripStartDate,  DateTime? tripEndDate,  String? message,  String? errorType,  String? actionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditScheduleState() when $default != null:
return $default(_that.tripId,_that.scheduleId,_that.originalSchedule,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceFromMap,_that.description,_that.selectedCategoryId,_that.tripMembers,_that.selectedScheduleCrew,_that.isValid,_that.isSubmitting,_that.isDirty,_that.pageState,_that.tripStartDate,_that.tripEndDate,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tripId,  int? scheduleId,  ScheduleEntity? originalSchedule,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool isPlaceFromMap,  String? description,  int? selectedCategoryId,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew,  bool isValid,  bool isSubmitting,  bool isDirty,  EditSchedulePageState pageState,  DateTime? tripStartDate,  DateTime? tripEndDate,  String? message,  String? errorType,  String? actionType)  $default,) {final _that = this;
switch (_that) {
case _EditScheduleState():
return $default(_that.tripId,_that.scheduleId,_that.originalSchedule,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceFromMap,_that.description,_that.selectedCategoryId,_that.tripMembers,_that.selectedScheduleCrew,_that.isValid,_that.isSubmitting,_that.isDirty,_that.pageState,_that.tripStartDate,_that.tripEndDate,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tripId,  int? scheduleId,  ScheduleEntity? originalSchedule,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool isPlaceFromMap,  String? description,  int? selectedCategoryId,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew,  bool isValid,  bool isSubmitting,  bool isDirty,  EditSchedulePageState pageState,  DateTime? tripStartDate,  DateTime? tripEndDate,  String? message,  String? errorType,  String? actionType)?  $default,) {final _that = this;
switch (_that) {
case _EditScheduleState() when $default != null:
return $default(_that.tripId,_that.scheduleId,_that.originalSchedule,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceFromMap,_that.description,_that.selectedCategoryId,_that.tripMembers,_that.selectedScheduleCrew,_that.isValid,_that.isSubmitting,_that.isDirty,_that.pageState,_that.tripStartDate,_that.tripEndDate,_that.message,_that.errorType,_that.actionType);case _:
  return null;

}
}

}

/// @nodoc


class _EditScheduleState implements EditScheduleState {
  const _EditScheduleState({this.tripId, this.scheduleId, this.originalSchedule, this.title, this.date, this.time, this.startAt, this.place, this.address, this.lat, this.lng, this.isPlaceFromMap = false, this.description, this.selectedCategoryId, final  List<UserEntity> tripMembers = const [], final  List<UserEntity> selectedScheduleCrew = const [], this.isValid = false, this.isSubmitting = false, this.isDirty = false, this.pageState = EditSchedulePageState.init, this.tripStartDate, this.tripEndDate, this.message, this.errorType, this.actionType}): _tripMembers = tripMembers,_selectedScheduleCrew = selectedScheduleCrew;
  

@override final  int? tripId;
@override final  int? scheduleId;
@override final  ScheduleEntity? originalSchedule;
@override final  String? title;
@override final  DateTime? date;
@override final  TimeOfDay? time;
@override final  DateTime? startAt;
@override final  String? place;
@override final  String? address;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey() final  bool isPlaceFromMap;
@override final  String? description;
// 카테고리
@override final  int? selectedCategoryId;
// 참여자
 final  List<UserEntity> _tripMembers;
// 참여자
@override@JsonKey() List<UserEntity> get tripMembers {
  if (_tripMembers is EqualUnmodifiableListView) return _tripMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tripMembers);
}

 final  List<UserEntity> _selectedScheduleCrew;
@override@JsonKey() List<UserEntity> get selectedScheduleCrew {
  if (_selectedScheduleCrew is EqualUnmodifiableListView) return _selectedScheduleCrew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedScheduleCrew);
}

// ===== 상태 =====
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isDirty;
// UI 상태
@override@JsonKey() final  EditSchedulePageState pageState;
@override final  DateTime? tripStartDate;
@override final  DateTime? tripEndDate;
// 메시지
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;

/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditScheduleStateCopyWith<_EditScheduleState> get copyWith => __$EditScheduleStateCopyWithImpl<_EditScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditScheduleState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.originalSchedule, originalSchedule) || other.originalSchedule == originalSchedule)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isPlaceFromMap, isPlaceFromMap) || other.isPlaceFromMap == isPlaceFromMap)&&(identical(other.description, description) || other.description == description)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&const DeepCollectionEquality().equals(other._tripMembers, _tripMembers)&&const DeepCollectionEquality().equals(other._selectedScheduleCrew, _selectedScheduleCrew)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.tripStartDate, tripStartDate) || other.tripStartDate == tripStartDate)&&(identical(other.tripEndDate, tripEndDate) || other.tripEndDate == tripEndDate)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,scheduleId,originalSchedule,title,date,time,startAt,place,address,lat,lng,isPlaceFromMap,description,selectedCategoryId,const DeepCollectionEquality().hash(_tripMembers),const DeepCollectionEquality().hash(_selectedScheduleCrew),isValid,isSubmitting,isDirty,pageState,tripStartDate,tripEndDate,message,errorType,actionType]);

@override
String toString() {
  return 'EditScheduleState(tripId: $tripId, scheduleId: $scheduleId, originalSchedule: $originalSchedule, title: $title, date: $date, time: $time, startAt: $startAt, place: $place, address: $address, lat: $lat, lng: $lng, isPlaceFromMap: $isPlaceFromMap, description: $description, selectedCategoryId: $selectedCategoryId, tripMembers: $tripMembers, selectedScheduleCrew: $selectedScheduleCrew, isValid: $isValid, isSubmitting: $isSubmitting, isDirty: $isDirty, pageState: $pageState, tripStartDate: $tripStartDate, tripEndDate: $tripEndDate, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class _$EditScheduleStateCopyWith<$Res> implements $EditScheduleStateCopyWith<$Res> {
  factory _$EditScheduleStateCopyWith(_EditScheduleState value, $Res Function(_EditScheduleState) _then) = __$EditScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 int? tripId, int? scheduleId, ScheduleEntity? originalSchedule, String? title, DateTime? date, TimeOfDay? time, DateTime? startAt, String? place, String? address, double? lat, double? lng, bool isPlaceFromMap, String? description, int? selectedCategoryId, List<UserEntity> tripMembers, List<UserEntity> selectedScheduleCrew, bool isValid, bool isSubmitting, bool isDirty, EditSchedulePageState pageState, DateTime? tripStartDate, DateTime? tripEndDate, String? message, String? errorType, String? actionType
});


@override $ScheduleEntityCopyWith<$Res>? get originalSchedule;

}
/// @nodoc
class __$EditScheduleStateCopyWithImpl<$Res>
    implements _$EditScheduleStateCopyWith<$Res> {
  __$EditScheduleStateCopyWithImpl(this._self, this._then);

  final _EditScheduleState _self;
  final $Res Function(_EditScheduleState) _then;

/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? scheduleId = freezed,Object? originalSchedule = freezed,Object? title = freezed,Object? date = freezed,Object? time = freezed,Object? startAt = freezed,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? isPlaceFromMap = null,Object? description = freezed,Object? selectedCategoryId = freezed,Object? tripMembers = null,Object? selectedScheduleCrew = null,Object? isValid = null,Object? isSubmitting = null,Object? isDirty = null,Object? pageState = null,Object? tripStartDate = freezed,Object? tripEndDate = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_EditScheduleState(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,originalSchedule: freezed == originalSchedule ? _self.originalSchedule : originalSchedule // ignore: cast_nullable_to_non_nullable
as ScheduleEntity?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isPlaceFromMap: null == isPlaceFromMap ? _self.isPlaceFromMap : isPlaceFromMap // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,tripMembers: null == tripMembers ? _self._tripMembers : tripMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedScheduleCrew: null == selectedScheduleCrew ? _self._selectedScheduleCrew : selectedScheduleCrew // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditSchedulePageState,tripStartDate: freezed == tripStartDate ? _self.tripStartDate : tripStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tripEndDate: freezed == tripEndDate ? _self.tripEndDate : tripEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EditScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<$Res>? get originalSchedule {
    if (_self.originalSchedule == null) {
    return null;
  }

  return $ScheduleEntityCopyWith<$Res>(_self.originalSchedule!, (value) {
    return _then(_self.copyWith(originalSchedule: value));
  });
}
}

// dart format on
