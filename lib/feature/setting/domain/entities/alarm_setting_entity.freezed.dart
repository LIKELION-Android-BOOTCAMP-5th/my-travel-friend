// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmSettingEntity {

 int? get id; bool get entireAlarm; bool get tripRequest; bool get friendRequest; bool get scheduleEdited; bool get scheduleAdded; bool get scheduleDeleted; bool get talkMessage; bool get dDay; int get userId;
/// Create a copy of AlarmSettingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmSettingEntityCopyWith<AlarmSettingEntity> get copyWith => _$AlarmSettingEntityCopyWithImpl<AlarmSettingEntity>(this as AlarmSettingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmSettingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.entireAlarm, entireAlarm) || other.entireAlarm == entireAlarm)&&(identical(other.tripRequest, tripRequest) || other.tripRequest == tripRequest)&&(identical(other.friendRequest, friendRequest) || other.friendRequest == friendRequest)&&(identical(other.scheduleEdited, scheduleEdited) || other.scheduleEdited == scheduleEdited)&&(identical(other.scheduleAdded, scheduleAdded) || other.scheduleAdded == scheduleAdded)&&(identical(other.scheduleDeleted, scheduleDeleted) || other.scheduleDeleted == scheduleDeleted)&&(identical(other.talkMessage, talkMessage) || other.talkMessage == talkMessage)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,entireAlarm,tripRequest,friendRequest,scheduleEdited,scheduleAdded,scheduleDeleted,talkMessage,dDay,userId);

@override
String toString() {
  return 'AlarmSettingEntity(id: $id, entireAlarm: $entireAlarm, tripRequest: $tripRequest, friendRequest: $friendRequest, scheduleEdited: $scheduleEdited, scheduleAdded: $scheduleAdded, scheduleDeleted: $scheduleDeleted, talkMessage: $talkMessage, dDay: $dDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AlarmSettingEntityCopyWith<$Res>  {
  factory $AlarmSettingEntityCopyWith(AlarmSettingEntity value, $Res Function(AlarmSettingEntity) _then) = _$AlarmSettingEntityCopyWithImpl;
@useResult
$Res call({
 int? id, bool entireAlarm, bool tripRequest, bool friendRequest, bool scheduleEdited, bool scheduleAdded, bool scheduleDeleted, bool talkMessage, bool dDay, int userId
});




}
/// @nodoc
class _$AlarmSettingEntityCopyWithImpl<$Res>
    implements $AlarmSettingEntityCopyWith<$Res> {
  _$AlarmSettingEntityCopyWithImpl(this._self, this._then);

  final AlarmSettingEntity _self;
  final $Res Function(AlarmSettingEntity) _then;

/// Create a copy of AlarmSettingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? entireAlarm = null,Object? tripRequest = null,Object? friendRequest = null,Object? scheduleEdited = null,Object? scheduleAdded = null,Object? scheduleDeleted = null,Object? talkMessage = null,Object? dDay = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,entireAlarm: null == entireAlarm ? _self.entireAlarm : entireAlarm // ignore: cast_nullable_to_non_nullable
as bool,tripRequest: null == tripRequest ? _self.tripRequest : tripRequest // ignore: cast_nullable_to_non_nullable
as bool,friendRequest: null == friendRequest ? _self.friendRequest : friendRequest // ignore: cast_nullable_to_non_nullable
as bool,scheduleEdited: null == scheduleEdited ? _self.scheduleEdited : scheduleEdited // ignore: cast_nullable_to_non_nullable
as bool,scheduleAdded: null == scheduleAdded ? _self.scheduleAdded : scheduleAdded // ignore: cast_nullable_to_non_nullable
as bool,scheduleDeleted: null == scheduleDeleted ? _self.scheduleDeleted : scheduleDeleted // ignore: cast_nullable_to_non_nullable
as bool,talkMessage: null == talkMessage ? _self.talkMessage : talkMessage // ignore: cast_nullable_to_non_nullable
as bool,dDay: null == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmSettingEntity].
extension AlarmSettingEntityPatterns on AlarmSettingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmSettingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmSettingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmSettingEntity value)  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmSettingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  bool entireAlarm,  bool tripRequest,  bool friendRequest,  bool scheduleEdited,  bool scheduleAdded,  bool scheduleDeleted,  bool talkMessage,  bool dDay,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmSettingEntity() when $default != null:
return $default(_that.id,_that.entireAlarm,_that.tripRequest,_that.friendRequest,_that.scheduleEdited,_that.scheduleAdded,_that.scheduleDeleted,_that.talkMessage,_that.dDay,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  bool entireAlarm,  bool tripRequest,  bool friendRequest,  bool scheduleEdited,  bool scheduleAdded,  bool scheduleDeleted,  bool talkMessage,  bool dDay,  int userId)  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingEntity():
return $default(_that.id,_that.entireAlarm,_that.tripRequest,_that.friendRequest,_that.scheduleEdited,_that.scheduleAdded,_that.scheduleDeleted,_that.talkMessage,_that.dDay,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  bool entireAlarm,  bool tripRequest,  bool friendRequest,  bool scheduleEdited,  bool scheduleAdded,  bool scheduleDeleted,  bool talkMessage,  bool dDay,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingEntity() when $default != null:
return $default(_that.id,_that.entireAlarm,_that.tripRequest,_that.friendRequest,_that.scheduleEdited,_that.scheduleAdded,_that.scheduleDeleted,_that.talkMessage,_that.dDay,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmSettingEntity implements AlarmSettingEntity {
  const _AlarmSettingEntity({this.id, required this.entireAlarm, required this.tripRequest, required this.friendRequest, required this.scheduleEdited, required this.scheduleAdded, required this.scheduleDeleted, required this.talkMessage, required this.dDay, required this.userId});
  

@override final  int? id;
@override final  bool entireAlarm;
@override final  bool tripRequest;
@override final  bool friendRequest;
@override final  bool scheduleEdited;
@override final  bool scheduleAdded;
@override final  bool scheduleDeleted;
@override final  bool talkMessage;
@override final  bool dDay;
@override final  int userId;

/// Create a copy of AlarmSettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmSettingEntityCopyWith<_AlarmSettingEntity> get copyWith => __$AlarmSettingEntityCopyWithImpl<_AlarmSettingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmSettingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.entireAlarm, entireAlarm) || other.entireAlarm == entireAlarm)&&(identical(other.tripRequest, tripRequest) || other.tripRequest == tripRequest)&&(identical(other.friendRequest, friendRequest) || other.friendRequest == friendRequest)&&(identical(other.scheduleEdited, scheduleEdited) || other.scheduleEdited == scheduleEdited)&&(identical(other.scheduleAdded, scheduleAdded) || other.scheduleAdded == scheduleAdded)&&(identical(other.scheduleDeleted, scheduleDeleted) || other.scheduleDeleted == scheduleDeleted)&&(identical(other.talkMessage, talkMessage) || other.talkMessage == talkMessage)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,entireAlarm,tripRequest,friendRequest,scheduleEdited,scheduleAdded,scheduleDeleted,talkMessage,dDay,userId);

@override
String toString() {
  return 'AlarmSettingEntity(id: $id, entireAlarm: $entireAlarm, tripRequest: $tripRequest, friendRequest: $friendRequest, scheduleEdited: $scheduleEdited, scheduleAdded: $scheduleAdded, scheduleDeleted: $scheduleDeleted, talkMessage: $talkMessage, dDay: $dDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AlarmSettingEntityCopyWith<$Res> implements $AlarmSettingEntityCopyWith<$Res> {
  factory _$AlarmSettingEntityCopyWith(_AlarmSettingEntity value, $Res Function(_AlarmSettingEntity) _then) = __$AlarmSettingEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, bool entireAlarm, bool tripRequest, bool friendRequest, bool scheduleEdited, bool scheduleAdded, bool scheduleDeleted, bool talkMessage, bool dDay, int userId
});




}
/// @nodoc
class __$AlarmSettingEntityCopyWithImpl<$Res>
    implements _$AlarmSettingEntityCopyWith<$Res> {
  __$AlarmSettingEntityCopyWithImpl(this._self, this._then);

  final _AlarmSettingEntity _self;
  final $Res Function(_AlarmSettingEntity) _then;

/// Create a copy of AlarmSettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? entireAlarm = null,Object? tripRequest = null,Object? friendRequest = null,Object? scheduleEdited = null,Object? scheduleAdded = null,Object? scheduleDeleted = null,Object? talkMessage = null,Object? dDay = null,Object? userId = null,}) {
  return _then(_AlarmSettingEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,entireAlarm: null == entireAlarm ? _self.entireAlarm : entireAlarm // ignore: cast_nullable_to_non_nullable
as bool,tripRequest: null == tripRequest ? _self.tripRequest : tripRequest // ignore: cast_nullable_to_non_nullable
as bool,friendRequest: null == friendRequest ? _self.friendRequest : friendRequest // ignore: cast_nullable_to_non_nullable
as bool,scheduleEdited: null == scheduleEdited ? _self.scheduleEdited : scheduleEdited // ignore: cast_nullable_to_non_nullable
as bool,scheduleAdded: null == scheduleAdded ? _self.scheduleAdded : scheduleAdded // ignore: cast_nullable_to_non_nullable
as bool,scheduleDeleted: null == scheduleDeleted ? _self.scheduleDeleted : scheduleDeleted // ignore: cast_nullable_to_non_nullable
as bool,talkMessage: null == talkMessage ? _self.talkMessage : talkMessage // ignore: cast_nullable_to_non_nullable
as bool,dDay: null == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
