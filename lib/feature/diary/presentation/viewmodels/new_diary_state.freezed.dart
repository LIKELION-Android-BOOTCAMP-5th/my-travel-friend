// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewDiaryState {

// 여행, 사용자 정보
 int get tripId; int get userId;// 폼 입력 값
 String get type; String get title; String get content; double get rating; String? get imgUrl; int? get cost; bool get isPublic; int? get scheduleId;// 생성된 다이어리
 DiaryEntity? get createdDiary;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;// 페이지 상태
 NewDiaryPageState get pageState;
/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewDiaryStateCopyWith<NewDiaryState> get copyWith => _$NewDiaryStateCopyWithImpl<NewDiaryState>(this as NewDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewDiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.createdDiary, createdDiary) || other.createdDiary == createdDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,type,title,content,rating,imgUrl,cost,isPublic,scheduleId,createdDiary,message,errorType,actionType,pageState);

@override
String toString() {
  return 'NewDiaryState(tripId: $tripId, userId: $userId, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, cost: $cost, isPublic: $isPublic, scheduleId: $scheduleId, createdDiary: $createdDiary, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $NewDiaryStateCopyWith<$Res>  {
  factory $NewDiaryStateCopyWith(NewDiaryState value, $Res Function(NewDiaryState) _then) = _$NewDiaryStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId, String type, String title, String content, double rating, String? imgUrl, int? cost, bool isPublic, int? scheduleId, DiaryEntity? createdDiary, String? message, String? errorType, String? actionType, NewDiaryPageState pageState
});


$DiaryEntityCopyWith<$Res>? get createdDiary;

}
/// @nodoc
class _$NewDiaryStateCopyWithImpl<$Res>
    implements $NewDiaryStateCopyWith<$Res> {
  _$NewDiaryStateCopyWithImpl(this._self, this._then);

  final NewDiaryState _self;
  final $Res Function(NewDiaryState) _then;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = null,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? cost = freezed,Object? isPublic = null,Object? scheduleId = freezed,Object? createdDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,createdDiary: freezed == createdDiary ? _self.createdDiary : createdDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as NewDiaryPageState,
  ));
}
/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get createdDiary {
    if (_self.createdDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.createdDiary!, (value) {
    return _then(_self.copyWith(createdDiary: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewDiaryState].
extension NewDiaryStatePatterns on NewDiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewDiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewDiaryState value)  $default,){
final _that = this;
switch (_that) {
case _NewDiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewDiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  int? cost,  bool isPublic,  int? scheduleId,  DiaryEntity? createdDiary,  String? message,  String? errorType,  String? actionType,  NewDiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.cost,_that.isPublic,_that.scheduleId,_that.createdDiary,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  int? cost,  bool isPublic,  int? scheduleId,  DiaryEntity? createdDiary,  String? message,  String? errorType,  String? actionType,  NewDiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _NewDiaryState():
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.cost,_that.isPublic,_that.scheduleId,_that.createdDiary,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  int? cost,  bool isPublic,  int? scheduleId,  DiaryEntity? createdDiary,  String? message,  String? errorType,  String? actionType,  NewDiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.cost,_that.isPublic,_that.scheduleId,_that.createdDiary,_that.message,_that.errorType,_that.actionType,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _NewDiaryState extends NewDiaryState {
  const _NewDiaryState({this.tripId = 0, this.userId = 0, this.type = 'MEMO', this.title = '', this.content = '', this.rating = 0.0, this.imgUrl, this.cost, this.isPublic = true, this.scheduleId, this.createdDiary, this.message, this.errorType, this.actionType, this.pageState = NewDiaryPageState.init}): super._();
  

// 여행, 사용자 정보
@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
// 폼 입력 값
@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  double rating;
@override final  String? imgUrl;
@override final  int? cost;
@override@JsonKey() final  bool isPublic;
@override final  int? scheduleId;
// 생성된 다이어리
@override final  DiaryEntity? createdDiary;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
// 페이지 상태
@override@JsonKey() final  NewDiaryPageState pageState;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewDiaryStateCopyWith<_NewDiaryState> get copyWith => __$NewDiaryStateCopyWithImpl<_NewDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewDiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.createdDiary, createdDiary) || other.createdDiary == createdDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,type,title,content,rating,imgUrl,cost,isPublic,scheduleId,createdDiary,message,errorType,actionType,pageState);

@override
String toString() {
  return 'NewDiaryState(tripId: $tripId, userId: $userId, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, cost: $cost, isPublic: $isPublic, scheduleId: $scheduleId, createdDiary: $createdDiary, message: $message, errorType: $errorType, actionType: $actionType, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$NewDiaryStateCopyWith<$Res> implements $NewDiaryStateCopyWith<$Res> {
  factory _$NewDiaryStateCopyWith(_NewDiaryState value, $Res Function(_NewDiaryState) _then) = __$NewDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int userId, String type, String title, String content, double rating, String? imgUrl, int? cost, bool isPublic, int? scheduleId, DiaryEntity? createdDiary, String? message, String? errorType, String? actionType, NewDiaryPageState pageState
});


@override $DiaryEntityCopyWith<$Res>? get createdDiary;

}
/// @nodoc
class __$NewDiaryStateCopyWithImpl<$Res>
    implements _$NewDiaryStateCopyWith<$Res> {
  __$NewDiaryStateCopyWithImpl(this._self, this._then);

  final _NewDiaryState _self;
  final $Res Function(_NewDiaryState) _then;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? cost = freezed,Object? isPublic = null,Object? scheduleId = freezed,Object? createdDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? pageState = null,}) {
  return _then(_NewDiaryState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,createdDiary: freezed == createdDiary ? _self.createdDiary : createdDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as NewDiaryPageState,
  ));
}

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get createdDiary {
    if (_self.createdDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.createdDiary!, (value) {
    return _then(_self.copyWith(createdDiary: value));
  });
}
}

// dart format on
