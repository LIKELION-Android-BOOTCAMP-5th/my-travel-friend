// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryEvent()';
}


}

/// @nodoc
class $DiaryEventCopyWith<$Res>  {
$DiaryEventCopyWith(DiaryEvent _, $Res Function(DiaryEvent) __);
}


/// Adds pattern-matching-related methods to [DiaryEvent].
extension DiaryEventPatterns on DiaryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetOurDiaries value)?  getOurDiaries,TResult Function( GetMyDiaries value)?  getMyDiaries,TResult Function( LoadMore value)?  loadMore,TResult Function( GetDiaryById value)?  getDiaryById,TResult Function( DeleteDiary value)?  deleteDiary,TResult Function( FilterByType value)?  filterByType,TResult Function( Refresh value)?  refresh,TResult Function( RequestCreate value)?  requestCreate,TResult Function( RequestEdit value)?  requestEdit,TResult Function( NavigationHandled value)?  navigationHandled,TResult Function( OnCreateCompleted value)?  onCreateCompleted,TResult Function( OnEditCompleted value)?  onEditCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetOurDiaries() when getOurDiaries != null:
return getOurDiaries(_that);case GetMyDiaries() when getMyDiaries != null:
return getMyDiaries(_that);case LoadMore() when loadMore != null:
return loadMore(_that);case GetDiaryById() when getDiaryById != null:
return getDiaryById(_that);case DeleteDiary() when deleteDiary != null:
return deleteDiary(_that);case FilterByType() when filterByType != null:
return filterByType(_that);case Refresh() when refresh != null:
return refresh(_that);case RequestCreate() when requestCreate != null:
return requestCreate(_that);case RequestEdit() when requestEdit != null:
return requestEdit(_that);case NavigationHandled() when navigationHandled != null:
return navigationHandled(_that);case OnCreateCompleted() when onCreateCompleted != null:
return onCreateCompleted(_that);case OnEditCompleted() when onEditCompleted != null:
return onEditCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetOurDiaries value)  getOurDiaries,required TResult Function( GetMyDiaries value)  getMyDiaries,required TResult Function( LoadMore value)  loadMore,required TResult Function( GetDiaryById value)  getDiaryById,required TResult Function( DeleteDiary value)  deleteDiary,required TResult Function( FilterByType value)  filterByType,required TResult Function( Refresh value)  refresh,required TResult Function( RequestCreate value)  requestCreate,required TResult Function( RequestEdit value)  requestEdit,required TResult Function( NavigationHandled value)  navigationHandled,required TResult Function( OnCreateCompleted value)  onCreateCompleted,required TResult Function( OnEditCompleted value)  onEditCompleted,}){
final _that = this;
switch (_that) {
case GetOurDiaries():
return getOurDiaries(_that);case GetMyDiaries():
return getMyDiaries(_that);case LoadMore():
return loadMore(_that);case GetDiaryById():
return getDiaryById(_that);case DeleteDiary():
return deleteDiary(_that);case FilterByType():
return filterByType(_that);case Refresh():
return refresh(_that);case RequestCreate():
return requestCreate(_that);case RequestEdit():
return requestEdit(_that);case NavigationHandled():
return navigationHandled(_that);case OnCreateCompleted():
return onCreateCompleted(_that);case OnEditCompleted():
return onEditCompleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetOurDiaries value)?  getOurDiaries,TResult? Function( GetMyDiaries value)?  getMyDiaries,TResult? Function( LoadMore value)?  loadMore,TResult? Function( GetDiaryById value)?  getDiaryById,TResult? Function( DeleteDiary value)?  deleteDiary,TResult? Function( FilterByType value)?  filterByType,TResult? Function( Refresh value)?  refresh,TResult? Function( RequestCreate value)?  requestCreate,TResult? Function( RequestEdit value)?  requestEdit,TResult? Function( NavigationHandled value)?  navigationHandled,TResult? Function( OnCreateCompleted value)?  onCreateCompleted,TResult? Function( OnEditCompleted value)?  onEditCompleted,}){
final _that = this;
switch (_that) {
case GetOurDiaries() when getOurDiaries != null:
return getOurDiaries(_that);case GetMyDiaries() when getMyDiaries != null:
return getMyDiaries(_that);case LoadMore() when loadMore != null:
return loadMore(_that);case GetDiaryById() when getDiaryById != null:
return getDiaryById(_that);case DeleteDiary() when deleteDiary != null:
return deleteDiary(_that);case FilterByType() when filterByType != null:
return filterByType(_that);case Refresh() when refresh != null:
return refresh(_that);case RequestCreate() when requestCreate != null:
return requestCreate(_that);case RequestEdit() when requestEdit != null:
return requestEdit(_that);case NavigationHandled() when navigationHandled != null:
return navigationHandled(_that);case OnCreateCompleted() when onCreateCompleted != null:
return onCreateCompleted(_that);case OnEditCompleted() when onEditCompleted != null:
return onEditCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId)?  getOurDiaries,TResult Function( int tripId,  int userId)?  getMyDiaries,TResult Function()?  loadMore,TResult Function( int diaryId)?  getDiaryById,TResult Function( int diaryId)?  deleteDiary,TResult Function( String? type)?  filterByType,TResult Function()?  refresh,TResult Function()?  requestCreate,TResult Function( DiaryEntity diary)?  requestEdit,TResult Function()?  navigationHandled,TResult Function( bool success)?  onCreateCompleted,TResult Function( bool success)?  onEditCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetOurDiaries() when getOurDiaries != null:
return getOurDiaries(_that.tripId);case GetMyDiaries() when getMyDiaries != null:
return getMyDiaries(_that.tripId,_that.userId);case LoadMore() when loadMore != null:
return loadMore();case GetDiaryById() when getDiaryById != null:
return getDiaryById(_that.diaryId);case DeleteDiary() when deleteDiary != null:
return deleteDiary(_that.diaryId);case FilterByType() when filterByType != null:
return filterByType(_that.type);case Refresh() when refresh != null:
return refresh();case RequestCreate() when requestCreate != null:
return requestCreate();case RequestEdit() when requestEdit != null:
return requestEdit(_that.diary);case NavigationHandled() when navigationHandled != null:
return navigationHandled();case OnCreateCompleted() when onCreateCompleted != null:
return onCreateCompleted(_that.success);case OnEditCompleted() when onEditCompleted != null:
return onEditCompleted(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId)  getOurDiaries,required TResult Function( int tripId,  int userId)  getMyDiaries,required TResult Function()  loadMore,required TResult Function( int diaryId)  getDiaryById,required TResult Function( int diaryId)  deleteDiary,required TResult Function( String? type)  filterByType,required TResult Function()  refresh,required TResult Function()  requestCreate,required TResult Function( DiaryEntity diary)  requestEdit,required TResult Function()  navigationHandled,required TResult Function( bool success)  onCreateCompleted,required TResult Function( bool success)  onEditCompleted,}) {final _that = this;
switch (_that) {
case GetOurDiaries():
return getOurDiaries(_that.tripId);case GetMyDiaries():
return getMyDiaries(_that.tripId,_that.userId);case LoadMore():
return loadMore();case GetDiaryById():
return getDiaryById(_that.diaryId);case DeleteDiary():
return deleteDiary(_that.diaryId);case FilterByType():
return filterByType(_that.type);case Refresh():
return refresh();case RequestCreate():
return requestCreate();case RequestEdit():
return requestEdit(_that.diary);case NavigationHandled():
return navigationHandled();case OnCreateCompleted():
return onCreateCompleted(_that.success);case OnEditCompleted():
return onEditCompleted(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId)?  getOurDiaries,TResult? Function( int tripId,  int userId)?  getMyDiaries,TResult? Function()?  loadMore,TResult? Function( int diaryId)?  getDiaryById,TResult? Function( int diaryId)?  deleteDiary,TResult? Function( String? type)?  filterByType,TResult? Function()?  refresh,TResult? Function()?  requestCreate,TResult? Function( DiaryEntity diary)?  requestEdit,TResult? Function()?  navigationHandled,TResult? Function( bool success)?  onCreateCompleted,TResult? Function( bool success)?  onEditCompleted,}) {final _that = this;
switch (_that) {
case GetOurDiaries() when getOurDiaries != null:
return getOurDiaries(_that.tripId);case GetMyDiaries() when getMyDiaries != null:
return getMyDiaries(_that.tripId,_that.userId);case LoadMore() when loadMore != null:
return loadMore();case GetDiaryById() when getDiaryById != null:
return getDiaryById(_that.diaryId);case DeleteDiary() when deleteDiary != null:
return deleteDiary(_that.diaryId);case FilterByType() when filterByType != null:
return filterByType(_that.type);case Refresh() when refresh != null:
return refresh();case RequestCreate() when requestCreate != null:
return requestCreate();case RequestEdit() when requestEdit != null:
return requestEdit(_that.diary);case NavigationHandled() when navigationHandled != null:
return navigationHandled();case OnCreateCompleted() when onCreateCompleted != null:
return onCreateCompleted(_that.success);case OnEditCompleted() when onEditCompleted != null:
return onEditCompleted(_that.success);case _:
  return null;

}
}

}

/// @nodoc


class GetOurDiaries implements DiaryEvent {
  const GetOurDiaries({required this.tripId});
  

 final  int tripId;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetOurDiariesCopyWith<GetOurDiaries> get copyWith => _$GetOurDiariesCopyWithImpl<GetOurDiaries>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetOurDiaries&&(identical(other.tripId, tripId) || other.tripId == tripId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId);

@override
String toString() {
  return 'DiaryEvent.getOurDiaries(tripId: $tripId)';
}


}

/// @nodoc
abstract mixin class $GetOurDiariesCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $GetOurDiariesCopyWith(GetOurDiaries value, $Res Function(GetOurDiaries) _then) = _$GetOurDiariesCopyWithImpl;
@useResult
$Res call({
 int tripId
});




}
/// @nodoc
class _$GetOurDiariesCopyWithImpl<$Res>
    implements $GetOurDiariesCopyWith<$Res> {
  _$GetOurDiariesCopyWithImpl(this._self, this._then);

  final GetOurDiaries _self;
  final $Res Function(GetOurDiaries) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,}) {
  return _then(GetOurDiaries(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetMyDiaries implements DiaryEvent {
  const GetMyDiaries({required this.tripId, required this.userId});
  

 final  int tripId;
 final  int userId;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMyDiariesCopyWith<GetMyDiaries> get copyWith => _$GetMyDiariesCopyWithImpl<GetMyDiaries>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMyDiaries&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId);

@override
String toString() {
  return 'DiaryEvent.getMyDiaries(tripId: $tripId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetMyDiariesCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $GetMyDiariesCopyWith(GetMyDiaries value, $Res Function(GetMyDiaries) _then) = _$GetMyDiariesCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId
});




}
/// @nodoc
class _$GetMyDiariesCopyWithImpl<$Res>
    implements $GetMyDiariesCopyWith<$Res> {
  _$GetMyDiariesCopyWithImpl(this._self, this._then);

  final GetMyDiaries _self;
  final $Res Function(GetMyDiaries) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,}) {
  return _then(GetMyDiaries(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadMore implements DiaryEvent {
  const LoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryEvent.loadMore()';
}


}




/// @nodoc


class GetDiaryById implements DiaryEvent {
  const GetDiaryById({required this.diaryId});
  

 final  int diaryId;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetDiaryByIdCopyWith<GetDiaryById> get copyWith => _$GetDiaryByIdCopyWithImpl<GetDiaryById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDiaryById&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId);

@override
String toString() {
  return 'DiaryEvent.getDiaryById(diaryId: $diaryId)';
}


}

/// @nodoc
abstract mixin class $GetDiaryByIdCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $GetDiaryByIdCopyWith(GetDiaryById value, $Res Function(GetDiaryById) _then) = _$GetDiaryByIdCopyWithImpl;
@useResult
$Res call({
 int diaryId
});




}
/// @nodoc
class _$GetDiaryByIdCopyWithImpl<$Res>
    implements $GetDiaryByIdCopyWith<$Res> {
  _$GetDiaryByIdCopyWithImpl(this._self, this._then);

  final GetDiaryById _self;
  final $Res Function(GetDiaryById) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diaryId = null,}) {
  return _then(GetDiaryById(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteDiary implements DiaryEvent {
  const DeleteDiary({required this.diaryId});
  

 final  int diaryId;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDiaryCopyWith<DeleteDiary> get copyWith => _$DeleteDiaryCopyWithImpl<DeleteDiary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDiary&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId);

@override
String toString() {
  return 'DiaryEvent.deleteDiary(diaryId: $diaryId)';
}


}

/// @nodoc
abstract mixin class $DeleteDiaryCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $DeleteDiaryCopyWith(DeleteDiary value, $Res Function(DeleteDiary) _then) = _$DeleteDiaryCopyWithImpl;
@useResult
$Res call({
 int diaryId
});




}
/// @nodoc
class _$DeleteDiaryCopyWithImpl<$Res>
    implements $DeleteDiaryCopyWith<$Res> {
  _$DeleteDiaryCopyWithImpl(this._self, this._then);

  final DeleteDiary _self;
  final $Res Function(DeleteDiary) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diaryId = null,}) {
  return _then(DeleteDiary(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FilterByType implements DiaryEvent {
  const FilterByType({this.type});
  

 final  String? type;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterByTypeCopyWith<FilterByType> get copyWith => _$FilterByTypeCopyWithImpl<FilterByType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterByType&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'DiaryEvent.filterByType(type: $type)';
}


}

/// @nodoc
abstract mixin class $FilterByTypeCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $FilterByTypeCopyWith(FilterByType value, $Res Function(FilterByType) _then) = _$FilterByTypeCopyWithImpl;
@useResult
$Res call({
 String? type
});




}
/// @nodoc
class _$FilterByTypeCopyWithImpl<$Res>
    implements $FilterByTypeCopyWith<$Res> {
  _$FilterByTypeCopyWithImpl(this._self, this._then);

  final FilterByType _self;
  final $Res Function(FilterByType) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,}) {
  return _then(FilterByType(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Refresh implements DiaryEvent {
  const Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryEvent.refresh()';
}


}




/// @nodoc


class RequestCreate implements DiaryEvent {
  const RequestCreate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCreate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryEvent.requestCreate()';
}


}




/// @nodoc


class RequestEdit implements DiaryEvent {
  const RequestEdit({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestEditCopyWith<RequestEdit> get copyWith => _$RequestEditCopyWithImpl<RequestEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestEdit&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'DiaryEvent.requestEdit(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $RequestEditCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $RequestEditCopyWith(RequestEdit value, $Res Function(RequestEdit) _then) = _$RequestEditCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$RequestEditCopyWithImpl<$Res>
    implements $RequestEditCopyWith<$Res> {
  _$RequestEditCopyWithImpl(this._self, this._then);

  final RequestEdit _self;
  final $Res Function(RequestEdit) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(RequestEdit(
diary: null == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as DiaryEntity,
  ));
}

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryEntityCopyWith<$Res> get diary {
  
  return $DiaryEntityCopyWith<$Res>(_self.diary, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}

/// @nodoc


class NavigationHandled implements DiaryEvent {
  const NavigationHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiaryEvent.navigationHandled()';
}


}




/// @nodoc


class OnCreateCompleted implements DiaryEvent {
  const OnCreateCompleted({required this.success});
  

 final  bool success;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnCreateCompletedCopyWith<OnCreateCompleted> get copyWith => _$OnCreateCompletedCopyWithImpl<OnCreateCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCreateCompleted&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DiaryEvent.onCreateCompleted(success: $success)';
}


}

/// @nodoc
abstract mixin class $OnCreateCompletedCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $OnCreateCompletedCopyWith(OnCreateCompleted value, $Res Function(OnCreateCompleted) _then) = _$OnCreateCompletedCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$OnCreateCompletedCopyWithImpl<$Res>
    implements $OnCreateCompletedCopyWith<$Res> {
  _$OnCreateCompletedCopyWithImpl(this._self, this._then);

  final OnCreateCompleted _self;
  final $Res Function(OnCreateCompleted) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(OnCreateCompleted(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OnEditCompleted implements DiaryEvent {
  const OnEditCompleted({required this.success});
  

 final  bool success;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnEditCompletedCopyWith<OnEditCompleted> get copyWith => _$OnEditCompletedCopyWithImpl<OnEditCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnEditCompleted&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DiaryEvent.onEditCompleted(success: $success)';
}


}

/// @nodoc
abstract mixin class $OnEditCompletedCopyWith<$Res> implements $DiaryEventCopyWith<$Res> {
  factory $OnEditCompletedCopyWith(OnEditCompleted value, $Res Function(OnEditCompleted) _then) = _$OnEditCompletedCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$OnEditCompletedCopyWithImpl<$Res>
    implements $OnEditCompletedCopyWith<$Res> {
  _$OnEditCompletedCopyWithImpl(this._self, this._then);

  final OnEditCompleted _self;
  final $Res Function(OnEditCompleted) _then;

/// Create a copy of DiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(OnEditCompleted(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
