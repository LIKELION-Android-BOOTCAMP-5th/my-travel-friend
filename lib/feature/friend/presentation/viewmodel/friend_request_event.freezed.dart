// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendRequestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendRequestEvent()';
}


}

/// @nodoc
class $FriendRequestEventCopyWith<$Res>  {
$FriendRequestEventCopyWith(FriendRequestEvent _, $Res Function(FriendRequestEvent) __);
}


/// Adds pattern-matching-related methods to [FriendRequestEvent].
extension FriendRequestEventPatterns on FriendRequestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateFriendRequest value)?  createFriendRequest,TResult Function( GetFriendRequest value)?  getFriendRequest,TResult Function( DeleteRequest value)?  deleteRequest,TResult Function( AcceptRequest value)?  acceptRequest,TResult Function( SearchRequestName value)?  searchRequestName,TResult Function( GetRequestProfile value)?  getRequestProfile,TResult Function( IsRequest value)?  isRequest,TResult Function( RequestCreate value)?  requestCreate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case SearchRequestName() when searchRequestName != null:
return searchRequestName(_that);case GetRequestProfile() when getRequestProfile != null:
return getRequestProfile(_that);case IsRequest() when isRequest != null:
return isRequest(_that);case RequestCreate() when requestCreate != null:
return requestCreate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateFriendRequest value)  createFriendRequest,required TResult Function( GetFriendRequest value)  getFriendRequest,required TResult Function( DeleteRequest value)  deleteRequest,required TResult Function( AcceptRequest value)  acceptRequest,required TResult Function( SearchRequestName value)  searchRequestName,required TResult Function( GetRequestProfile value)  getRequestProfile,required TResult Function( IsRequest value)  isRequest,required TResult Function( RequestCreate value)  requestCreate,}){
final _that = this;
switch (_that) {
case CreateFriendRequest():
return createFriendRequest(_that);case GetFriendRequest():
return getFriendRequest(_that);case DeleteRequest():
return deleteRequest(_that);case AcceptRequest():
return acceptRequest(_that);case SearchRequestName():
return searchRequestName(_that);case GetRequestProfile():
return getRequestProfile(_that);case IsRequest():
return isRequest(_that);case RequestCreate():
return requestCreate(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateFriendRequest value)?  createFriendRequest,TResult? Function( GetFriendRequest value)?  getFriendRequest,TResult? Function( DeleteRequest value)?  deleteRequest,TResult? Function( AcceptRequest value)?  acceptRequest,TResult? Function( SearchRequestName value)?  searchRequestName,TResult? Function( GetRequestProfile value)?  getRequestProfile,TResult? Function( IsRequest value)?  isRequest,TResult? Function( RequestCreate value)?  requestCreate,}){
final _that = this;
switch (_that) {
case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case SearchRequestName() when searchRequestName != null:
return searchRequestName(_that);case GetRequestProfile() when getRequestProfile != null:
return getRequestProfile(_that);case IsRequest() when isRequest != null:
return isRequest(_that);case RequestCreate() when requestCreate != null:
return requestCreate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int requestId,  int targetId)?  createFriendRequest,TResult Function( int userId)?  getFriendRequest,TResult Function( int id)?  deleteRequest,TResult Function( int id)?  acceptRequest,TResult Function( int myId,  dynamic keyword)?  searchRequestName,TResult Function( int myId)?  getRequestProfile,TResult Function()?  isRequest,TResult Function( int requestId,  int targetId)?  requestCreate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that.userId);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that.id);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.id);case SearchRequestName() when searchRequestName != null:
return searchRequestName(_that.myId,_that.keyword);case GetRequestProfile() when getRequestProfile != null:
return getRequestProfile(_that.myId);case IsRequest() when isRequest != null:
return isRequest();case RequestCreate() when requestCreate != null:
return requestCreate(_that.requestId,_that.targetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int requestId,  int targetId)  createFriendRequest,required TResult Function( int userId)  getFriendRequest,required TResult Function( int id)  deleteRequest,required TResult Function( int id)  acceptRequest,required TResult Function( int myId,  dynamic keyword)  searchRequestName,required TResult Function( int myId)  getRequestProfile,required TResult Function()  isRequest,required TResult Function( int requestId,  int targetId)  requestCreate,}) {final _that = this;
switch (_that) {
case CreateFriendRequest():
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest():
return getFriendRequest(_that.userId);case DeleteRequest():
return deleteRequest(_that.id);case AcceptRequest():
return acceptRequest(_that.id);case SearchRequestName():
return searchRequestName(_that.myId,_that.keyword);case GetRequestProfile():
return getRequestProfile(_that.myId);case IsRequest():
return isRequest();case RequestCreate():
return requestCreate(_that.requestId,_that.targetId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int requestId,  int targetId)?  createFriendRequest,TResult? Function( int userId)?  getFriendRequest,TResult? Function( int id)?  deleteRequest,TResult? Function( int id)?  acceptRequest,TResult? Function( int myId,  dynamic keyword)?  searchRequestName,TResult? Function( int myId)?  getRequestProfile,TResult? Function()?  isRequest,TResult? Function( int requestId,  int targetId)?  requestCreate,}) {final _that = this;
switch (_that) {
case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that.userId);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that.id);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.id);case SearchRequestName() when searchRequestName != null:
return searchRequestName(_that.myId,_that.keyword);case GetRequestProfile() when getRequestProfile != null:
return getRequestProfile(_that.myId);case IsRequest() when isRequest != null:
return isRequest();case RequestCreate() when requestCreate != null:
return requestCreate(_that.requestId,_that.targetId);case _:
  return null;

}
}

}

/// @nodoc


class CreateFriendRequest implements FriendRequestEvent {
  const CreateFriendRequest({required this.requestId, required this.targetId});
  

 final  int requestId;
 final  int targetId;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateFriendRequestCopyWith<CreateFriendRequest> get copyWith => _$CreateFriendRequestCopyWithImpl<CreateFriendRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateFriendRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,targetId);

@override
String toString() {
  return 'FriendRequestEvent.createFriendRequest(requestId: $requestId, targetId: $targetId)';
}


}

/// @nodoc
abstract mixin class $CreateFriendRequestCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $CreateFriendRequestCopyWith(CreateFriendRequest value, $Res Function(CreateFriendRequest) _then) = _$CreateFriendRequestCopyWithImpl;
@useResult
$Res call({
 int requestId, int targetId
});




}
/// @nodoc
class _$CreateFriendRequestCopyWithImpl<$Res>
    implements $CreateFriendRequestCopyWith<$Res> {
  _$CreateFriendRequestCopyWithImpl(this._self, this._then);

  final CreateFriendRequest _self;
  final $Res Function(CreateFriendRequest) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? targetId = null,}) {
  return _then(CreateFriendRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetFriendRequest implements FriendRequestEvent {
  const GetFriendRequest({required this.userId});
  

 final  int userId;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFriendRequestCopyWith<GetFriendRequest> get copyWith => _$GetFriendRequestCopyWithImpl<GetFriendRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFriendRequest&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'FriendRequestEvent.getFriendRequest(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetFriendRequestCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $GetFriendRequestCopyWith(GetFriendRequest value, $Res Function(GetFriendRequest) _then) = _$GetFriendRequestCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$GetFriendRequestCopyWithImpl<$Res>
    implements $GetFriendRequestCopyWith<$Res> {
  _$GetFriendRequestCopyWithImpl(this._self, this._then);

  final GetFriendRequest _self;
  final $Res Function(GetFriendRequest) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(GetFriendRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteRequest implements FriendRequestEvent {
  const DeleteRequest({required this.id});
  

 final  int id;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteRequestCopyWith<DeleteRequest> get copyWith => _$DeleteRequestCopyWithImpl<DeleteRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteRequest&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FriendRequestEvent.deleteRequest(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteRequestCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $DeleteRequestCopyWith(DeleteRequest value, $Res Function(DeleteRequest) _then) = _$DeleteRequestCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteRequestCopyWithImpl<$Res>
    implements $DeleteRequestCopyWith<$Res> {
  _$DeleteRequestCopyWithImpl(this._self, this._then);

  final DeleteRequest _self;
  final $Res Function(DeleteRequest) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AcceptRequest implements FriendRequestEvent {
  const AcceptRequest({required this.id});
  

 final  int id;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptRequestCopyWith<AcceptRequest> get copyWith => _$AcceptRequestCopyWithImpl<AcceptRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptRequest&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FriendRequestEvent.acceptRequest(id: $id)';
}


}

/// @nodoc
abstract mixin class $AcceptRequestCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $AcceptRequestCopyWith(AcceptRequest value, $Res Function(AcceptRequest) _then) = _$AcceptRequestCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$AcceptRequestCopyWithImpl<$Res>
    implements $AcceptRequestCopyWith<$Res> {
  _$AcceptRequestCopyWithImpl(this._self, this._then);

  final AcceptRequest _self;
  final $Res Function(AcceptRequest) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AcceptRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SearchRequestName implements FriendRequestEvent {
  const SearchRequestName({required this.myId, required this.keyword});
  

 final  int myId;
 final  dynamic keyword;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRequestNameCopyWith<SearchRequestName> get copyWith => _$SearchRequestNameCopyWithImpl<SearchRequestName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRequestName&&(identical(other.myId, myId) || other.myId == myId)&&const DeepCollectionEquality().equals(other.keyword, keyword));
}


@override
int get hashCode => Object.hash(runtimeType,myId,const DeepCollectionEquality().hash(keyword));

@override
String toString() {
  return 'FriendRequestEvent.searchRequestName(myId: $myId, keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class $SearchRequestNameCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $SearchRequestNameCopyWith(SearchRequestName value, $Res Function(SearchRequestName) _then) = _$SearchRequestNameCopyWithImpl;
@useResult
$Res call({
 int myId, dynamic keyword
});




}
/// @nodoc
class _$SearchRequestNameCopyWithImpl<$Res>
    implements $SearchRequestNameCopyWith<$Res> {
  _$SearchRequestNameCopyWithImpl(this._self, this._then);

  final SearchRequestName _self;
  final $Res Function(SearchRequestName) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myId = null,Object? keyword = freezed,}) {
  return _then(SearchRequestName(
myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int,keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class GetRequestProfile implements FriendRequestEvent {
  const GetRequestProfile({required this.myId});
  

 final  int myId;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRequestProfileCopyWith<GetRequestProfile> get copyWith => _$GetRequestProfileCopyWithImpl<GetRequestProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRequestProfile&&(identical(other.myId, myId) || other.myId == myId));
}


@override
int get hashCode => Object.hash(runtimeType,myId);

@override
String toString() {
  return 'FriendRequestEvent.getRequestProfile(myId: $myId)';
}


}

/// @nodoc
abstract mixin class $GetRequestProfileCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $GetRequestProfileCopyWith(GetRequestProfile value, $Res Function(GetRequestProfile) _then) = _$GetRequestProfileCopyWithImpl;
@useResult
$Res call({
 int myId
});




}
/// @nodoc
class _$GetRequestProfileCopyWithImpl<$Res>
    implements $GetRequestProfileCopyWith<$Res> {
  _$GetRequestProfileCopyWithImpl(this._self, this._then);

  final GetRequestProfile _self;
  final $Res Function(GetRequestProfile) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myId = null,}) {
  return _then(GetRequestProfile(
myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class IsRequest implements FriendRequestEvent {
  const IsRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendRequestEvent.isRequest()';
}


}




/// @nodoc


class RequestCreate implements FriendRequestEvent {
  const RequestCreate({required this.requestId, required this.targetId});
  

 final  int requestId;
 final  int targetId;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCreateCopyWith<RequestCreate> get copyWith => _$RequestCreateCopyWithImpl<RequestCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCreate&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.targetId, targetId) || other.targetId == targetId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,targetId);

@override
String toString() {
  return 'FriendRequestEvent.requestCreate(requestId: $requestId, targetId: $targetId)';
}


}

/// @nodoc
abstract mixin class $RequestCreateCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $RequestCreateCopyWith(RequestCreate value, $Res Function(RequestCreate) _then) = _$RequestCreateCopyWithImpl;
@useResult
$Res call({
 int requestId, int targetId
});




}
/// @nodoc
class _$RequestCreateCopyWithImpl<$Res>
    implements $RequestCreateCopyWith<$Res> {
  _$RequestCreateCopyWithImpl(this._self, this._then);

  final RequestCreate _self;
  final $Res Function(RequestCreate) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? targetId = null,}) {
  return _then(RequestCreate(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
