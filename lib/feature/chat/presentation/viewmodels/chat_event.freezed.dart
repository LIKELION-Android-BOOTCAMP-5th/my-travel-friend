// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EnterChat value)?  enterChat,TResult Function( LeaveChat value)?  leaveChat,TResult Function( SendChat value)?  sendChat,TResult Function( LoadMore value)?  loadMore,TResult Function( OnNewChatReceive value)?  onNewChatReceive,TResult Function( UpdateReadStatus value)?  updateReadStatus,TResult Function( MarkScrollCompleted value)?  markScrollCompleted,TResult Function( ClearError value)?  clearError,TResult Function( RefreshCrews value)?  refreshCrews,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EnterChat() when enterChat != null:
return enterChat(_that);case LeaveChat() when leaveChat != null:
return leaveChat(_that);case SendChat() when sendChat != null:
return sendChat(_that);case LoadMore() when loadMore != null:
return loadMore(_that);case OnNewChatReceive() when onNewChatReceive != null:
return onNewChatReceive(_that);case UpdateReadStatus() when updateReadStatus != null:
return updateReadStatus(_that);case MarkScrollCompleted() when markScrollCompleted != null:
return markScrollCompleted(_that);case ClearError() when clearError != null:
return clearError(_that);case RefreshCrews() when refreshCrews != null:
return refreshCrews(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EnterChat value)  enterChat,required TResult Function( LeaveChat value)  leaveChat,required TResult Function( SendChat value)  sendChat,required TResult Function( LoadMore value)  loadMore,required TResult Function( OnNewChatReceive value)  onNewChatReceive,required TResult Function( UpdateReadStatus value)  updateReadStatus,required TResult Function( MarkScrollCompleted value)  markScrollCompleted,required TResult Function( ClearError value)  clearError,required TResult Function( RefreshCrews value)  refreshCrews,}){
final _that = this;
switch (_that) {
case EnterChat():
return enterChat(_that);case LeaveChat():
return leaveChat(_that);case SendChat():
return sendChat(_that);case LoadMore():
return loadMore(_that);case OnNewChatReceive():
return onNewChatReceive(_that);case UpdateReadStatus():
return updateReadStatus(_that);case MarkScrollCompleted():
return markScrollCompleted(_that);case ClearError():
return clearError(_that);case RefreshCrews():
return refreshCrews(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EnterChat value)?  enterChat,TResult? Function( LeaveChat value)?  leaveChat,TResult? Function( SendChat value)?  sendChat,TResult? Function( LoadMore value)?  loadMore,TResult? Function( OnNewChatReceive value)?  onNewChatReceive,TResult? Function( UpdateReadStatus value)?  updateReadStatus,TResult? Function( MarkScrollCompleted value)?  markScrollCompleted,TResult? Function( ClearError value)?  clearError,TResult? Function( RefreshCrews value)?  refreshCrews,}){
final _that = this;
switch (_that) {
case EnterChat() when enterChat != null:
return enterChat(_that);case LeaveChat() when leaveChat != null:
return leaveChat(_that);case SendChat() when sendChat != null:
return sendChat(_that);case LoadMore() when loadMore != null:
return loadMore(_that);case OnNewChatReceive() when onNewChatReceive != null:
return onNewChatReceive(_that);case UpdateReadStatus() when updateReadStatus != null:
return updateReadStatus(_that);case MarkScrollCompleted() when markScrollCompleted != null:
return markScrollCompleted(_that);case ClearError() when clearError != null:
return clearError(_that);case RefreshCrews() when refreshCrews != null:
return refreshCrews(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId,  int userId)?  enterChat,TResult Function()?  leaveChat,TResult Function( String message)?  sendChat,TResult Function()?  loadMore,TResult Function( List<dynamic> chats)?  onNewChatReceive,TResult Function( int lastReadChatId)?  updateReadStatus,TResult Function()?  markScrollCompleted,TResult Function()?  clearError,TResult Function()?  refreshCrews,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EnterChat() when enterChat != null:
return enterChat(_that.tripId,_that.userId);case LeaveChat() when leaveChat != null:
return leaveChat();case SendChat() when sendChat != null:
return sendChat(_that.message);case LoadMore() when loadMore != null:
return loadMore();case OnNewChatReceive() when onNewChatReceive != null:
return onNewChatReceive(_that.chats);case UpdateReadStatus() when updateReadStatus != null:
return updateReadStatus(_that.lastReadChatId);case MarkScrollCompleted() when markScrollCompleted != null:
return markScrollCompleted();case ClearError() when clearError != null:
return clearError();case RefreshCrews() when refreshCrews != null:
return refreshCrews();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId,  int userId)  enterChat,required TResult Function()  leaveChat,required TResult Function( String message)  sendChat,required TResult Function()  loadMore,required TResult Function( List<dynamic> chats)  onNewChatReceive,required TResult Function( int lastReadChatId)  updateReadStatus,required TResult Function()  markScrollCompleted,required TResult Function()  clearError,required TResult Function()  refreshCrews,}) {final _that = this;
switch (_that) {
case EnterChat():
return enterChat(_that.tripId,_that.userId);case LeaveChat():
return leaveChat();case SendChat():
return sendChat(_that.message);case LoadMore():
return loadMore();case OnNewChatReceive():
return onNewChatReceive(_that.chats);case UpdateReadStatus():
return updateReadStatus(_that.lastReadChatId);case MarkScrollCompleted():
return markScrollCompleted();case ClearError():
return clearError();case RefreshCrews():
return refreshCrews();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId,  int userId)?  enterChat,TResult? Function()?  leaveChat,TResult? Function( String message)?  sendChat,TResult? Function()?  loadMore,TResult? Function( List<dynamic> chats)?  onNewChatReceive,TResult? Function( int lastReadChatId)?  updateReadStatus,TResult? Function()?  markScrollCompleted,TResult? Function()?  clearError,TResult? Function()?  refreshCrews,}) {final _that = this;
switch (_that) {
case EnterChat() when enterChat != null:
return enterChat(_that.tripId,_that.userId);case LeaveChat() when leaveChat != null:
return leaveChat();case SendChat() when sendChat != null:
return sendChat(_that.message);case LoadMore() when loadMore != null:
return loadMore();case OnNewChatReceive() when onNewChatReceive != null:
return onNewChatReceive(_that.chats);case UpdateReadStatus() when updateReadStatus != null:
return updateReadStatus(_that.lastReadChatId);case MarkScrollCompleted() when markScrollCompleted != null:
return markScrollCompleted();case ClearError() when clearError != null:
return clearError();case RefreshCrews() when refreshCrews != null:
return refreshCrews();case _:
  return null;

}
}

}

/// @nodoc


class EnterChat implements ChatEvent {
  const EnterChat({required this.tripId, required this.userId});
  

 final  int tripId;
 final  int userId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnterChatCopyWith<EnterChat> get copyWith => _$EnterChatCopyWithImpl<EnterChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnterChat&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId);

@override
String toString() {
  return 'ChatEvent.enterChat(tripId: $tripId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $EnterChatCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $EnterChatCopyWith(EnterChat value, $Res Function(EnterChat) _then) = _$EnterChatCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId
});




}
/// @nodoc
class _$EnterChatCopyWithImpl<$Res>
    implements $EnterChatCopyWith<$Res> {
  _$EnterChatCopyWithImpl(this._self, this._then);

  final EnterChat _self;
  final $Res Function(EnterChat) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,}) {
  return _then(EnterChat(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LeaveChat implements ChatEvent {
  const LeaveChat();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveChat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.leaveChat()';
}


}




/// @nodoc


class SendChat implements ChatEvent {
  const SendChat({required this.message});
  

 final  String message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendChatCopyWith<SendChat> get copyWith => _$SendChatCopyWithImpl<SendChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendChat&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.sendChat(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendChatCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendChatCopyWith(SendChat value, $Res Function(SendChat) _then) = _$SendChatCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendChatCopyWithImpl<$Res>
    implements $SendChatCopyWith<$Res> {
  _$SendChatCopyWithImpl(this._self, this._then);

  final SendChat _self;
  final $Res Function(SendChat) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendChat(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadMore implements ChatEvent {
  const LoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadMore()';
}


}




/// @nodoc


class OnNewChatReceive implements ChatEvent {
  const OnNewChatReceive({required final  List<dynamic> chats}): _chats = chats;
  

 final  List<dynamic> _chats;
 List<dynamic> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnNewChatReceiveCopyWith<OnNewChatReceive> get copyWith => _$OnNewChatReceiveCopyWithImpl<OnNewChatReceive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnNewChatReceive&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatEvent.onNewChatReceive(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $OnNewChatReceiveCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $OnNewChatReceiveCopyWith(OnNewChatReceive value, $Res Function(OnNewChatReceive) _then) = _$OnNewChatReceiveCopyWithImpl;
@useResult
$Res call({
 List<dynamic> chats
});




}
/// @nodoc
class _$OnNewChatReceiveCopyWithImpl<$Res>
    implements $OnNewChatReceiveCopyWith<$Res> {
  _$OnNewChatReceiveCopyWithImpl(this._self, this._then);

  final OnNewChatReceive _self;
  final $Res Function(OnNewChatReceive) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(OnNewChatReceive(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class UpdateReadStatus implements ChatEvent {
  const UpdateReadStatus({required this.lastReadChatId});
  

 final  int lastReadChatId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReadStatusCopyWith<UpdateReadStatus> get copyWith => _$UpdateReadStatusCopyWithImpl<UpdateReadStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReadStatus&&(identical(other.lastReadChatId, lastReadChatId) || other.lastReadChatId == lastReadChatId));
}


@override
int get hashCode => Object.hash(runtimeType,lastReadChatId);

@override
String toString() {
  return 'ChatEvent.updateReadStatus(lastReadChatId: $lastReadChatId)';
}


}

/// @nodoc
abstract mixin class $UpdateReadStatusCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $UpdateReadStatusCopyWith(UpdateReadStatus value, $Res Function(UpdateReadStatus) _then) = _$UpdateReadStatusCopyWithImpl;
@useResult
$Res call({
 int lastReadChatId
});




}
/// @nodoc
class _$UpdateReadStatusCopyWithImpl<$Res>
    implements $UpdateReadStatusCopyWith<$Res> {
  _$UpdateReadStatusCopyWithImpl(this._self, this._then);

  final UpdateReadStatus _self;
  final $Res Function(UpdateReadStatus) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastReadChatId = null,}) {
  return _then(UpdateReadStatus(
lastReadChatId: null == lastReadChatId ? _self.lastReadChatId : lastReadChatId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MarkScrollCompleted implements ChatEvent {
  const MarkScrollCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkScrollCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.markScrollCompleted()';
}


}




/// @nodoc


class ClearError implements ChatEvent {
  const ClearError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearError()';
}


}




/// @nodoc


class RefreshCrews implements ChatEvent {
  const RefreshCrews();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshCrews);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.refreshCrews()';
}


}




// dart format on
