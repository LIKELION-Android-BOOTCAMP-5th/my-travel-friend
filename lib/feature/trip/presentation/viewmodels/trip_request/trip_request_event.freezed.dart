// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripRequestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripRequestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TripRequestEvent()';
}


}

/// @nodoc
class $TripRequestEventCopyWith<$Res>  {
$TripRequestEventCopyWith(TripRequestEvent _, $Res Function(TripRequestEvent) __);
}


/// Adds pattern-matching-related methods to [TripRequestEvent].
extension TripRequestEventPatterns on TripRequestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateTripRequest value)?  createTripRequest,TResult Function( AcceptTripRequest value)?  acceptTripRequest,TResult Function( DeleteTripRequest value)?  deleteTripRequest,TResult Function( GetTripRequest value)?  getTripRequest,TResult Function( AddTrip value)?  addTrip,TResult Function( GetTripsByIds value)?  getTripsByIds,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateTripRequest() when createTripRequest != null:
return createTripRequest(_that);case AcceptTripRequest() when acceptTripRequest != null:
return acceptTripRequest(_that);case DeleteTripRequest() when deleteTripRequest != null:
return deleteTripRequest(_that);case GetTripRequest() when getTripRequest != null:
return getTripRequest(_that);case AddTrip() when addTrip != null:
return addTrip(_that);case GetTripsByIds() when getTripsByIds != null:
return getTripsByIds(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateTripRequest value)  createTripRequest,required TResult Function( AcceptTripRequest value)  acceptTripRequest,required TResult Function( DeleteTripRequest value)  deleteTripRequest,required TResult Function( GetTripRequest value)  getTripRequest,required TResult Function( AddTrip value)  addTrip,required TResult Function( GetTripsByIds value)  getTripsByIds,}){
final _that = this;
switch (_that) {
case CreateTripRequest():
return createTripRequest(_that);case AcceptTripRequest():
return acceptTripRequest(_that);case DeleteTripRequest():
return deleteTripRequest(_that);case GetTripRequest():
return getTripRequest(_that);case AddTrip():
return addTrip(_that);case GetTripsByIds():
return getTripsByIds(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateTripRequest value)?  createTripRequest,TResult? Function( AcceptTripRequest value)?  acceptTripRequest,TResult? Function( DeleteTripRequest value)?  deleteTripRequest,TResult? Function( GetTripRequest value)?  getTripRequest,TResult? Function( AddTrip value)?  addTrip,TResult? Function( GetTripsByIds value)?  getTripsByIds,}){
final _that = this;
switch (_that) {
case CreateTripRequest() when createTripRequest != null:
return createTripRequest(_that);case AcceptTripRequest() when acceptTripRequest != null:
return acceptTripRequest(_that);case DeleteTripRequest() when deleteTripRequest != null:
return deleteTripRequest(_that);case GetTripRequest() when getTripRequest != null:
return getTripRequest(_that);case AddTrip() when addTrip != null:
return addTrip(_that);case GetTripsByIds() when getTripsByIds != null:
return getTripsByIds(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int requestId,  int targetId,  int tripId)?  createTripRequest,TResult Function( int requestId,  int tripId,  int myUserId)?  acceptTripRequest,TResult Function( int id)?  deleteTripRequest,TResult Function( dynamic myId)?  getTripRequest,TResult Function( int myId,  int tripId)?  addTrip,TResult Function( List<int> tripIds)?  getTripsByIds,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateTripRequest() when createTripRequest != null:
return createTripRequest(_that.requestId,_that.targetId,_that.tripId);case AcceptTripRequest() when acceptTripRequest != null:
return acceptTripRequest(_that.requestId,_that.tripId,_that.myUserId);case DeleteTripRequest() when deleteTripRequest != null:
return deleteTripRequest(_that.id);case GetTripRequest() when getTripRequest != null:
return getTripRequest(_that.myId);case AddTrip() when addTrip != null:
return addTrip(_that.myId,_that.tripId);case GetTripsByIds() when getTripsByIds != null:
return getTripsByIds(_that.tripIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int requestId,  int targetId,  int tripId)  createTripRequest,required TResult Function( int requestId,  int tripId,  int myUserId)  acceptTripRequest,required TResult Function( int id)  deleteTripRequest,required TResult Function( dynamic myId)  getTripRequest,required TResult Function( int myId,  int tripId)  addTrip,required TResult Function( List<int> tripIds)  getTripsByIds,}) {final _that = this;
switch (_that) {
case CreateTripRequest():
return createTripRequest(_that.requestId,_that.targetId,_that.tripId);case AcceptTripRequest():
return acceptTripRequest(_that.requestId,_that.tripId,_that.myUserId);case DeleteTripRequest():
return deleteTripRequest(_that.id);case GetTripRequest():
return getTripRequest(_that.myId);case AddTrip():
return addTrip(_that.myId,_that.tripId);case GetTripsByIds():
return getTripsByIds(_that.tripIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int requestId,  int targetId,  int tripId)?  createTripRequest,TResult? Function( int requestId,  int tripId,  int myUserId)?  acceptTripRequest,TResult? Function( int id)?  deleteTripRequest,TResult? Function( dynamic myId)?  getTripRequest,TResult? Function( int myId,  int tripId)?  addTrip,TResult? Function( List<int> tripIds)?  getTripsByIds,}) {final _that = this;
switch (_that) {
case CreateTripRequest() when createTripRequest != null:
return createTripRequest(_that.requestId,_that.targetId,_that.tripId);case AcceptTripRequest() when acceptTripRequest != null:
return acceptTripRequest(_that.requestId,_that.tripId,_that.myUserId);case DeleteTripRequest() when deleteTripRequest != null:
return deleteTripRequest(_that.id);case GetTripRequest() when getTripRequest != null:
return getTripRequest(_that.myId);case AddTrip() when addTrip != null:
return addTrip(_that.myId,_that.tripId);case GetTripsByIds() when getTripsByIds != null:
return getTripsByIds(_that.tripIds);case _:
  return null;

}
}

}

/// @nodoc


class CreateTripRequest implements TripRequestEvent {
  const CreateTripRequest({required this.requestId, required this.targetId, required this.tripId});
  

 final  int requestId;
 final  int targetId;
 final  int tripId;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTripRequestCopyWith<CreateTripRequest> get copyWith => _$CreateTripRequestCopyWithImpl<CreateTripRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTripRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.tripId, tripId) || other.tripId == tripId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,targetId,tripId);

@override
String toString() {
  return 'TripRequestEvent.createTripRequest(requestId: $requestId, targetId: $targetId, tripId: $tripId)';
}


}

/// @nodoc
abstract mixin class $CreateTripRequestCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $CreateTripRequestCopyWith(CreateTripRequest value, $Res Function(CreateTripRequest) _then) = _$CreateTripRequestCopyWithImpl;
@useResult
$Res call({
 int requestId, int targetId, int tripId
});




}
/// @nodoc
class _$CreateTripRequestCopyWithImpl<$Res>
    implements $CreateTripRequestCopyWith<$Res> {
  _$CreateTripRequestCopyWithImpl(this._self, this._then);

  final CreateTripRequest _self;
  final $Res Function(CreateTripRequest) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? targetId = null,Object? tripId = null,}) {
  return _then(CreateTripRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AcceptTripRequest implements TripRequestEvent {
  const AcceptTripRequest({required this.requestId, required this.tripId, required this.myUserId});
  

 final  int requestId;
 final  int tripId;
 final  int myUserId;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptTripRequestCopyWith<AcceptTripRequest> get copyWith => _$AcceptTripRequestCopyWithImpl<AcceptTripRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptTripRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.myUserId, myUserId) || other.myUserId == myUserId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,tripId,myUserId);

@override
String toString() {
  return 'TripRequestEvent.acceptTripRequest(requestId: $requestId, tripId: $tripId, myUserId: $myUserId)';
}


}

/// @nodoc
abstract mixin class $AcceptTripRequestCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $AcceptTripRequestCopyWith(AcceptTripRequest value, $Res Function(AcceptTripRequest) _then) = _$AcceptTripRequestCopyWithImpl;
@useResult
$Res call({
 int requestId, int tripId, int myUserId
});




}
/// @nodoc
class _$AcceptTripRequestCopyWithImpl<$Res>
    implements $AcceptTripRequestCopyWith<$Res> {
  _$AcceptTripRequestCopyWithImpl(this._self, this._then);

  final AcceptTripRequest _self;
  final $Res Function(AcceptTripRequest) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? tripId = null,Object? myUserId = null,}) {
  return _then(AcceptTripRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,myUserId: null == myUserId ? _self.myUserId : myUserId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteTripRequest implements TripRequestEvent {
  const DeleteTripRequest({required this.id});
  

 final  int id;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTripRequestCopyWith<DeleteTripRequest> get copyWith => _$DeleteTripRequestCopyWithImpl<DeleteTripRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTripRequest&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TripRequestEvent.deleteTripRequest(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTripRequestCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $DeleteTripRequestCopyWith(DeleteTripRequest value, $Res Function(DeleteTripRequest) _then) = _$DeleteTripRequestCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteTripRequestCopyWithImpl<$Res>
    implements $DeleteTripRequestCopyWith<$Res> {
  _$DeleteTripRequestCopyWithImpl(this._self, this._then);

  final DeleteTripRequest _self;
  final $Res Function(DeleteTripRequest) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTripRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetTripRequest implements TripRequestEvent {
  const GetTripRequest({required this.myId});
  

 final  dynamic myId;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTripRequestCopyWith<GetTripRequest> get copyWith => _$GetTripRequestCopyWithImpl<GetTripRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTripRequest&&const DeepCollectionEquality().equals(other.myId, myId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(myId));

@override
String toString() {
  return 'TripRequestEvent.getTripRequest(myId: $myId)';
}


}

/// @nodoc
abstract mixin class $GetTripRequestCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $GetTripRequestCopyWith(GetTripRequest value, $Res Function(GetTripRequest) _then) = _$GetTripRequestCopyWithImpl;
@useResult
$Res call({
 dynamic myId
});




}
/// @nodoc
class _$GetTripRequestCopyWithImpl<$Res>
    implements $GetTripRequestCopyWith<$Res> {
  _$GetTripRequestCopyWithImpl(this._self, this._then);

  final GetTripRequest _self;
  final $Res Function(GetTripRequest) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myId = freezed,}) {
  return _then(GetTripRequest(
myId: freezed == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class AddTrip implements TripRequestEvent {
  const AddTrip({required this.myId, required this.tripId});
  

 final  int myId;
 final  int tripId;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTripCopyWith<AddTrip> get copyWith => _$AddTripCopyWithImpl<AddTrip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTrip&&(identical(other.myId, myId) || other.myId == myId)&&(identical(other.tripId, tripId) || other.tripId == tripId));
}


@override
int get hashCode => Object.hash(runtimeType,myId,tripId);

@override
String toString() {
  return 'TripRequestEvent.addTrip(myId: $myId, tripId: $tripId)';
}


}

/// @nodoc
abstract mixin class $AddTripCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $AddTripCopyWith(AddTrip value, $Res Function(AddTrip) _then) = _$AddTripCopyWithImpl;
@useResult
$Res call({
 int myId, int tripId
});




}
/// @nodoc
class _$AddTripCopyWithImpl<$Res>
    implements $AddTripCopyWith<$Res> {
  _$AddTripCopyWithImpl(this._self, this._then);

  final AddTrip _self;
  final $Res Function(AddTrip) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myId = null,Object? tripId = null,}) {
  return _then(AddTrip(
myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetTripsByIds implements TripRequestEvent {
  const GetTripsByIds({required final  List<int> tripIds}): _tripIds = tripIds;
  

 final  List<int> _tripIds;
 List<int> get tripIds {
  if (_tripIds is EqualUnmodifiableListView) return _tripIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tripIds);
}


/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTripsByIdsCopyWith<GetTripsByIds> get copyWith => _$GetTripsByIdsCopyWithImpl<GetTripsByIds>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTripsByIds&&const DeepCollectionEquality().equals(other._tripIds, _tripIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tripIds));

@override
String toString() {
  return 'TripRequestEvent.getTripsByIds(tripIds: $tripIds)';
}


}

/// @nodoc
abstract mixin class $GetTripsByIdsCopyWith<$Res> implements $TripRequestEventCopyWith<$Res> {
  factory $GetTripsByIdsCopyWith(GetTripsByIds value, $Res Function(GetTripsByIds) _then) = _$GetTripsByIdsCopyWithImpl;
@useResult
$Res call({
 List<int> tripIds
});




}
/// @nodoc
class _$GetTripsByIdsCopyWithImpl<$Res>
    implements $GetTripsByIdsCopyWith<$Res> {
  _$GetTripsByIdsCopyWithImpl(this._self, this._then);

  final GetTripsByIds _self;
  final $Res Function(GetTripsByIds) _then;

/// Create a copy of TripRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripIds = null,}) {
  return _then(GetTripsByIds(
tripIds: null == tripIds ? _self._tripIds : tripIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
