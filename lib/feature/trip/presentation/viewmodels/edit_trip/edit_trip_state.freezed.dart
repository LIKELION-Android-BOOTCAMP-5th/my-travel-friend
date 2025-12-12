// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditTripState {

// 기존 trip 로드된 값
 TripEntity? get originalTrip; int? get tripId;// 수정할 Trip 정보
 int get userId; String get title; String get place; String get startAt; String get endAt; String get coverType; String get country; String get coverStyle; String? get coverImg; File? get localImgFile;// 삭제 예정 이미지 url 목록
 List<String> get deletedImages;// 수정 완료된 Trip 반환
 TripEntity? get updatedTrip;// State Info
 String? get message; String? get errorType; String? get actionType; bool get isSameDay; bool get showSameDayDialog; bool get isUploading; EditTripPageState get pageState;
/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTripStateCopyWith<EditTripState> get copyWith => _$EditTripStateCopyWithImpl<EditTripState>(this as EditTripState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTripState&&(identical(other.originalTrip, originalTrip) || other.originalTrip == originalTrip)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.country, country) || other.country == country)&&(identical(other.coverStyle, coverStyle) || other.coverStyle == coverStyle)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&const DeepCollectionEquality().equals(other.deletedImages, deletedImages)&&(identical(other.updatedTrip, updatedTrip) || other.updatedTrip == updatedTrip)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isSameDay, isSameDay) || other.isSameDay == isSameDay)&&(identical(other.showSameDayDialog, showSameDayDialog) || other.showSameDayDialog == showSameDayDialog)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,originalTrip,tripId,userId,title,place,startAt,endAt,coverType,country,coverStyle,coverImg,localImgFile,const DeepCollectionEquality().hash(deletedImages),updatedTrip,message,errorType,actionType,isSameDay,showSameDayDialog,isUploading,pageState]);

@override
String toString() {
  return 'EditTripState(originalTrip: $originalTrip, tripId: $tripId, userId: $userId, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, country: $country, coverStyle: $coverStyle, coverImg: $coverImg, localImgFile: $localImgFile, deletedImages: $deletedImages, updatedTrip: $updatedTrip, message: $message, errorType: $errorType, actionType: $actionType, isSameDay: $isSameDay, showSameDayDialog: $showSameDayDialog, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $EditTripStateCopyWith<$Res>  {
  factory $EditTripStateCopyWith(EditTripState value, $Res Function(EditTripState) _then) = _$EditTripStateCopyWithImpl;
@useResult
$Res call({
 TripEntity? originalTrip, int? tripId, int userId, String title, String place, String startAt, String endAt, String coverType, String country, String coverStyle, String? coverImg, File? localImgFile, List<String> deletedImages, TripEntity? updatedTrip, String? message, String? errorType, String? actionType, bool isSameDay, bool showSameDayDialog, bool isUploading, EditTripPageState pageState
});


$TripEntityCopyWith<$Res>? get originalTrip;$TripEntityCopyWith<$Res>? get updatedTrip;

}
/// @nodoc
class _$EditTripStateCopyWithImpl<$Res>
    implements $EditTripStateCopyWith<$Res> {
  _$EditTripStateCopyWithImpl(this._self, this._then);

  final EditTripState _self;
  final $Res Function(EditTripState) _then;

/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalTrip = freezed,Object? tripId = freezed,Object? userId = null,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? country = null,Object? coverStyle = null,Object? coverImg = freezed,Object? localImgFile = freezed,Object? deletedImages = null,Object? updatedTrip = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isSameDay = null,Object? showSameDayDialog = null,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
originalTrip: freezed == originalTrip ? _self.originalTrip : originalTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,coverStyle: null == coverStyle ? _self.coverStyle : coverStyle // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,deletedImages: null == deletedImages ? _self.deletedImages : deletedImages // ignore: cast_nullable_to_non_nullable
as List<String>,updatedTrip: freezed == updatedTrip ? _self.updatedTrip : updatedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isSameDay: null == isSameDay ? _self.isSameDay : isSameDay // ignore: cast_nullable_to_non_nullable
as bool,showSameDayDialog: null == showSameDayDialog ? _self.showSameDayDialog : showSameDayDialog // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditTripPageState,
  ));
}
/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get originalTrip {
    if (_self.originalTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.originalTrip!, (value) {
    return _then(_self.copyWith(originalTrip: value));
  });
}/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get updatedTrip {
    if (_self.updatedTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.updatedTrip!, (value) {
    return _then(_self.copyWith(updatedTrip: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditTripState].
extension EditTripStatePatterns on EditTripState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditTripState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditTripState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditTripState value)  $default,){
final _that = this;
switch (_that) {
case _EditTripState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditTripState value)?  $default,){
final _that = this;
switch (_that) {
case _EditTripState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripEntity? originalTrip,  int? tripId,  int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  List<String> deletedImages,  TripEntity? updatedTrip,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  EditTripPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditTripState() when $default != null:
return $default(_that.originalTrip,_that.tripId,_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.deletedImages,_that.updatedTrip,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripEntity? originalTrip,  int? tripId,  int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  List<String> deletedImages,  TripEntity? updatedTrip,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  EditTripPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _EditTripState():
return $default(_that.originalTrip,_that.tripId,_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.deletedImages,_that.updatedTrip,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripEntity? originalTrip,  int? tripId,  int userId,  String title,  String place,  String startAt,  String endAt,  String coverType,  String country,  String coverStyle,  String? coverImg,  File? localImgFile,  List<String> deletedImages,  TripEntity? updatedTrip,  String? message,  String? errorType,  String? actionType,  bool isSameDay,  bool showSameDayDialog,  bool isUploading,  EditTripPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _EditTripState() when $default != null:
return $default(_that.originalTrip,_that.tripId,_that.userId,_that.title,_that.place,_that.startAt,_that.endAt,_that.coverType,_that.country,_that.coverStyle,_that.coverImg,_that.localImgFile,_that.deletedImages,_that.updatedTrip,_that.message,_that.errorType,_that.actionType,_that.isSameDay,_that.showSameDayDialog,_that.isUploading,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _EditTripState extends EditTripState {
  const _EditTripState({this.originalTrip, this.tripId, this.userId = 0, this.title = '', this.place = '', this.startAt = '', this.endAt = '', this.coverType = 'BLUE', this.country = '', this.coverStyle = 'COLOR', this.coverImg, this.localImgFile, final  List<String> deletedImages = const [], this.updatedTrip, this.message, this.errorType, this.actionType, this.isSameDay = false, this.showSameDayDialog = false, this.isUploading = false, this.pageState = EditTripPageState.init}): _deletedImages = deletedImages,super._();
  

// 기존 trip 로드된 값
@override final  TripEntity? originalTrip;
@override final  int? tripId;
// 수정할 Trip 정보
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
// 삭제 예정 이미지 url 목록
 final  List<String> _deletedImages;
// 삭제 예정 이미지 url 목록
@override@JsonKey() List<String> get deletedImages {
  if (_deletedImages is EqualUnmodifiableListView) return _deletedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletedImages);
}

// 수정 완료된 Trip 반환
@override final  TripEntity? updatedTrip;
// State Info
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
@override@JsonKey() final  bool isSameDay;
@override@JsonKey() final  bool showSameDayDialog;
@override@JsonKey() final  bool isUploading;
@override@JsonKey() final  EditTripPageState pageState;

/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditTripStateCopyWith<_EditTripState> get copyWith => __$EditTripStateCopyWithImpl<_EditTripState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditTripState&&(identical(other.originalTrip, originalTrip) || other.originalTrip == originalTrip)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.place, place) || other.place == place)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.coverType, coverType) || other.coverType == coverType)&&(identical(other.country, country) || other.country == country)&&(identical(other.coverStyle, coverStyle) || other.coverStyle == coverStyle)&&(identical(other.coverImg, coverImg) || other.coverImg == coverImg)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&const DeepCollectionEquality().equals(other._deletedImages, _deletedImages)&&(identical(other.updatedTrip, updatedTrip) || other.updatedTrip == updatedTrip)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isSameDay, isSameDay) || other.isSameDay == isSameDay)&&(identical(other.showSameDayDialog, showSameDayDialog) || other.showSameDayDialog == showSameDayDialog)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,originalTrip,tripId,userId,title,place,startAt,endAt,coverType,country,coverStyle,coverImg,localImgFile,const DeepCollectionEquality().hash(_deletedImages),updatedTrip,message,errorType,actionType,isSameDay,showSameDayDialog,isUploading,pageState]);

@override
String toString() {
  return 'EditTripState(originalTrip: $originalTrip, tripId: $tripId, userId: $userId, title: $title, place: $place, startAt: $startAt, endAt: $endAt, coverType: $coverType, country: $country, coverStyle: $coverStyle, coverImg: $coverImg, localImgFile: $localImgFile, deletedImages: $deletedImages, updatedTrip: $updatedTrip, message: $message, errorType: $errorType, actionType: $actionType, isSameDay: $isSameDay, showSameDayDialog: $showSameDayDialog, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$EditTripStateCopyWith<$Res> implements $EditTripStateCopyWith<$Res> {
  factory _$EditTripStateCopyWith(_EditTripState value, $Res Function(_EditTripState) _then) = __$EditTripStateCopyWithImpl;
@override @useResult
$Res call({
 TripEntity? originalTrip, int? tripId, int userId, String title, String place, String startAt, String endAt, String coverType, String country, String coverStyle, String? coverImg, File? localImgFile, List<String> deletedImages, TripEntity? updatedTrip, String? message, String? errorType, String? actionType, bool isSameDay, bool showSameDayDialog, bool isUploading, EditTripPageState pageState
});


@override $TripEntityCopyWith<$Res>? get originalTrip;@override $TripEntityCopyWith<$Res>? get updatedTrip;

}
/// @nodoc
class __$EditTripStateCopyWithImpl<$Res>
    implements _$EditTripStateCopyWith<$Res> {
  __$EditTripStateCopyWithImpl(this._self, this._then);

  final _EditTripState _self;
  final $Res Function(_EditTripState) _then;

/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalTrip = freezed,Object? tripId = freezed,Object? userId = null,Object? title = null,Object? place = null,Object? startAt = null,Object? endAt = null,Object? coverType = null,Object? country = null,Object? coverStyle = null,Object? coverImg = freezed,Object? localImgFile = freezed,Object? deletedImages = null,Object? updatedTrip = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isSameDay = null,Object? showSameDayDialog = null,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_EditTripState(
originalTrip: freezed == originalTrip ? _self.originalTrip : originalTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,coverType: null == coverType ? _self.coverType : coverType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,coverStyle: null == coverStyle ? _self.coverStyle : coverStyle // ignore: cast_nullable_to_non_nullable
as String,coverImg: freezed == coverImg ? _self.coverImg : coverImg // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,deletedImages: null == deletedImages ? _self._deletedImages : deletedImages // ignore: cast_nullable_to_non_nullable
as List<String>,updatedTrip: freezed == updatedTrip ? _self.updatedTrip : updatedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isSameDay: null == isSameDay ? _self.isSameDay : isSameDay // ignore: cast_nullable_to_non_nullable
as bool,showSameDayDialog: null == showSameDayDialog ? _self.showSameDayDialog : showSameDayDialog // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditTripPageState,
  ));
}

/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get originalTrip {
    if (_self.originalTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.originalTrip!, (value) {
    return _then(_self.copyWith(originalTrip: value));
  });
}/// Create a copy of EditTripState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get updatedTrip {
    if (_self.updatedTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.updatedTrip!, (value) {
    return _then(_self.copyWith(updatedTrip: value));
  });
}
}

// dart format on
