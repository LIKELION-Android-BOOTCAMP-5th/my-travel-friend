// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTripState {

 int get userId; String get title; String get place; String get startAt; String get endAt; String get coverType; String get country; String get coverStyle; String? get coverImg; File? get localImgFile; TripEntity? get createTrip; int? get friendId; UserEntity? get friendUser;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType; bool get isSameDay; bool get showSameDayDialog;// 이미지 업로드 상태 (추가)
 bool get isUploading;// 페이지 상태
 CreateTripPageState get pageState;
/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTripStateCopyWith<CreateTripState> get copyWith => _$CreateTripStateCopyWithImpl<CreateTripState>(this as CreateTripState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTripState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.country, country) || other.country == country)&&(identical(other.coverStyle, coverStyle) || other.coverStyle == coverStyle)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.createTrip, createTrip) || other.createTrip == createTrip)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.friendUser, friendUser) || other.friendUser == friendUser)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isSameDay, isSameDay) || other.isSameDay == isSameDay)&&(identical(other.showSameDayDialog, showSameDayDialog) || other.showSameDayDialog == showSameDayDialog)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,userId,title,place,startAt,endAt,coverType,country,coverStyle,coverImg,localImgFile,createTrip,friendId,friendUser,message,errorType,actionType,isSameDay,showSameDayDialog,isUploading,pageState]);

@override
String toString() {
  return 'CreateTripState(userId: $userId, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, country: $country, coverStyle: $coverStyle, coverImg: $coverImg, localImgFile: $localImgFile, createTrip: $createTrip, friendId: $friendId, friendUser: $friendUser, message: $message, errorType: $errorType, actionType: $actionType, isSameDay: $isSameDay, showSameDayDialog: $showSameDayDialog, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $CreateTripStateCopyWith<$Res>  {
  factory $CreateTripStateCopyWith(CreateTripState value, $Res Function(CreateTripState) _then) = _$CreateTripStateCopyWithImpl;
@useResult
$Res call({
 int userId, String title, String place, String startAt, String endAt, String coverType, String country, String coverStyle, String? coverImg, File? localImgFile, TripEntity? createTrip, int? friendId, UserEntity? friendUser, String? message, String? errorType, String? actionType, bool isSameDay, bool showSameDayDialog, bool isUploading, CreateTripPageState pageState
});


$TripEntityCopyWith<$Res>? get createTrip;$UserEntityCopyWith<$Res>? get friendUser;

}
/// @nodoc
class _$CreateTripStateCopyWithImpl<$Res>
    implements $CreateTripStateCopyWith<$Res> {
  _$CreateTripStateCopyWithImpl(this._self, this._then);

  final CreateTripState _self;
  final $Res Function(CreateTripState) _then;

/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? country = null,Object? coverStyle = null,Object? coverImg = freezed,Object? localImgFile = freezed,Object? createTrip = freezed,Object? friendId = freezed,Object? friendUser = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isSameDay = null,Object? showSameDayDialog = null,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,coverStyle: null == coverStyle ? _self.coverStyle : coverStyle // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,createTrip: freezed == createTrip ? _self.createTrip : createTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,friendUser: freezed == friendUser ? _self.friendUser : friendUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isSameDay: null == isSameDay ? _self.isSameDay : isSameDay // ignore: cast_nullable_to_non_nullable
as bool,showSameDayDialog: null == showSameDayDialog ? _self.showSameDayDialog : showSameDayDialog // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as CreateTripPageState,
  ));
}
/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get createTrip {
    if (_self.createTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.createTrip!, (value) {
    return _then(_self.copyWith(createTrip: value));
  });
}/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get friendUser {
    if (_self.friendUser == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.friendUser!, (value) {
    return _then(_self.copyWith(friendUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateTripState].
extension CreateTripStatePatterns on CreateTripState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTripState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTripState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTripState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTripState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTripState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTripState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  TripEntity? createTrip,  int? friendId,  UserEntity? friendUser,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  CreateTripPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTripState() when $default != null:
return $default(_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.createTrip,_that.friendId,_that.friendUser,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  TripEntity? createTrip,  int? friendId,  UserEntity? friendUser,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  CreateTripPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _CreateTripState():
return $default(_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.createTrip,_that.friendId,_that.friendUser,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  TripEntity? createTrip,  int? friendId,  UserEntity? friendUser,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  CreateTripPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _CreateTripState() when $default != null:
return $default(_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.createTrip,_that.friendId,_that.friendUser,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTripState extends CreateTripState {
  const _CreateTripState({this.userId = 0, this.title = '', this.place = '', this.startAt = '', this.endAt = '', this.coverType = 'BLUE', this.country = '', this.coverStyle = 'COLOR', this.coverImg, this.localImgFile, this.createTrip, this.friendId, this.friendUser, this.message, this.errorType, this.actionType, this.isSameDay = false, this.showSameDayDialog = false, this.isUploading = false, this.pageState = CreateTripPageState.init}): super._();
  

@override@JsonKey() final  int userId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String place;
@override@JsonKey() final  String startAt;
@override@JsonKey() final  String endAt;
@override@JsonKey() final  String coverType;
@override@JsonKey() final  String country;
@override@JsonKey() final  String coverStyle;
@override final  String? coverImg;
@override final  File? localImgFile;
@override final  TripEntity? createTrip;
@override final  int? friendId;
@override final  UserEntity? friendUser;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
@override@JsonKey() final  bool isSameDay;
@override@JsonKey() final  bool showSameDayDialog;
// 이미지 업로드 상태 (추가)
@override@JsonKey() final  bool isUploading;
// 페이지 상태
@override@JsonKey() final  CreateTripPageState pageState;

/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTripStateCopyWith<_CreateTripState> get copyWith => __$CreateTripStateCopyWithImpl<_CreateTripState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTripState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.country, country) || other.country == country)&&(identical(other.coverStyle, coverStyle) || other.coverStyle == coverStyle)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.createTrip, createTrip) || other.createTrip == createTrip)&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.friendUser, friendUser) || other.friendUser == friendUser)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isSameDay, isSameDay) || other.isSameDay == isSameDay)&&(identical(other.showSameDayDialog, showSameDayDialog) || other.showSameDayDialog == showSameDayDialog)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,userId,title,place,startAt,endAt,coverType,country,coverStyle,coverImg,localImgFile,createTrip,friendId,friendUser,message,errorType,actionType,isSameDay,showSameDayDialog,isUploading,pageState]);

@override
String toString() {
  return 'CreateTripState(userId: $userId, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, country: $country, coverStyle: $coverStyle, coverImg: $coverImg, localImgFile: $localImgFile, createTrip: $createTrip, friendId: $friendId, friendUser: $friendUser, message: $message, errorType: $errorType, actionType: $actionType, isSameDay: $isSameDay, showSameDayDialog: $showSameDayDialog, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$CreateTripStateCopyWith<$Res> implements $CreateTripStateCopyWith<$Res> {
  factory _$CreateTripStateCopyWith(_CreateTripState value, $Res Function(_CreateTripState) _then) = __$CreateTripStateCopyWithImpl;
@override @useResult
$Res call({
 int userId, String title, String place, String startAt, String endAt, String coverType, String country, String coverStyle, String? coverImg, File? localImgFile, TripEntity? createTrip, int? friendId, UserEntity? friendUser, String? message, String? errorType, String? actionType, bool isSameDay, bool showSameDayDialog, bool isUploading, CreateTripPageState pageState
});


@override $TripEntityCopyWith<$Res>? get createTrip;@override $UserEntityCopyWith<$Res>? get friendUser;

}
/// @nodoc
class __$CreateTripStateCopyWithImpl<$Res>
    implements _$CreateTripStateCopyWith<$Res> {
  __$CreateTripStateCopyWithImpl(this._self, this._then);

  final _CreateTripState _self;
  final $Res Function(_CreateTripState) _then;

/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? country = null,Object? coverStyle = null,Object? coverImg = freezed,Object? localImgFile = freezed,Object? createTrip = freezed,Object? friendId = freezed,Object? friendUser = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isSameDay = null,Object? showSameDayDialog = null,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_CreateTripState(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,coverStyle: null == coverStyle ? _self.coverStyle : coverStyle // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,createTrip: freezed == createTrip ? _self.createTrip : createTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as int?,friendUser: freezed == friendUser ? _self.friendUser : friendUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isSameDay: null == isSameDay ? _self.isSameDay : isSameDay // ignore: cast_nullable_to_non_nullable
as bool,showSameDayDialog: null == showSameDayDialog ? _self.showSameDayDialog : showSameDayDialog // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as CreateTripPageState,
  ));
}

/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get createTrip {
    if (_self.createTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.createTrip!, (value) {
    return _then(_self.copyWith(createTrip: value));
  });
}/// Create a copy of CreateTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get friendUser {
    if (_self.friendUser == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.friendUser!, (value) {
    return _then(_self.copyWith(friendUser: value));
  });
}
}

// dart format on
