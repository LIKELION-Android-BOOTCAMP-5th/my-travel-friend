// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateScheduleState {

 int get tripId; String? get title;//시간용
 DateTime? get date;//날짜
 TimeOfDay? get time;//시간
 DateTime? get startAt;//날짜 시간 합쳐서 올릴용
//  장소 (optional)
 String? get place; String? get address; double? get lat; double? get lng; bool? get isPlaceSelected;//  메모
 String? get description; bool get isValid; bool get isSubmitting; bool get isDirty;// 카테고리
 int? get selectedCategoryId; bool get isPlaceFromMap;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType; CreateSchedulepageState get pageState; List<UserEntity> get tripMembers;// 참여자
 List<UserEntity> get selectedScheduleCrew;
/// Create a copy of CreateScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateScheduleStateCopyWith<CreateScheduleState> get copyWith => _$CreateScheduleStateCopyWithImpl<CreateScheduleState>(this as CreateScheduleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateScheduleState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isPlaceSelected, isPlaceSelected) || other.isPlaceSelected == isPlaceSelected)&&(identical(other.description, description) || other.description == description)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.isPlaceFromMap, isPlaceFromMap) || other.isPlaceFromMap == isPlaceFromMap)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other.tripMembers, tripMembers)&&const DeepCollectionEquality().equals(other.selectedScheduleCrew, selectedScheduleCrew));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,title,date,time,startAt,place,address,lat,lng,isPlaceSelected,description,isValid,isSubmitting,isDirty,selectedCategoryId,isPlaceFromMap,message,errorType,actionType,pageState,const DeepCollectionEquality().hash(tripMembers),const DeepCollectionEquality().hash(selectedScheduleCrew)]);

@override
String toString() {
  return 'CreateScheduleState(tripId: $tripId, title: $title, date: $date, time: $time, startAt: $startAt, place: $place, address: $address, lat: $lat, lng: $lng, isPlaceSelected: $isPlaceSelected, description: $description, isValid: $isValid, isSubmitting: $isSubmitting, isDirty: $isDirty, selectedCategoryId: $selectedCategoryId, isPlaceFromMap: $isPlaceFromMap, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState, tripMembers: $tripMembers, selectedScheduleCrew: $selectedScheduleCrew)';
}


}

/// @nodoc
abstract mixin class $CreateScheduleStateCopyWith<$Res>  {
  factory $CreateScheduleStateCopyWith(CreateScheduleState value, $Res Function(CreateScheduleState) _then) = _$CreateScheduleStateCopyWithImpl;
@useResult
$Res call({
 int tripId, String? title, DateTime? date, TimeOfDay? time, DateTime? startAt, String? place, String? address, double? lat, double? lng, bool? isPlaceSelected, String? description, bool isValid, bool isSubmitting, bool isDirty, int? selectedCategoryId, bool isPlaceFromMap, String? message, String? errorType, String? actionType, CreateSchedulepageState pageState, List<UserEntity> tripMembers, List<UserEntity> selectedScheduleCrew
});




}
/// @nodoc
class _$CreateScheduleStateCopyWithImpl<$Res>
    implements $CreateScheduleStateCopyWith<$Res> {
  _$CreateScheduleStateCopyWithImpl(this._self, this._then);

  final CreateScheduleState _self;
  final $Res Function(CreateScheduleState) _then;

/// Create a copy of CreateScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? title = freezed,Object? date = freezed,Object? time = freezed,Object? startAt = freezed,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? isPlaceSelected = freezed,Object? description = freezed,Object? isValid = null,Object? isSubmitting = null,Object? isDirty = null,Object? selectedCategoryId = freezed,Object? isPlaceFromMap = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,Object? tripMembers = null,Object? selectedScheduleCrew = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isPlaceSelected: freezed == isPlaceSelected ? _self.isPlaceSelected : isPlaceSelected // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,isPlaceFromMap: null == isPlaceFromMap ? _self.isPlaceFromMap : isPlaceFromMap // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as CreateSchedulepageState,tripMembers: null == tripMembers ? _self.tripMembers : tripMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedScheduleCrew: null == selectedScheduleCrew ? _self.selectedScheduleCrew : selectedScheduleCrew // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateScheduleState].
extension CreateScheduleStatePatterns on CreateScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _CreateScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool? isPlaceSelected,  String? description,  bool isValid,  bool isSubmitting,  bool isDirty,  int? selectedCategoryId,  bool isPlaceFromMap,  String? message,  String? errorType,  String? actionType,  CreateSchedulepageState pageState,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateScheduleState() when $default != null:
return $default(_that.tripId,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceSelected,_that.description,_that.isValid,_that.isSubmitting,_that.isDirty,_that.selectedCategoryId,_that.isPlaceFromMap,_that.message,_that.errorType,_that.actionType,_that.pageState,_that.tripMembers,_that.selectedScheduleCrew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool? isPlaceSelected,  String? description,  bool isValid,  bool isSubmitting,  bool isDirty,  int? selectedCategoryId,  bool isPlaceFromMap,  String? message,  String? errorType,  String? actionType,  CreateSchedulepageState pageState,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew)  $default,) {final _that = this;
switch (_that) {
case _CreateScheduleState():
return $default(_that.tripId,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceSelected,_that.description,_that.isValid,_that.isSubmitting,_that.isDirty,_that.selectedCategoryId,_that.isPlaceFromMap,_that.message,_that.errorType,_that.actionType,_that.pageState,_that.tripMembers,_that.selectedScheduleCrew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  String? title,  DateTime? date,  TimeOfDay? time,  DateTime? startAt,  String? place,  String? address,  double? lat,  double? lng,  bool? isPlaceSelected,  String? description,  bool isValid,  bool isSubmitting,  bool isDirty,  int? selectedCategoryId,  bool isPlaceFromMap,  String? message,  String? errorType,  String? actionType,  CreateSchedulepageState pageState,  List<UserEntity> tripMembers,  List<UserEntity> selectedScheduleCrew)?  $default,) {final _that = this;
switch (_that) {
case _CreateScheduleState() when $default != null:
return $default(_that.tripId,_that.title,_that.date,_that.time,_that.startAt,_that.place,_that.address,_that.lat,_that.lng,_that.isPlaceSelected,_that.description,_that.isValid,_that.isSubmitting,_that.isDirty,_that.selectedCategoryId,_that.isPlaceFromMap,_that.message,_that.errorType,_that.actionType,_that.pageState,_that.tripMembers,_that.selectedScheduleCrew);case _:
  return null;

}
}

}

/// @nodoc


class _CreateScheduleState implements CreateScheduleState {
  const _CreateScheduleState({this.tripId = 1, this.title, this.date, this.time, this.startAt, this.place, this.address, this.lat, this.lng, this.isPlaceSelected, this.description, this.isValid = false, this.isSubmitting = false, this.isDirty = false, this.selectedCategoryId, this.isPlaceFromMap = false, this.message, this.errorType, this.actionType, this.pageState = CreateSchedulepageState.init, final  List<UserEntity> tripMembers = const [], final  List<UserEntity> selectedScheduleCrew = const []}): _tripMembers = tripMembers,_selectedScheduleCrew = selectedScheduleCrew;
  

@override@JsonKey() final  int tripId;
@override final  String? title;
//시간용
@override final  DateTime? date;
//날짜
@override final  TimeOfDay? time;
//시간
@override final  DateTime? startAt;
//날짜 시간 합쳐서 올릴용
//  장소 (optional)
@override final  String? place;
@override final  String? address;
@override final  double? lat;
@override final  double? lng;
@override final  bool? isPlaceSelected;
//  메모
@override final  String? description;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isDirty;
// 카테고리
@override final  int? selectedCategoryId;
@override@JsonKey() final  bool isPlaceFromMap;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
@override@JsonKey() final  CreateSchedulepageState pageState;
 final  List<UserEntity> _tripMembers;
@override@JsonKey() List<UserEntity> get tripMembers {
  if (_tripMembers is EqualUnmodifiableListView) return _tripMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tripMembers);
}

// 참여자
 final  List<UserEntity> _selectedScheduleCrew;
// 참여자
@override@JsonKey() List<UserEntity> get selectedScheduleCrew {
  if (_selectedScheduleCrew is EqualUnmodifiableListView) return _selectedScheduleCrew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedScheduleCrew);
}


/// Create a copy of CreateScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateScheduleStateCopyWith<_CreateScheduleState> get copyWith => __$CreateScheduleStateCopyWithImpl<_CreateScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateScheduleState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isPlaceSelected, isPlaceSelected) || other.isPlaceSelected == isPlaceSelected)&&(identical(other.description, description) || other.description == description)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.isPlaceFromMap, isPlaceFromMap) || other.isPlaceFromMap == isPlaceFromMap)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&const DeepCollectionEquality().equals(other._tripMembers, _tripMembers)&&const DeepCollectionEquality().equals(other._selectedScheduleCrew, _selectedScheduleCrew));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,title,date,time,startAt,place,address,lat,lng,isPlaceSelected,description,isValid,isSubmitting,isDirty,selectedCategoryId,isPlaceFromMap,message,errorType,actionType,pageState,const DeepCollectionEquality().hash(_tripMembers),const DeepCollectionEquality().hash(_selectedScheduleCrew)]);

@override
String toString() {
  return 'CreateScheduleState(tripId: $tripId, title: $title, date: $date, time: $time, startAt: $startAt, place: $place, address: $address, lat: $lat, lng: $lng, isPlaceSelected: $isPlaceSelected, description: $description, isValid: $isValid, isSubmitting: $isSubmitting, isDirty: $isDirty, selectedCategoryId: $selectedCategoryId, isPlaceFromMap: $isPlaceFromMap, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState, tripMembers: $tripMembers, selectedScheduleCrew: $selectedScheduleCrew)';
}


}

/// @nodoc
abstract mixin class _$CreateScheduleStateCopyWith<$Res> implements $CreateScheduleStateCopyWith<$Res> {
  factory _$CreateScheduleStateCopyWith(_CreateScheduleState value, $Res Function(_CreateScheduleState) _then) = __$CreateScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, String? title, DateTime? date, TimeOfDay? time, DateTime? startAt, String? place, String? address, double? lat, double? lng, bool? isPlaceSelected, String? description, bool isValid, bool isSubmitting, bool isDirty, int? selectedCategoryId, bool isPlaceFromMap, String? message, String? errorType, String? actionType, CreateSchedulepageState pageState, List<UserEntity> tripMembers, List<UserEntity> selectedScheduleCrew
});




}
/// @nodoc
class __$CreateScheduleStateCopyWithImpl<$Res>
    implements _$CreateScheduleStateCopyWith<$Res> {
  __$CreateScheduleStateCopyWithImpl(this._self, this._then);

  final _CreateScheduleState _self;
  final $Res Function(_CreateScheduleState) _then;

/// Create a copy of CreateScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? title = freezed,Object? date = freezed,Object? time = freezed,Object? startAt = freezed,Object? place = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? isPlaceSelected = freezed,Object? description = freezed,Object? isValid = null,Object? isSubmitting = null,Object? isDirty = null,Object? selectedCategoryId = freezed,Object? isPlaceFromMap = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,Object? tripMembers = null,Object? selectedScheduleCrew = null,}) {
  return _then(_CreateScheduleState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isPlaceSelected: freezed == isPlaceSelected ? _self.isPlaceSelected : isPlaceSelected // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,isPlaceFromMap: null == isPlaceFromMap ? _self.isPlaceFromMap : isPlaceFromMap // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as CreateSchedulepageState,tripMembers: null == tripMembers ? _self._tripMembers : tripMembers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedScheduleCrew: null == selectedScheduleCrew ? _self._selectedScheduleCrew : selectedScheduleCrew // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,
  ));
}


}

// dart format on
