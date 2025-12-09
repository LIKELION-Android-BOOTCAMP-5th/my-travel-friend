// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_setting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlarmSettingDTO {

 int get id;@JsonKey(name: 'entire_alarm') bool get entireAlarm;@JsonKey(name: 'trip_request') bool get tripRequest;@JsonKey(name: 'friend_request') bool get friendRequest;@JsonKey(name: 'schedule_edited') bool get scheduleEdited;@JsonKey(name: 'schedule_added') bool get scheduleAdded;@JsonKey(name: 'schedule_deleted') bool get scheduleDeleted;@JsonKey(name: 'talk_message') bool get talkMessage;@JsonKey(name: 'd-day') bool get dDay;@JsonKey(name: 'user_id') int get userId;
/// Create a copy of AlarmSettingDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmSettingDTOCopyWith<AlarmSettingDTO> get copyWith => _$AlarmSettingDTOCopyWithImpl<AlarmSettingDTO>(this as AlarmSettingDTO, _$identity);

  /// Serializes this AlarmSettingDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmSettingDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.entireAlarm, entireAlarm) || other.entireAlarm == entireAlarm)&&(identical(other.tripRequest, tripRequest) || other.tripRequest == tripRequest)&&(identical(other.friendRequest, friendRequest) || other.friendRequest == friendRequest)&&(identical(other.scheduleEdited, scheduleEdited) || other.scheduleEdited == scheduleEdited)&&(identical(other.scheduleAdded, scheduleAdded) || other.scheduleAdded == scheduleAdded)&&(identical(other.scheduleDeleted, scheduleDeleted) || other.scheduleDeleted == scheduleDeleted)&&(identical(other.talkMessage, talkMessage) || other.talkMessage == talkMessage)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entireAlarm,tripRequest,friendRequest,scheduleEdited,scheduleAdded,scheduleDeleted,talkMessage,dDay,userId);

@override
String toString() {
  return 'AlarmSettingDTO(id: $id, entireAlarm: $entireAlarm, tripRequest: $tripRequest, friendRequest: $friendRequest, scheduleEdited: $scheduleEdited, scheduleAdded: $scheduleAdded, scheduleDeleted: $scheduleDeleted, talkMessage: $talkMessage, dDay: $dDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AlarmSettingDTOCopyWith<$Res>  {
  factory $AlarmSettingDTOCopyWith(AlarmSettingDTO value, $Res Function(AlarmSettingDTO) _then) = _$AlarmSettingDTOCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'entire_alarm') bool entireAlarm,@JsonKey(name: 'trip_request') bool tripRequest,@JsonKey(name: 'friend_request') bool friendRequest,@JsonKey(name: 'schedule_edited') bool scheduleEdited,@JsonKey(name: 'schedule_added') bool scheduleAdded,@JsonKey(name: 'schedule_deleted') bool scheduleDeleted,@JsonKey(name: 'talk_message') bool talkMessage,@JsonKey(name: 'd-day') bool dDay,@JsonKey(name: 'user_id') int userId
});




}
/// @nodoc
class _$AlarmSettingDTOCopyWithImpl<$Res>
    implements $AlarmSettingDTOCopyWith<$Res> {
  _$AlarmSettingDTOCopyWithImpl(this._self, this._then);

  final AlarmSettingDTO _self;
  final $Res Function(AlarmSettingDTO) _then;

/// Create a copy of AlarmSettingDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? entireAlarm = null,Object? tripRequest = null,Object? friendRequest = null,Object? scheduleEdited = null,Object? scheduleAdded = null,Object? scheduleDeleted = null,Object? talkMessage = null,Object? dDay = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,entireAlarm: null == entireAlarm ? _self.entireAlarm : entireAlarm // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [AlarmSettingDTO].
extension AlarmSettingDTOPatterns on AlarmSettingDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmSettingDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmSettingDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmSettingDTO value)  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmSettingDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'entire_alarm')  bool entireAlarm, @JsonKey(name: 'trip_request')  bool tripRequest, @JsonKey(name: 'friend_request')  bool friendRequest, @JsonKey(name: 'schedule_edited')  bool scheduleEdited, @JsonKey(name: 'schedule_added')  bool scheduleAdded, @JsonKey(name: 'schedule_deleted')  bool scheduleDeleted, @JsonKey(name: 'talk_message')  bool talkMessage, @JsonKey(name: 'd-day')  bool dDay, @JsonKey(name: 'user_id')  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmSettingDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'entire_alarm')  bool entireAlarm, @JsonKey(name: 'trip_request')  bool tripRequest, @JsonKey(name: 'friend_request')  bool friendRequest, @JsonKey(name: 'schedule_edited')  bool scheduleEdited, @JsonKey(name: 'schedule_added')  bool scheduleAdded, @JsonKey(name: 'schedule_deleted')  bool scheduleDeleted, @JsonKey(name: 'talk_message')  bool talkMessage, @JsonKey(name: 'd-day')  bool dDay, @JsonKey(name: 'user_id')  int userId)  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'entire_alarm')  bool entireAlarm, @JsonKey(name: 'trip_request')  bool tripRequest, @JsonKey(name: 'friend_request')  bool friendRequest, @JsonKey(name: 'schedule_edited')  bool scheduleEdited, @JsonKey(name: 'schedule_added')  bool scheduleAdded, @JsonKey(name: 'schedule_deleted')  bool scheduleDeleted, @JsonKey(name: 'talk_message')  bool talkMessage, @JsonKey(name: 'd-day')  bool dDay, @JsonKey(name: 'user_id')  int userId)?  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingDTO() when $default != null:
return $default(_that.id,_that.entireAlarm,_that.tripRequest,_that.friendRequest,_that.scheduleEdited,_that.scheduleAdded,_that.scheduleDeleted,_that.talkMessage,_that.dDay,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlarmSettingDTO extends AlarmSettingDTO {
  const _AlarmSettingDTO({required this.id, @JsonKey(name: 'entire_alarm') required this.entireAlarm, @JsonKey(name: 'trip_request') required this.tripRequest, @JsonKey(name: 'friend_request') required this.friendRequest, @JsonKey(name: 'schedule_edited') required this.scheduleEdited, @JsonKey(name: 'schedule_added') required this.scheduleAdded, @JsonKey(name: 'schedule_deleted') required this.scheduleDeleted, @JsonKey(name: 'talk_message') required this.talkMessage, @JsonKey(name: 'd-day') required this.dDay, @JsonKey(name: 'user_id') required this.userId}): super._();
  factory _AlarmSettingDTO.fromJson(Map<String, dynamic> json) => _$AlarmSettingDTOFromJson(json);

@override final  int id;
@override@JsonKey(name: 'entire_alarm') final  bool entireAlarm;
@override@JsonKey(name: 'trip_request') final  bool tripRequest;
@override@JsonKey(name: 'friend_request') final  bool friendRequest;
@override@JsonKey(name: 'schedule_edited') final  bool scheduleEdited;
@override@JsonKey(name: 'schedule_added') final  bool scheduleAdded;
@override@JsonKey(name: 'schedule_deleted') final  bool scheduleDeleted;
@override@JsonKey(name: 'talk_message') final  bool talkMessage;
@override@JsonKey(name: 'd-day') final  bool dDay;
@override@JsonKey(name: 'user_id') final  int userId;

/// Create a copy of AlarmSettingDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmSettingDTOCopyWith<_AlarmSettingDTO> get copyWith => __$AlarmSettingDTOCopyWithImpl<_AlarmSettingDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlarmSettingDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmSettingDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.entireAlarm, entireAlarm) || other.entireAlarm == entireAlarm)&&(identical(other.tripRequest, tripRequest) || other.tripRequest == tripRequest)&&(identical(other.friendRequest, friendRequest) || other.friendRequest == friendRequest)&&(identical(other.scheduleEdited, scheduleEdited) || other.scheduleEdited == scheduleEdited)&&(identical(other.scheduleAdded, scheduleAdded) || other.scheduleAdded == scheduleAdded)&&(identical(other.scheduleDeleted, scheduleDeleted) || other.scheduleDeleted == scheduleDeleted)&&(identical(other.talkMessage, talkMessage) || other.talkMessage == talkMessage)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entireAlarm,tripRequest,friendRequest,scheduleEdited,scheduleAdded,scheduleDeleted,talkMessage,dDay,userId);

@override
String toString() {
  return 'AlarmSettingDTO(id: $id, entireAlarm: $entireAlarm, tripRequest: $tripRequest, friendRequest: $friendRequest, scheduleEdited: $scheduleEdited, scheduleAdded: $scheduleAdded, scheduleDeleted: $scheduleDeleted, talkMessage: $talkMessage, dDay: $dDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AlarmSettingDTOCopyWith<$Res> implements $AlarmSettingDTOCopyWith<$Res> {
  factory _$AlarmSettingDTOCopyWith(_AlarmSettingDTO value, $Res Function(_AlarmSettingDTO) _then) = __$AlarmSettingDTOCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'entire_alarm') bool entireAlarm,@JsonKey(name: 'trip_request') bool tripRequest,@JsonKey(name: 'friend_request') bool friendRequest,@JsonKey(name: 'schedule_edited') bool scheduleEdited,@JsonKey(name: 'schedule_added') bool scheduleAdded,@JsonKey(name: 'schedule_deleted') bool scheduleDeleted,@JsonKey(name: 'talk_message') bool talkMessage,@JsonKey(name: 'd-day') bool dDay,@JsonKey(name: 'user_id') int userId
});




}
/// @nodoc
class __$AlarmSettingDTOCopyWithImpl<$Res>
    implements _$AlarmSettingDTOCopyWith<$Res> {
  __$AlarmSettingDTOCopyWithImpl(this._self, this._then);

  final _AlarmSettingDTO _self;
  final $Res Function(_AlarmSettingDTO) _then;

/// Create a copy of AlarmSettingDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? entireAlarm = null,Object? tripRequest = null,Object? friendRequest = null,Object? scheduleEdited = null,Object? scheduleAdded = null,Object? scheduleDeleted = null,Object? talkMessage = null,Object? dDay = null,Object? userId = null,}) {
  return _then(_AlarmSettingDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,entireAlarm: null == entireAlarm ? _self.entireAlarm : entireAlarm // ignore: cast_nullable_to_non_nullable
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
