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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchByNickname value)?  searchByNickname,TResult Function( ClearSearch value)?  clearSearch,TResult Function( CreateFriendRequest value)?  createFriendRequest,TResult Function( GetFriendRequest value)?  getFriendRequest,TResult Function( DeleteRequest value)?  deleteRequest,TResult Function( AcceptRequest value)?  acceptRequest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchByNickname() when searchByNickname != null:
return searchByNickname(_that);case ClearSearch() when clearSearch != null:
return clearSearch(_that);case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchByNickname value)  searchByNickname,required TResult Function( ClearSearch value)  clearSearch,required TResult Function( CreateFriendRequest value)  createFriendRequest,required TResult Function( GetFriendRequest value)  getFriendRequest,required TResult Function( DeleteRequest value)  deleteRequest,required TResult Function( AcceptRequest value)  acceptRequest,}){
final _that = this;
switch (_that) {
case SearchByNickname():
return searchByNickname(_that);case ClearSearch():
return clearSearch(_that);case CreateFriendRequest():
return createFriendRequest(_that);case GetFriendRequest():
return getFriendRequest(_that);case DeleteRequest():
return deleteRequest(_that);case AcceptRequest():
return acceptRequest(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchByNickname value)?  searchByNickname,TResult? Function( ClearSearch value)?  clearSearch,TResult? Function( CreateFriendRequest value)?  createFriendRequest,TResult? Function( GetFriendRequest value)?  getFriendRequest,TResult? Function( DeleteRequest value)?  deleteRequest,TResult? Function( AcceptRequest value)?  acceptRequest,}){
final _that = this;
switch (_that) {
case SearchByNickname() when searchByNickname != null:
return searchByNickname(_that);case ClearSearch() when clearSearch != null:
return clearSearch(_that);case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String nickname,  int requestId)?  searchByNickname,TResult Function()?  clearSearch,TResult Function( int requestId,  int targetId)?  createFriendRequest,TResult Function( int userId)?  getFriendRequest,TResult Function( int id)?  deleteRequest,TResult Function( int id)?  acceptRequest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchByNickname() when searchByNickname != null:
return searchByNickname(_that.nickname,_that.requestId);case ClearSearch() when clearSearch != null:
return clearSearch();case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that.userId);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that.id);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String nickname,  int requestId)  searchByNickname,required TResult Function()  clearSearch,required TResult Function( int requestId,  int targetId)  createFriendRequest,required TResult Function( int userId)  getFriendRequest,required TResult Function( int id)  deleteRequest,required TResult Function( int id)  acceptRequest,}) {final _that = this;
switch (_that) {
case SearchByNickname():
return searchByNickname(_that.nickname,_that.requestId);case ClearSearch():
return clearSearch();case CreateFriendRequest():
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest():
return getFriendRequest(_that.userId);case DeleteRequest():
return deleteRequest(_that.id);case AcceptRequest():
return acceptRequest(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String nickname,  int requestId)?  searchByNickname,TResult? Function()?  clearSearch,TResult? Function( int requestId,  int targetId)?  createFriendRequest,TResult? Function( int userId)?  getFriendRequest,TResult? Function( int id)?  deleteRequest,TResult? Function( int id)?  acceptRequest,}) {final _that = this;
switch (_that) {
case SearchByNickname() when searchByNickname != null:
return searchByNickname(_that.nickname,_that.requestId);case ClearSearch() when clearSearch != null:
return clearSearch();case CreateFriendRequest() when createFriendRequest != null:
return createFriendRequest(_that.requestId,_that.targetId);case GetFriendRequest() when getFriendRequest != null:
return getFriendRequest(_that.userId);case DeleteRequest() when deleteRequest != null:
return deleteRequest(_that.id);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class SearchByNickname implements FriendRequestEvent {
  const SearchByNickname({required this.nickname, required this.requestId});
  

 final  String nickname;
// 검색어
 final  int requestId;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchByNicknameCopyWith<SearchByNickname> get copyWith => _$SearchByNicknameCopyWithImpl<SearchByNickname>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchByNickname&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,requestId);

@override
String toString() {
  return 'FriendRequestEvent.searchByNickname(nickname: $nickname, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $SearchByNicknameCopyWith<$Res> implements $FriendRequestEventCopyWith<$Res> {
  factory $SearchByNicknameCopyWith(SearchByNickname value, $Res Function(SearchByNickname) _then) = _$SearchByNicknameCopyWithImpl;
@useResult
$Res call({
 String nickname, int requestId
});




}
/// @nodoc
class _$SearchByNicknameCopyWithImpl<$Res>
    implements $SearchByNicknameCopyWith<$Res> {
  _$SearchByNicknameCopyWithImpl(this._self, this._then);

  final SearchByNickname _self;
  final $Res Function(SearchByNickname) _then;

/// Create a copy of FriendRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? requestId = null,}) {
  return _then(SearchByNickname(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ClearSearch implements FriendRequestEvent {
  const ClearSearch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendRequestEvent.clearSearch()';
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

// dart format on
