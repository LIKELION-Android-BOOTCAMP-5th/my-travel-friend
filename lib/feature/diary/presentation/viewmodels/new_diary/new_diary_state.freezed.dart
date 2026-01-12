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
 String get type; String get title; String get content; double get rating; String? get imgUrl; File? get localImgFile; int? get cost; String get currency; String get payment; bool get isPublic; int? get scheduleId;// 일정 관련 (팝업용)
 List<ScheduleEntity> get schedules; bool get isLoadingSchedules;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;// 이미지 업로드 상태 (추가)
 bool get isUploading;// 페이지 상태
 NewDiaryPageState get pageState;
/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewDiaryStateCopyWith<NewDiaryState> get copyWith => _$NewDiaryStateCopyWithImpl<NewDiaryState>(this as NewDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewDiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&const DeepCollectionEquality().equals(other.schedules, schedules)&&(identical(other.isLoadingSchedules, isLoadingSchedules) || other.isLoadingSchedules == isLoadingSchedules)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,userId,type,title,content,rating,imgUrl,localImgFile,cost,currency,payment,isPublic,scheduleId,const DeepCollectionEquality().hash(schedules),isLoadingSchedules,message,errorType,actionType,isUploading,pageState]);

@override
String toString() {
  return 'NewDiaryState(tripId: $tripId, userId: $userId, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, localImgFile: $localImgFile, cost: $cost, currency: $currency, payment: $payment, isPublic: $isPublic, scheduleId: $scheduleId, schedules: $schedules, isLoadingSchedules: $isLoadingSchedules, message: $message, errorType: $errorType, actionType: $actionType, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $NewDiaryStateCopyWith<$Res>  {
  factory $NewDiaryStateCopyWith(NewDiaryState value, $Res Function(NewDiaryState) _then) = _$NewDiaryStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId, String type, String title, String content, double rating, String? imgUrl, File? localImgFile, int? cost, String currency, String payment, bool isPublic, int? scheduleId, List<ScheduleEntity> schedules, bool isLoadingSchedules, String? message, String? errorType, String? actionType, bool isUploading, NewDiaryPageState pageState
});




}
/// @nodoc
class _$NewDiaryStateCopyWithImpl<$Res>
    implements $NewDiaryStateCopyWith<$Res> {
  _$NewDiaryStateCopyWithImpl(this._self, this._then);

  final NewDiaryState _self;
  final $Res Function(NewDiaryState) _then;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = null,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? cost = freezed,Object? currency = null,Object? payment = null,Object? isPublic = null,Object? scheduleId = freezed,Object? schedules = null,Object? isLoadingSchedules = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,isLoadingSchedules: null == isLoadingSchedules ? _self.isLoadingSchedules : isLoadingSchedules // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as NewDiaryPageState,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  String payment,  bool isPublic,  int? scheduleId,  List<ScheduleEntity> schedules,  bool isLoadingSchedules,  String? message,  String? errorType,  String? actionType,  bool isUploading,  NewDiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.payment,_that.isPublic,_that.scheduleId,_that.schedules,_that.isLoadingSchedules,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  String payment,  bool isPublic,  int? scheduleId,  List<ScheduleEntity> schedules,  bool isLoadingSchedules,  String? message,  String? errorType,  String? actionType,  bool isUploading,  NewDiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _NewDiaryState():
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.payment,_that.isPublic,_that.scheduleId,_that.schedules,_that.isLoadingSchedules,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int userId,  String type,  String title,  String content,  double rating,  String? imgUrl,  File? localImgFile,  int? cost,  String currency,  String payment,  bool isPublic,  int? scheduleId,  List<ScheduleEntity> schedules,  bool isLoadingSchedules,  String? message,  String? errorType,  String? actionType,  bool isUploading,  NewDiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _NewDiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.type,_that.title,_that.content,_that.rating,_that.imgUrl,_that.localImgFile,_that.cost,_that.currency,_that.payment,_that.isPublic,_that.scheduleId,_that.schedules,_that.isLoadingSchedules,_that.message,_that.errorType,_that.actionType,_that.isUploading,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _NewDiaryState extends NewDiaryState {
  const _NewDiaryState({this.tripId = 0, this.userId = 0, this.type = 'MEMO', this.title = '', this.content = '', this.rating = 0.0, this.imgUrl, this.localImgFile, this.cost, this.currency = '원', this.payment = '현금', this.isPublic = true, this.scheduleId, final  List<ScheduleEntity> schedules = const [], this.isLoadingSchedules = false, this.message, this.errorType, this.actionType, this.isUploading = false, this.pageState = NewDiaryPageState.init}): _schedules = schedules,super._();
  

// 여행, 사용자 정보
@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
// 폼 입력 값
@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  double rating;
@override final  String? imgUrl;
@override final  File? localImgFile;
@override final  int? cost;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String payment;
@override@JsonKey() final  bool isPublic;
@override final  int? scheduleId;
// 일정 관련 (팝업용)
 final  List<ScheduleEntity> _schedules;
// 일정 관련 (팝업용)
@override@JsonKey() List<ScheduleEntity> get schedules {
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedules);
}

@override@JsonKey() final  bool isLoadingSchedules;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;
// 이미지 업로드 상태 (추가)
@override@JsonKey() final  bool isUploading;
// 페이지 상태
@override@JsonKey() final  NewDiaryPageState pageState;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewDiaryStateCopyWith<_NewDiaryState> get copyWith => __$NewDiaryStateCopyWithImpl<_NewDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewDiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&(identical(other.isLoadingSchedules, isLoadingSchedules) || other.isLoadingSchedules == isLoadingSchedules)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,userId,type,title,content,rating,imgUrl,localImgFile,cost,currency,payment,isPublic,scheduleId,const DeepCollectionEquality().hash(_schedules),isLoadingSchedules,message,errorType,actionType,isUploading,pageState]);

@override
String toString() {
  return 'NewDiaryState(tripId: $tripId, userId: $userId, type: $type, title: $title, content: $content, rating: $rating, imgUrl: $imgUrl, localImgFile: $localImgFile, cost: $cost, currency: $currency, payment: $payment, isPublic: $isPublic, scheduleId: $scheduleId, schedules: $schedules, isLoadingSchedules: $isLoadingSchedules, message: $message, errorType: $errorType, actionType: $actionType, isUploading: $isUploading, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$NewDiaryStateCopyWith<$Res> implements $NewDiaryStateCopyWith<$Res> {
  factory _$NewDiaryStateCopyWith(_NewDiaryState value, $Res Function(_NewDiaryState) _then) = __$NewDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int userId, String type, String title, String content, double rating, String? imgUrl, File? localImgFile, int? cost, String currency, String payment, bool isPublic, int? scheduleId, List<ScheduleEntity> schedules, bool isLoadingSchedules, String? message, String? errorType, String? actionType, bool isUploading, NewDiaryPageState pageState
});




}
/// @nodoc
class __$NewDiaryStateCopyWithImpl<$Res>
    implements _$NewDiaryStateCopyWith<$Res> {
  __$NewDiaryStateCopyWithImpl(this._self, this._then);

  final _NewDiaryState _self;
  final $Res Function(_NewDiaryState) _then;

/// Create a copy of NewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,Object? type = null,Object? title = null,Object? content = null,Object? rating = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? cost = freezed,Object? currency = null,Object? payment = null,Object? isPublic = null,Object? scheduleId = freezed,Object? schedules = null,Object? isLoadingSchedules = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,Object? isUploading = null,Object? pageState = null,}) {
  return _then(_NewDiaryState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,schedules: null == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,isLoadingSchedules: null == isLoadingSchedules ? _self.isLoadingSchedules : isLoadingSchedules // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as NewDiaryPageState,
  ));
}


}

// dart format on
