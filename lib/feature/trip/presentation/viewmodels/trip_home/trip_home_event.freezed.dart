// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripHomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripHomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent()';
}


}

/// @nodoc
class $TripHomeEventCopyWith<$Res>  {
$TripHomeEventCopyWith(TripHomeEvent _, $Res Function(TripHomeEvent) __);
}


/// Adds pattern-matching-related methods to [TripHomeEvent].
extension TripHomeEventPatterns on TripHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTripHome value)?  loadTripHome,TResult Function( ToggleCrew value)?  toggleCrew,TResult Function( OpenInvite value)?  openInvite,TResult Function( CloseInvite value)?  closeInvite,TResult Function( InviteFriend value)?  inviteFriend,TResult Function( SelectDate value)?  selectDate,TResult Function( ChangeCalendarPage value)?  changeCalendarPage,TResult Function( RefreshSchedules value)?  refreshSchedules,TResult Function( ConsumeMessage value)?  consumeMessage,TResult Function( ConsumeAction value)?  consumeAction,TResult Function( ToggleUsefulPhrase value)?  toggleUsefulPhrase,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTripHome() when loadTripHome != null:
return loadTripHome(_that);case ToggleCrew() when toggleCrew != null:
return toggleCrew(_that);case OpenInvite() when openInvite != null:
return openInvite(_that);case CloseInvite() when closeInvite != null:
return closeInvite(_that);case InviteFriend() when inviteFriend != null:
return inviteFriend(_that);case SelectDate() when selectDate != null:
return selectDate(_that);case ChangeCalendarPage() when changeCalendarPage != null:
return changeCalendarPage(_that);case RefreshSchedules() when refreshSchedules != null:
return refreshSchedules(_that);case ConsumeMessage() when consumeMessage != null:
return consumeMessage(_that);case ConsumeAction() when consumeAction != null:
return consumeAction(_that);case ToggleUsefulPhrase() when toggleUsefulPhrase != null:
return toggleUsefulPhrase(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTripHome value)  loadTripHome,required TResult Function( ToggleCrew value)  toggleCrew,required TResult Function( OpenInvite value)  openInvite,required TResult Function( CloseInvite value)  closeInvite,required TResult Function( InviteFriend value)  inviteFriend,required TResult Function( SelectDate value)  selectDate,required TResult Function( ChangeCalendarPage value)  changeCalendarPage,required TResult Function( RefreshSchedules value)  refreshSchedules,required TResult Function( ConsumeMessage value)  consumeMessage,required TResult Function( ConsumeAction value)  consumeAction,required TResult Function( ToggleUsefulPhrase value)  toggleUsefulPhrase,}){
final _that = this;
switch (_that) {
case LoadTripHome():
return loadTripHome(_that);case ToggleCrew():
return toggleCrew(_that);case OpenInvite():
return openInvite(_that);case CloseInvite():
return closeInvite(_that);case InviteFriend():
return inviteFriend(_that);case SelectDate():
return selectDate(_that);case ChangeCalendarPage():
return changeCalendarPage(_that);case RefreshSchedules():
return refreshSchedules(_that);case ConsumeMessage():
return consumeMessage(_that);case ConsumeAction():
return consumeAction(_that);case ToggleUsefulPhrase():
return toggleUsefulPhrase(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTripHome value)?  loadTripHome,TResult? Function( ToggleCrew value)?  toggleCrew,TResult? Function( OpenInvite value)?  openInvite,TResult? Function( CloseInvite value)?  closeInvite,TResult? Function( InviteFriend value)?  inviteFriend,TResult? Function( SelectDate value)?  selectDate,TResult? Function( ChangeCalendarPage value)?  changeCalendarPage,TResult? Function( RefreshSchedules value)?  refreshSchedules,TResult? Function( ConsumeMessage value)?  consumeMessage,TResult? Function( ConsumeAction value)?  consumeAction,TResult? Function( ToggleUsefulPhrase value)?  toggleUsefulPhrase,}){
final _that = this;
switch (_that) {
case LoadTripHome() when loadTripHome != null:
return loadTripHome(_that);case ToggleCrew() when toggleCrew != null:
return toggleCrew(_that);case OpenInvite() when openInvite != null:
return openInvite(_that);case CloseInvite() when closeInvite != null:
return closeInvite(_that);case InviteFriend() when inviteFriend != null:
return inviteFriend(_that);case SelectDate() when selectDate != null:
return selectDate(_that);case ChangeCalendarPage() when changeCalendarPage != null:
return changeCalendarPage(_that);case RefreshSchedules() when refreshSchedules != null:
return refreshSchedules(_that);case ConsumeMessage() when consumeMessage != null:
return consumeMessage(_that);case ConsumeAction() when consumeAction != null:
return consumeAction(_that);case ToggleUsefulPhrase() when toggleUsefulPhrase != null:
return toggleUsefulPhrase(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId,  int myId)?  loadTripHome,TResult Function()?  toggleCrew,TResult Function()?  openInvite,TResult Function()?  closeInvite,TResult Function( UserEntity friend)?  inviteFriend,TResult Function( DateTime date)?  selectDate,TResult Function( int pageIndex)?  changeCalendarPage,TResult Function()?  refreshSchedules,TResult Function()?  consumeMessage,TResult Function()?  consumeAction,TResult Function()?  toggleUsefulPhrase,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTripHome() when loadTripHome != null:
return loadTripHome(_that.tripId,_that.myId);case ToggleCrew() when toggleCrew != null:
return toggleCrew();case OpenInvite() when openInvite != null:
return openInvite();case CloseInvite() when closeInvite != null:
return closeInvite();case InviteFriend() when inviteFriend != null:
return inviteFriend(_that.friend);case SelectDate() when selectDate != null:
return selectDate(_that.date);case ChangeCalendarPage() when changeCalendarPage != null:
return changeCalendarPage(_that.pageIndex);case RefreshSchedules() when refreshSchedules != null:
return refreshSchedules();case ConsumeMessage() when consumeMessage != null:
return consumeMessage();case ConsumeAction() when consumeAction != null:
return consumeAction();case ToggleUsefulPhrase() when toggleUsefulPhrase != null:
return toggleUsefulPhrase();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId,  int myId)  loadTripHome,required TResult Function()  toggleCrew,required TResult Function()  openInvite,required TResult Function()  closeInvite,required TResult Function( UserEntity friend)  inviteFriend,required TResult Function( DateTime date)  selectDate,required TResult Function( int pageIndex)  changeCalendarPage,required TResult Function()  refreshSchedules,required TResult Function()  consumeMessage,required TResult Function()  consumeAction,required TResult Function()  toggleUsefulPhrase,}) {final _that = this;
switch (_that) {
case LoadTripHome():
return loadTripHome(_that.tripId,_that.myId);case ToggleCrew():
return toggleCrew();case OpenInvite():
return openInvite();case CloseInvite():
return closeInvite();case InviteFriend():
return inviteFriend(_that.friend);case SelectDate():
return selectDate(_that.date);case ChangeCalendarPage():
return changeCalendarPage(_that.pageIndex);case RefreshSchedules():
return refreshSchedules();case ConsumeMessage():
return consumeMessage();case ConsumeAction():
return consumeAction();case ToggleUsefulPhrase():
return toggleUsefulPhrase();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId,  int myId)?  loadTripHome,TResult? Function()?  toggleCrew,TResult? Function()?  openInvite,TResult? Function()?  closeInvite,TResult? Function( UserEntity friend)?  inviteFriend,TResult? Function( DateTime date)?  selectDate,TResult? Function( int pageIndex)?  changeCalendarPage,TResult? Function()?  refreshSchedules,TResult? Function()?  consumeMessage,TResult? Function()?  consumeAction,TResult? Function()?  toggleUsefulPhrase,}) {final _that = this;
switch (_that) {
case LoadTripHome() when loadTripHome != null:
return loadTripHome(_that.tripId,_that.myId);case ToggleCrew() when toggleCrew != null:
return toggleCrew();case OpenInvite() when openInvite != null:
return openInvite();case CloseInvite() when closeInvite != null:
return closeInvite();case InviteFriend() when inviteFriend != null:
return inviteFriend(_that.friend);case SelectDate() when selectDate != null:
return selectDate(_that.date);case ChangeCalendarPage() when changeCalendarPage != null:
return changeCalendarPage(_that.pageIndex);case RefreshSchedules() when refreshSchedules != null:
return refreshSchedules();case ConsumeMessage() when consumeMessage != null:
return consumeMessage();case ConsumeAction() when consumeAction != null:
return consumeAction();case ToggleUsefulPhrase() when toggleUsefulPhrase != null:
return toggleUsefulPhrase();case _:
  return null;

}
}

}

/// @nodoc


class LoadTripHome implements TripHomeEvent {
  const LoadTripHome({required this.tripId, required this.myId});
  

 final  int tripId;
 final  int myId;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTripHomeCopyWith<LoadTripHome> get copyWith => _$LoadTripHomeCopyWithImpl<LoadTripHome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTripHome&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.myId, myId) || other.myId == myId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,myId);

@override
String toString() {
  return 'TripHomeEvent.loadTripHome(tripId: $tripId, myId: $myId)';
}


}

/// @nodoc
abstract mixin class $LoadTripHomeCopyWith<$Res> implements $TripHomeEventCopyWith<$Res> {
  factory $LoadTripHomeCopyWith(LoadTripHome value, $Res Function(LoadTripHome) _then) = _$LoadTripHomeCopyWithImpl;
@useResult
$Res call({
 int tripId, int myId
});




}
/// @nodoc
class _$LoadTripHomeCopyWithImpl<$Res>
    implements $LoadTripHomeCopyWith<$Res> {
  _$LoadTripHomeCopyWithImpl(this._self, this._then);

  final LoadTripHome _self;
  final $Res Function(LoadTripHome) _then;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? myId = null,}) {
  return _then(LoadTripHome(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ToggleCrew implements TripHomeEvent {
  const ToggleCrew();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleCrew);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.toggleCrew()';
}


}




/// @nodoc


class OpenInvite implements TripHomeEvent {
  const OpenInvite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenInvite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.openInvite()';
}


}




/// @nodoc


class CloseInvite implements TripHomeEvent {
  const CloseInvite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseInvite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.closeInvite()';
}


}




/// @nodoc


class InviteFriend implements TripHomeEvent {
  const InviteFriend({required this.friend});
  

 final  UserEntity friend;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteFriendCopyWith<InviteFriend> get copyWith => _$InviteFriendCopyWithImpl<InviteFriend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteFriend&&(identical(other.friend, friend) || other.friend == friend));
}


@override
int get hashCode => Object.hash(runtimeType,friend);

@override
String toString() {
  return 'TripHomeEvent.inviteFriend(friend: $friend)';
}


}

/// @nodoc
abstract mixin class $InviteFriendCopyWith<$Res> implements $TripHomeEventCopyWith<$Res> {
  factory $InviteFriendCopyWith(InviteFriend value, $Res Function(InviteFriend) _then) = _$InviteFriendCopyWithImpl;
@useResult
$Res call({
 UserEntity friend
});


$UserEntityCopyWith<$Res> get friend;

}
/// @nodoc
class _$InviteFriendCopyWithImpl<$Res>
    implements $InviteFriendCopyWith<$Res> {
  _$InviteFriendCopyWithImpl(this._self, this._then);

  final InviteFriend _self;
  final $Res Function(InviteFriend) _then;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? friend = null,}) {
  return _then(InviteFriend(
friend: null == friend ? _self.friend : friend // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get friend {
  
  return $UserEntityCopyWith<$Res>(_self.friend, (value) {
    return _then(_self.copyWith(friend: value));
  });
}
}

/// @nodoc


class SelectDate implements TripHomeEvent {
  const SelectDate({required this.date});
  

 final  DateTime date;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectDateCopyWith<SelectDate> get copyWith => _$SelectDateCopyWithImpl<SelectDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectDate&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'TripHomeEvent.selectDate(date: $date)';
}


}

/// @nodoc
abstract mixin class $SelectDateCopyWith<$Res> implements $TripHomeEventCopyWith<$Res> {
  factory $SelectDateCopyWith(SelectDate value, $Res Function(SelectDate) _then) = _$SelectDateCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$SelectDateCopyWithImpl<$Res>
    implements $SelectDateCopyWith<$Res> {
  _$SelectDateCopyWithImpl(this._self, this._then);

  final SelectDate _self;
  final $Res Function(SelectDate) _then;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(SelectDate(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ChangeCalendarPage implements TripHomeEvent {
  const ChangeCalendarPage({required this.pageIndex});
  

 final  int pageIndex;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCalendarPageCopyWith<ChangeCalendarPage> get copyWith => _$ChangeCalendarPageCopyWithImpl<ChangeCalendarPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCalendarPage&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex);

@override
String toString() {
  return 'TripHomeEvent.changeCalendarPage(pageIndex: $pageIndex)';
}


}

/// @nodoc
abstract mixin class $ChangeCalendarPageCopyWith<$Res> implements $TripHomeEventCopyWith<$Res> {
  factory $ChangeCalendarPageCopyWith(ChangeCalendarPage value, $Res Function(ChangeCalendarPage) _then) = _$ChangeCalendarPageCopyWithImpl;
@useResult
$Res call({
 int pageIndex
});




}
/// @nodoc
class _$ChangeCalendarPageCopyWithImpl<$Res>
    implements $ChangeCalendarPageCopyWith<$Res> {
  _$ChangeCalendarPageCopyWithImpl(this._self, this._then);

  final ChangeCalendarPage _self;
  final $Res Function(ChangeCalendarPage) _then;

/// Create a copy of TripHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,}) {
  return _then(ChangeCalendarPage(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RefreshSchedules implements TripHomeEvent {
  const RefreshSchedules();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshSchedules);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.refreshSchedules()';
}


}




/// @nodoc


class ConsumeMessage implements TripHomeEvent {
  const ConsumeMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumeMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.consumeMessage()';
}


}




/// @nodoc


class ConsumeAction implements TripHomeEvent {
  const ConsumeAction();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumeAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.consumeAction()';
}


}




/// @nodoc


class ToggleUsefulPhrase implements TripHomeEvent {
  const ToggleUsefulPhrase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleUsefulPhrase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripHomeEvent.toggleUsefulPhrase()';
}


}




// dart format on
