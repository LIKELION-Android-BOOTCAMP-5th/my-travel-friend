// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_unread_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatUnreadEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUnreadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatUnreadEvent()';
}


}

/// @nodoc
class $ChatUnreadEventCopyWith<$Res>  {
$ChatUnreadEventCopyWith(ChatUnreadEvent _, $Res Function(ChatUnreadEvent) __);
}


/// Adds pattern-matching-related methods to [ChatUnreadEvent].
extension ChatUnreadEventPatterns on ChatUnreadEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StartUnreadSubscription value)?  startSubscription,TResult Function( StopUnreadSubscription value)?  stopSubscription,TResult Function( OnNewUnreadMessage value)?  onNewMessage,TResult Function( ResetUnreadCount value)?  resetCount,TResult Function( RefreshUnreadCount value)?  refreshCount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartUnreadSubscription() when startSubscription != null:
return startSubscription(_that);case StopUnreadSubscription() when stopSubscription != null:
return stopSubscription(_that);case OnNewUnreadMessage() when onNewMessage != null:
return onNewMessage(_that);case ResetUnreadCount() when resetCount != null:
return resetCount(_that);case RefreshUnreadCount() when refreshCount != null:
return refreshCount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StartUnreadSubscription value)  startSubscription,required TResult Function( StopUnreadSubscription value)  stopSubscription,required TResult Function( OnNewUnreadMessage value)  onNewMessage,required TResult Function( ResetUnreadCount value)  resetCount,required TResult Function( RefreshUnreadCount value)  refreshCount,}){
final _that = this;
switch (_that) {
case StartUnreadSubscription():
return startSubscription(_that);case StopUnreadSubscription():
return stopSubscription(_that);case OnNewUnreadMessage():
return onNewMessage(_that);case ResetUnreadCount():
return resetCount(_that);case RefreshUnreadCount():
return refreshCount(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StartUnreadSubscription value)?  startSubscription,TResult? Function( StopUnreadSubscription value)?  stopSubscription,TResult? Function( OnNewUnreadMessage value)?  onNewMessage,TResult? Function( ResetUnreadCount value)?  resetCount,TResult? Function( RefreshUnreadCount value)?  refreshCount,}){
final _that = this;
switch (_that) {
case StartUnreadSubscription() when startSubscription != null:
return startSubscription(_that);case StopUnreadSubscription() when stopSubscription != null:
return stopSubscription(_that);case OnNewUnreadMessage() when onNewMessage != null:
return onNewMessage(_that);case ResetUnreadCount() when resetCount != null:
return resetCount(_that);case RefreshUnreadCount() when refreshCount != null:
return refreshCount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId,  int userId)?  startSubscription,TResult Function()?  stopSubscription,TResult Function()?  onNewMessage,TResult Function()?  resetCount,TResult Function()?  refreshCount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartUnreadSubscription() when startSubscription != null:
return startSubscription(_that.tripId,_that.userId);case StopUnreadSubscription() when stopSubscription != null:
return stopSubscription();case OnNewUnreadMessage() when onNewMessage != null:
return onNewMessage();case ResetUnreadCount() when resetCount != null:
return resetCount();case RefreshUnreadCount() when refreshCount != null:
return refreshCount();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId,  int userId)  startSubscription,required TResult Function()  stopSubscription,required TResult Function()  onNewMessage,required TResult Function()  resetCount,required TResult Function()  refreshCount,}) {final _that = this;
switch (_that) {
case StartUnreadSubscription():
return startSubscription(_that.tripId,_that.userId);case StopUnreadSubscription():
return stopSubscription();case OnNewUnreadMessage():
return onNewMessage();case ResetUnreadCount():
return resetCount();case RefreshUnreadCount():
return refreshCount();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId,  int userId)?  startSubscription,TResult? Function()?  stopSubscription,TResult? Function()?  onNewMessage,TResult? Function()?  resetCount,TResult? Function()?  refreshCount,}) {final _that = this;
switch (_that) {
case StartUnreadSubscription() when startSubscription != null:
return startSubscription(_that.tripId,_that.userId);case StopUnreadSubscription() when stopSubscription != null:
return stopSubscription();case OnNewUnreadMessage() when onNewMessage != null:
return onNewMessage();case ResetUnreadCount() when resetCount != null:
return resetCount();case RefreshUnreadCount() when refreshCount != null:
return refreshCount();case _:
  return null;

}
}

}

/// @nodoc


class StartUnreadSubscription implements ChatUnreadEvent {
  const StartUnreadSubscription({required this.tripId, required this.userId});
  

 final  int tripId;
 final  int userId;

/// Create a copy of ChatUnreadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartUnreadSubscriptionCopyWith<StartUnreadSubscription> get copyWith => _$StartUnreadSubscriptionCopyWithImpl<StartUnreadSubscription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartUnreadSubscription&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId);

@override
String toString() {
  return 'ChatUnreadEvent.startSubscription(tripId: $tripId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $StartUnreadSubscriptionCopyWith<$Res> implements $ChatUnreadEventCopyWith<$Res> {
  factory $StartUnreadSubscriptionCopyWith(StartUnreadSubscription value, $Res Function(StartUnreadSubscription) _then) = _$StartUnreadSubscriptionCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId
});




}
/// @nodoc
class _$StartUnreadSubscriptionCopyWithImpl<$Res>
    implements $StartUnreadSubscriptionCopyWith<$Res> {
  _$StartUnreadSubscriptionCopyWithImpl(this._self, this._then);

  final StartUnreadSubscription _self;
  final $Res Function(StartUnreadSubscription) _then;

/// Create a copy of ChatUnreadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,}) {
  return _then(StartUnreadSubscription(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StopUnreadSubscription implements ChatUnreadEvent {
  const StopUnreadSubscription();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopUnreadSubscription);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatUnreadEvent.stopSubscription()';
}


}




/// @nodoc


class OnNewUnreadMessage implements ChatUnreadEvent {
  const OnNewUnreadMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnNewUnreadMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatUnreadEvent.onNewMessage()';
}


}




/// @nodoc


class ResetUnreadCount implements ChatUnreadEvent {
  const ResetUnreadCount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetUnreadCount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatUnreadEvent.resetCount()';
}


}




/// @nodoc


class RefreshUnreadCount implements ChatUnreadEvent {
  const RefreshUnreadCount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshUnreadCount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatUnreadEvent.refreshCount()';
}


}




// dart format on
