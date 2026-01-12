// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_setting_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmSettingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmSettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmSettingEvent()';
}


}

/// @nodoc
class $AlarmSettingEventCopyWith<$Res>  {
$AlarmSettingEventCopyWith(AlarmSettingEvent _, $Res Function(AlarmSettingEvent) __);
}


/// Adds pattern-matching-related methods to [AlarmSettingEvent].
extension AlarmSettingEventPatterns on AlarmSettingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAlarmSetting value)?  load,TResult Function( ToggleEntireAlarm value)?  toggleEntireAlarm,TResult Function( ToggleIndividualAlarm value)?  toggleIndividualAlarm,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAlarmSetting() when load != null:
return load(_that);case ToggleEntireAlarm() when toggleEntireAlarm != null:
return toggleEntireAlarm(_that);case ToggleIndividualAlarm() when toggleIndividualAlarm != null:
return toggleIndividualAlarm(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAlarmSetting value)  load,required TResult Function( ToggleEntireAlarm value)  toggleEntireAlarm,required TResult Function( ToggleIndividualAlarm value)  toggleIndividualAlarm,}){
final _that = this;
switch (_that) {
case LoadAlarmSetting():
return load(_that);case ToggleEntireAlarm():
return toggleEntireAlarm(_that);case ToggleIndividualAlarm():
return toggleIndividualAlarm(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAlarmSetting value)?  load,TResult? Function( ToggleEntireAlarm value)?  toggleEntireAlarm,TResult? Function( ToggleIndividualAlarm value)?  toggleIndividualAlarm,}){
final _that = this;
switch (_that) {
case LoadAlarmSetting() when load != null:
return load(_that);case ToggleEntireAlarm() when toggleEntireAlarm != null:
return toggleEntireAlarm(_that);case ToggleIndividualAlarm() when toggleIndividualAlarm != null:
return toggleIndividualAlarm(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId)?  load,TResult Function( bool value)?  toggleEntireAlarm,TResult Function( String type,  bool value)?  toggleIndividualAlarm,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAlarmSetting() when load != null:
return load(_that.userId);case ToggleEntireAlarm() when toggleEntireAlarm != null:
return toggleEntireAlarm(_that.value);case ToggleIndividualAlarm() when toggleIndividualAlarm != null:
return toggleIndividualAlarm(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId)  load,required TResult Function( bool value)  toggleEntireAlarm,required TResult Function( String type,  bool value)  toggleIndividualAlarm,}) {final _that = this;
switch (_that) {
case LoadAlarmSetting():
return load(_that.userId);case ToggleEntireAlarm():
return toggleEntireAlarm(_that.value);case ToggleIndividualAlarm():
return toggleIndividualAlarm(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId)?  load,TResult? Function( bool value)?  toggleEntireAlarm,TResult? Function( String type,  bool value)?  toggleIndividualAlarm,}) {final _that = this;
switch (_that) {
case LoadAlarmSetting() when load != null:
return load(_that.userId);case ToggleEntireAlarm() when toggleEntireAlarm != null:
return toggleEntireAlarm(_that.value);case ToggleIndividualAlarm() when toggleIndividualAlarm != null:
return toggleIndividualAlarm(_that.type,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class LoadAlarmSetting implements AlarmSettingEvent {
  const LoadAlarmSetting({required this.userId});
  

 final  int userId;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadAlarmSettingCopyWith<LoadAlarmSetting> get copyWith => _$LoadAlarmSettingCopyWithImpl<LoadAlarmSetting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAlarmSetting&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AlarmSettingEvent.load(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $LoadAlarmSettingCopyWith<$Res> implements $AlarmSettingEventCopyWith<$Res> {
  factory $LoadAlarmSettingCopyWith(LoadAlarmSetting value, $Res Function(LoadAlarmSetting) _then) = _$LoadAlarmSettingCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$LoadAlarmSettingCopyWithImpl<$Res>
    implements $LoadAlarmSettingCopyWith<$Res> {
  _$LoadAlarmSettingCopyWithImpl(this._self, this._then);

  final LoadAlarmSetting _self;
  final $Res Function(LoadAlarmSetting) _then;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(LoadAlarmSetting(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ToggleEntireAlarm implements AlarmSettingEvent {
  const ToggleEntireAlarm({required this.value});
  

 final  bool value;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleEntireAlarmCopyWith<ToggleEntireAlarm> get copyWith => _$ToggleEntireAlarmCopyWithImpl<ToggleEntireAlarm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleEntireAlarm&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AlarmSettingEvent.toggleEntireAlarm(value: $value)';
}


}

/// @nodoc
abstract mixin class $ToggleEntireAlarmCopyWith<$Res> implements $AlarmSettingEventCopyWith<$Res> {
  factory $ToggleEntireAlarmCopyWith(ToggleEntireAlarm value, $Res Function(ToggleEntireAlarm) _then) = _$ToggleEntireAlarmCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ToggleEntireAlarmCopyWithImpl<$Res>
    implements $ToggleEntireAlarmCopyWith<$Res> {
  _$ToggleEntireAlarmCopyWithImpl(this._self, this._then);

  final ToggleEntireAlarm _self;
  final $Res Function(ToggleEntireAlarm) _then;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ToggleEntireAlarm(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ToggleIndividualAlarm implements AlarmSettingEvent {
  const ToggleIndividualAlarm({required this.type, required this.value});
  

 final  String type;
 final  bool value;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleIndividualAlarmCopyWith<ToggleIndividualAlarm> get copyWith => _$ToggleIndividualAlarmCopyWithImpl<ToggleIndividualAlarm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleIndividualAlarm&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,type,value);

@override
String toString() {
  return 'AlarmSettingEvent.toggleIndividualAlarm(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $ToggleIndividualAlarmCopyWith<$Res> implements $AlarmSettingEventCopyWith<$Res> {
  factory $ToggleIndividualAlarmCopyWith(ToggleIndividualAlarm value, $Res Function(ToggleIndividualAlarm) _then) = _$ToggleIndividualAlarmCopyWithImpl;
@useResult
$Res call({
 String type, bool value
});




}
/// @nodoc
class _$ToggleIndividualAlarmCopyWithImpl<$Res>
    implements $ToggleIndividualAlarmCopyWith<$Res> {
  _$ToggleIndividualAlarmCopyWithImpl(this._self, this._then);

  final ToggleIndividualAlarm _self;
  final $Res Function(ToggleIndividualAlarm) _then;

/// Create a copy of AlarmSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? value = null,}) {
  return _then(ToggleIndividualAlarm(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
