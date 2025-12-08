// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmEvent()';
}


}

/// @nodoc
class $AlarmEventCopyWith<$Res>  {
$AlarmEventCopyWith(AlarmEvent _, $Res Function(AlarmEvent) __);
}


/// Adds pattern-matching-related methods to [AlarmEvent].
extension AlarmEventPatterns on AlarmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAlarms value)?  getAlarms,TResult Function( LoadMoreAlarms value)?  loadMore,TResult Function( CheckAnAlarm value)?  checkAnAlarm,TResult Function( CheckAlarms value)?  checkAlarms,TResult Function( GetAlarmById value)?  getAlarmById,TResult Function( ClearSelectedAlarm value)?  clearSelectedAlarm,TResult Function( RefreshAlarm value)?  refreshAlarm,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAlarms() when getAlarms != null:
return getAlarms(_that);case LoadMoreAlarms() when loadMore != null:
return loadMore(_that);case CheckAnAlarm() when checkAnAlarm != null:
return checkAnAlarm(_that);case CheckAlarms() when checkAlarms != null:
return checkAlarms(_that);case GetAlarmById() when getAlarmById != null:
return getAlarmById(_that);case ClearSelectedAlarm() when clearSelectedAlarm != null:
return clearSelectedAlarm(_that);case RefreshAlarm() when refreshAlarm != null:
return refreshAlarm(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAlarms value)  getAlarms,required TResult Function( LoadMoreAlarms value)  loadMore,required TResult Function( CheckAnAlarm value)  checkAnAlarm,required TResult Function( CheckAlarms value)  checkAlarms,required TResult Function( GetAlarmById value)  getAlarmById,required TResult Function( ClearSelectedAlarm value)  clearSelectedAlarm,required TResult Function( RefreshAlarm value)  refreshAlarm,}){
final _that = this;
switch (_that) {
case GetAlarms():
return getAlarms(_that);case LoadMoreAlarms():
return loadMore(_that);case CheckAnAlarm():
return checkAnAlarm(_that);case CheckAlarms():
return checkAlarms(_that);case GetAlarmById():
return getAlarmById(_that);case ClearSelectedAlarm():
return clearSelectedAlarm(_that);case RefreshAlarm():
return refreshAlarm(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAlarms value)?  getAlarms,TResult? Function( LoadMoreAlarms value)?  loadMore,TResult? Function( CheckAnAlarm value)?  checkAnAlarm,TResult? Function( CheckAlarms value)?  checkAlarms,TResult? Function( GetAlarmById value)?  getAlarmById,TResult? Function( ClearSelectedAlarm value)?  clearSelectedAlarm,TResult? Function( RefreshAlarm value)?  refreshAlarm,}){
final _that = this;
switch (_that) {
case GetAlarms() when getAlarms != null:
return getAlarms(_that);case LoadMoreAlarms() when loadMore != null:
return loadMore(_that);case CheckAnAlarm() when checkAnAlarm != null:
return checkAnAlarm(_that);case CheckAlarms() when checkAlarms != null:
return checkAlarms(_that);case GetAlarmById() when getAlarmById != null:
return getAlarmById(_that);case ClearSelectedAlarm() when clearSelectedAlarm != null:
return clearSelectedAlarm(_that);case RefreshAlarm() when refreshAlarm != null:
return refreshAlarm(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId)?  getAlarms,TResult Function()?  loadMore,TResult Function( int alarmId)?  checkAnAlarm,TResult Function()?  checkAlarms,TResult Function( int alarmId)?  getAlarmById,TResult Function()?  clearSelectedAlarm,TResult Function()?  refreshAlarm,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAlarms() when getAlarms != null:
return getAlarms(_that.userId);case LoadMoreAlarms() when loadMore != null:
return loadMore();case CheckAnAlarm() when checkAnAlarm != null:
return checkAnAlarm(_that.alarmId);case CheckAlarms() when checkAlarms != null:
return checkAlarms();case GetAlarmById() when getAlarmById != null:
return getAlarmById(_that.alarmId);case ClearSelectedAlarm() when clearSelectedAlarm != null:
return clearSelectedAlarm();case RefreshAlarm() when refreshAlarm != null:
return refreshAlarm();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId)  getAlarms,required TResult Function()  loadMore,required TResult Function( int alarmId)  checkAnAlarm,required TResult Function()  checkAlarms,required TResult Function( int alarmId)  getAlarmById,required TResult Function()  clearSelectedAlarm,required TResult Function()  refreshAlarm,}) {final _that = this;
switch (_that) {
case GetAlarms():
return getAlarms(_that.userId);case LoadMoreAlarms():
return loadMore();case CheckAnAlarm():
return checkAnAlarm(_that.alarmId);case CheckAlarms():
return checkAlarms();case GetAlarmById():
return getAlarmById(_that.alarmId);case ClearSelectedAlarm():
return clearSelectedAlarm();case RefreshAlarm():
return refreshAlarm();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId)?  getAlarms,TResult? Function()?  loadMore,TResult? Function( int alarmId)?  checkAnAlarm,TResult? Function()?  checkAlarms,TResult? Function( int alarmId)?  getAlarmById,TResult? Function()?  clearSelectedAlarm,TResult? Function()?  refreshAlarm,}) {final _that = this;
switch (_that) {
case GetAlarms() when getAlarms != null:
return getAlarms(_that.userId);case LoadMoreAlarms() when loadMore != null:
return loadMore();case CheckAnAlarm() when checkAnAlarm != null:
return checkAnAlarm(_that.alarmId);case CheckAlarms() when checkAlarms != null:
return checkAlarms();case GetAlarmById() when getAlarmById != null:
return getAlarmById(_that.alarmId);case ClearSelectedAlarm() when clearSelectedAlarm != null:
return clearSelectedAlarm();case RefreshAlarm() when refreshAlarm != null:
return refreshAlarm();case _:
  return null;

}
}

}

/// @nodoc


class GetAlarms implements AlarmEvent {
  const GetAlarms({required this.userId});
  

 final  int userId;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAlarmsCopyWith<GetAlarms> get copyWith => _$GetAlarmsCopyWithImpl<GetAlarms>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAlarms&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AlarmEvent.getAlarms(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetAlarmsCopyWith<$Res> implements $AlarmEventCopyWith<$Res> {
  factory $GetAlarmsCopyWith(GetAlarms value, $Res Function(GetAlarms) _then) = _$GetAlarmsCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$GetAlarmsCopyWithImpl<$Res>
    implements $GetAlarmsCopyWith<$Res> {
  _$GetAlarmsCopyWithImpl(this._self, this._then);

  final GetAlarms _self;
  final $Res Function(GetAlarms) _then;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(GetAlarms(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadMoreAlarms implements AlarmEvent {
  const LoadMoreAlarms();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreAlarms);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmEvent.loadMore()';
}


}




/// @nodoc


class CheckAnAlarm implements AlarmEvent {
  const CheckAnAlarm({required this.alarmId});
  

 final  int alarmId;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAnAlarmCopyWith<CheckAnAlarm> get copyWith => _$CheckAnAlarmCopyWithImpl<CheckAnAlarm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAnAlarm&&(identical(other.alarmId, alarmId) || other.alarmId == alarmId));
}


@override
int get hashCode => Object.hash(runtimeType,alarmId);

@override
String toString() {
  return 'AlarmEvent.checkAnAlarm(alarmId: $alarmId)';
}


}

/// @nodoc
abstract mixin class $CheckAnAlarmCopyWith<$Res> implements $AlarmEventCopyWith<$Res> {
  factory $CheckAnAlarmCopyWith(CheckAnAlarm value, $Res Function(CheckAnAlarm) _then) = _$CheckAnAlarmCopyWithImpl;
@useResult
$Res call({
 int alarmId
});




}
/// @nodoc
class _$CheckAnAlarmCopyWithImpl<$Res>
    implements $CheckAnAlarmCopyWith<$Res> {
  _$CheckAnAlarmCopyWithImpl(this._self, this._then);

  final CheckAnAlarm _self;
  final $Res Function(CheckAnAlarm) _then;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alarmId = null,}) {
  return _then(CheckAnAlarm(
alarmId: null == alarmId ? _self.alarmId : alarmId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CheckAlarms implements AlarmEvent {
  const CheckAlarms();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAlarms);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmEvent.checkAlarms()';
}


}




/// @nodoc


class GetAlarmById implements AlarmEvent {
  const GetAlarmById({required this.alarmId});
  

 final  int alarmId;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAlarmByIdCopyWith<GetAlarmById> get copyWith => _$GetAlarmByIdCopyWithImpl<GetAlarmById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAlarmById&&(identical(other.alarmId, alarmId) || other.alarmId == alarmId));
}


@override
int get hashCode => Object.hash(runtimeType,alarmId);

@override
String toString() {
  return 'AlarmEvent.getAlarmById(alarmId: $alarmId)';
}


}

/// @nodoc
abstract mixin class $GetAlarmByIdCopyWith<$Res> implements $AlarmEventCopyWith<$Res> {
  factory $GetAlarmByIdCopyWith(GetAlarmById value, $Res Function(GetAlarmById) _then) = _$GetAlarmByIdCopyWithImpl;
@useResult
$Res call({
 int alarmId
});




}
/// @nodoc
class _$GetAlarmByIdCopyWithImpl<$Res>
    implements $GetAlarmByIdCopyWith<$Res> {
  _$GetAlarmByIdCopyWithImpl(this._self, this._then);

  final GetAlarmById _self;
  final $Res Function(GetAlarmById) _then;

/// Create a copy of AlarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alarmId = null,}) {
  return _then(GetAlarmById(
alarmId: null == alarmId ? _self.alarmId : alarmId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ClearSelectedAlarm implements AlarmEvent {
  const ClearSelectedAlarm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelectedAlarm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmEvent.clearSelectedAlarm()';
}


}




/// @nodoc


class RefreshAlarm implements AlarmEvent {
  const RefreshAlarm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshAlarm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmEvent.refreshAlarm()';
}


}




// dart format on
