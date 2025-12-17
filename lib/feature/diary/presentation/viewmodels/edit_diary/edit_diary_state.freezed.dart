// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditDiaryState {

// 다이어리 ID (수정 대상)
 int? get diaryId;// 여행, 사용자 정보
 int get tripId; int get userId;// 원본 다이어리 (비교용)
 DiaryEntity? get originalDiary;// 폼 입력 값
 String get type; String get title; String get content; double get rating; String? get imgUrl;// 기존 이미지 URL (서버에서 로드)
 File? get localImgFile;// 새로 선택한 로컬 이미지
 int? get cost; String get currency; bool get isPublic; int? get scheduleId;// 수정된 다이어리
 DiaryEntity? get updatedDiary;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;// 이미지 업로드 상태
 bool get isUploading;// 페이지 상태
 EditDiaryPageState get pageState;
/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditDiaryStateCopyWith<EditDiaryState> get copyWith => _$EditDiaryStateCopyWithImpl<EditDiaryState>(this as EditDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDiaryState&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.originalDiary, originalDiary) || other.originalDiary == originalDiary)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.updatedDiary, updatedDiary) || other.updatedDiary == updatedDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,diaryId,tripId,userId,originalDiary,type,title,content,rating,imgUrl,localImgFile,cost,currency,isPublic,scheduleId,updatedDiary,message,errorType,actionType,isUploading,pageState]);

@override
String toString() {
  return 'EditDiaryState(diaryId: $diaryId, tripId: $tripId, userId: $userId, originalDiary: $originalDiary, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, localImgFile: $localImgFile, cost: $cost, currency: $currency, isPublic: $isPublic, scheduleId: $scheduleId, updatedDiary: $updatedDiary, message: $message, errorType: $errorType, actionType: $actionType, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $EditDiaryStateCopyWith<$Res>  {
  factory $EditDiaryStateCopyWith(EditDiaryState value, $Res Function(EditDiaryState) _then) = _$EditDiaryStateCopyWithImpl;
@useResult
$Res call({
 int? diaryId, int tripId, int userId, DiaryEntity? originalDiary, String type, String title, String content, double rating, String? imgUrl, File? localImgFile, int? cost, String currency, bool isPublic, int? scheduleId, DiaryEntity? updatedDiary, String? message, String? errorType, String? actionType, bool isUploading, EditDiaryPageState pageState
});


$DiaryEntityCopyWith<$Res>? get originalDiary;$DiaryEntityCopyWith<$Res>? get updatedDiary;

}
/// @nodoc
class _$EditDiaryStateCopyWithImpl<$Res>
    implements $EditDiaryStateCopyWith<$Res> {
  _$EditDiaryStateCopyWithImpl(this._self, this._then);

  final EditDiaryState _self;
  final $Res Function(EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diaryId = freezed,Object? tripId = null,Object? userId = null,Object? originalDiary = freezed,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? cost = freezed,Object? currency = null,Object? isPublic = null,Object? scheduleId = freezed,Object? updatedDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
diaryId: freezed == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as int?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,originalDiary: freezed == originalDiary ? _self.originalDiary : originalDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,updatedDiary: freezed == updatedDiary ? _self.updatedDiary : updatedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditDiaryPageState,
  ));
}
/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get originalDiary {
    if (_self.originalDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.originalDiary!, (value) {
    return _then(_self.copyWith(originalDiary: value));
  });
}/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get updatedDiary {
    if (_self.updatedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.updatedDiary!, (value) {
    return _then(_self.copyWith(updatedDiary: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditDiaryState].
extension EditDiaryStatePatterns on EditDiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditDiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditDiaryState value)  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditDiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? diaryId,  int tripId,  int userId,  DiaryEntity? originalDiary,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  bool isPublic,  int? scheduleId,  DiaryEntity? updatedDiary,  String? message,  String? errorType,  String? actionType,  bool isUploading,  EditDiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.diaryId,_that.tripId,_that.userId,_that.originalDiary,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.isPublic,_that.scheduleId,_that.updatedDiary,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? diaryId,  int tripId,  int userId,  DiaryEntity? originalDiary,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  bool isPublic,  int? scheduleId,  DiaryEntity? updatedDiary,  String? message,  String? errorType,  String? actionType,  bool isUploading,  EditDiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState():
return $default(_that.diaryId,_that.tripId,_that.userId,_that.originalDiary,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.isPublic,_that.scheduleId,_that.updatedDiary,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? diaryId,  int tripId,  int userId,  DiaryEntity? originalDiary,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  bool isPublic,  int? scheduleId,  DiaryEntity? updatedDiary,  String? message,  String? errorType,  String? actionType,  bool isUploading,  EditDiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.diaryId,_that.tripId,_that.userId,_that.originalDiary,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.isPublic,_that.scheduleId,_that.updatedDiary,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _EditDiaryState extends EditDiaryState {
  const _EditDiaryState({this.diaryId, this.tripId = 0, this.userId = 0, this.originalDiary, this.type = 'MEMO', this.title = '', this.content = '', this.rating = 0.0, this.imgUrl, this.localImgFile, this.cost, this.currency = '원', this.isPublic = true, this.scheduleId, this.updatedDiary, this.message, this.errorType, this.actionType, this.isUploading = false, this.pageState = EditDiaryPageState.init}): super._();
  

// 다이어리 ID (수정 대상)
@override final  int? diaryId;
// 여행, 사용자 정보
@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
// 원본 다이어리 (비교용)
@override final  DiaryEntity? originalDiary;
// 폼 입력 값
@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  double rating;
@override final  String? imgUrl;
// 기존 이미지 URL (서버에서 로드)
@override final  File? localImgFile;
// 새로 선택한 로컬 이미지
@override final  int? cost;
@override@JsonKey() final  String currency;
@override@JsonKey() final  bool isPublic;
@override final  int? scheduleId;
// 수정된 다이어리
@override final  DiaryEntity? updatedDiary;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
// 이미지 업로드 상태
@override@JsonKey() final  bool isUploading;
// 페이지 상태
@override@JsonKey() final  EditDiaryPageState pageState;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditDiaryStateCopyWith<_EditDiaryState> get copyWith => __$EditDiaryStateCopyWithImpl<_EditDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditDiaryState&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.originalDiary, originalDiary) || other.originalDiary == originalDiary)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.updatedDiary, updatedDiary) || other.updatedDiary == updatedDiary)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,diaryId,tripId,userId,originalDiary,type,title,content,rating,imgUrl,localImgFile,cost,currency,isPublic,scheduleId,updatedDiary,message,errorType,actionType,isUploading,pageState]);

@override
String toString() {
  return 'EditDiaryState(diaryId: $diaryId, tripId: $tripId, userId: $userId, originalDiary: $originalDiary, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, localImgFile: $localImgFile, cost: $cost, currency: $currency, isPublic: $isPublic, scheduleId: $scheduleId, updatedDiary: $updatedDiary, message: $message, errorType: $errorType, actionType: $actionType, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$EditDiaryStateCopyWith<$Res> implements $EditDiaryStateCopyWith<$Res> {
  factory _$EditDiaryStateCopyWith(_EditDiaryState value, $Res Function(_EditDiaryState) _then) = __$EditDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 int? diaryId, int tripId, int userId, DiaryEntity? originalDiary, String type, String title, String content, double rating, String? imgUrl, File? localImgFile, int? cost, String currency, bool isPublic, int? scheduleId, DiaryEntity? updatedDiary, String? message, String? errorType, String? actionType, bool isUploading, EditDiaryPageState pageState
});


@override $DiaryEntityCopyWith<$Res>? get originalDiary;@override $DiaryEntityCopyWith<$Res>? get updatedDiary;

}
/// @nodoc
class __$EditDiaryStateCopyWithImpl<$Res>
    implements _$EditDiaryStateCopyWith<$Res> {
  __$EditDiaryStateCopyWithImpl(this._self, this._then);

  final _EditDiaryState _self;
  final $Res Function(_EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diaryId = freezed,Object? tripId = null,Object? userId = null,Object? originalDiary = freezed,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? cost = freezed,Object? currency = null,Object? isPublic = null,Object? scheduleId = freezed,Object? updatedDiary = freezed,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_EditDiaryState(
diaryId: freezed == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as int?,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,originalDiary: freezed == originalDiary ? _self.originalDiary : originalDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,updatedDiary: freezed == updatedDiary ? _self.updatedDiary : updatedDiary // ignore: cast_nullable_to_non_nullable
as DiaryEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as EditDiaryPageState,
  ));
}

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get originalDiary {
    if (_self.originalDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.originalDiary!, (value) {
    return _then(_self.copyWith(originalDiary: value));
  });
}/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res>? get updatedDiary {
    if (_self.updatedDiary == null) {
    return null;
  }

  return $DiaryEntityCopyWith<$Res>(_self.updatedDiary!, (value) {
    return _then(_self.copyWith(updatedDiary: value));
  });
}
}

// dart format on
