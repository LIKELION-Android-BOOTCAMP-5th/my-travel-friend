// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_diary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewDiaryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewDiaryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewDiaryEvent()';
}


}

/// @nodoc
class $NewDiaryEventCopyWith<$Res>  {
$NewDiaryEventCopyWith(NewDiaryEvent _, $Res Function(NewDiaryEvent) __);
}


/// Adds pattern-matching-related methods to [NewDiaryEvent].
extension NewDiaryEventPatterns on NewDiaryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateDiary value)?  createDiary,TResult Function( ChangeType value)?  changeType,TResult Function( ChangeTitle value)?  changeTitle,TResult Function( ChangeContent value)?  changeContent,TResult Function( ChangeRating value)?  changeRating,TResult Function( ChangePhoto value)?  changePhoto,TResult Function( ChangeCost value)?  changeCost,TResult Function( ChangePublic value)?  changePublic,TResult Function( ChooseSchedule value)?  chooseSchedule,TResult Function( Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateDiary() when createDiary != null:
return createDiary(_that);case ChangeType() when changeType != null:
return changeType(_that);case ChangeTitle() when changeTitle != null:
return changeTitle(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case ChangeRating() when changeRating != null:
return changeRating(_that);case ChangePhoto() when changePhoto != null:
return changePhoto(_that);case ChangeCost() when changeCost != null:
return changeCost(_that);case ChangePublic() when changePublic != null:
return changePublic(_that);case ChooseSchedule() when chooseSchedule != null:
return chooseSchedule(_that);case Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateDiary value)  createDiary,required TResult Function( ChangeType value)  changeType,required TResult Function( ChangeTitle value)  changeTitle,required TResult Function( ChangeContent value)  changeContent,required TResult Function( ChangeRating value)  changeRating,required TResult Function( ChangePhoto value)  changePhoto,required TResult Function( ChangeCost value)  changeCost,required TResult Function( ChangePublic value)  changePublic,required TResult Function( ChooseSchedule value)  chooseSchedule,required TResult Function( Reset value)  reset,}){
final _that = this;
switch (_that) {
case CreateDiary():
return createDiary(_that);case ChangeType():
return changeType(_that);case ChangeTitle():
return changeTitle(_that);case ChangeContent():
return changeContent(_that);case ChangeRating():
return changeRating(_that);case ChangePhoto():
return changePhoto(_that);case ChangeCost():
return changeCost(_that);case ChangePublic():
return changePublic(_that);case ChooseSchedule():
return chooseSchedule(_that);case Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateDiary value)?  createDiary,TResult? Function( ChangeType value)?  changeType,TResult? Function( ChangeTitle value)?  changeTitle,TResult? Function( ChangeContent value)?  changeContent,TResult? Function( ChangeRating value)?  changeRating,TResult? Function( ChangePhoto value)?  changePhoto,TResult? Function( ChangeCost value)?  changeCost,TResult? Function( ChangePublic value)?  changePublic,TResult? Function( ChooseSchedule value)?  chooseSchedule,TResult? Function( Reset value)?  reset,}){
final _that = this;
switch (_that) {
case CreateDiary() when createDiary != null:
return createDiary(_that);case ChangeType() when changeType != null:
return changeType(_that);case ChangeTitle() when changeTitle != null:
return changeTitle(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case ChangeRating() when changeRating != null:
return changeRating(_that);case ChangePhoto() when changePhoto != null:
return changePhoto(_that);case ChangeCost() when changeCost != null:
return changeCost(_that);case ChangePublic() when changePublic != null:
return changePublic(_that);case ChooseSchedule() when chooseSchedule != null:
return chooseSchedule(_that);case Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DiaryEntity diary)?  createDiary,TResult Function( String type)?  changeType,TResult Function( String title)?  changeTitle,TResult Function( String content)?  changeContent,TResult Function( double rating)?  changeRating,TResult Function( String? imgUrl)?  changePhoto,TResult Function( int? cost)?  changeCost,TResult Function( bool isPublic)?  changePublic,TResult Function( int? scheduleId)?  chooseSchedule,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateDiary() when createDiary != null:
return createDiary(_that.diary);case ChangeType() when changeType != null:
return changeType(_that.type);case ChangeTitle() when changeTitle != null:
return changeTitle(_that.title);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case ChangeRating() when changeRating != null:
return changeRating(_that.rating);case ChangePhoto() when changePhoto != null:
return changePhoto(_that.imgUrl);case ChangeCost() when changeCost != null:
return changeCost(_that.cost);case ChangePublic() when changePublic != null:
return changePublic(_that.isPublic);case ChooseSchedule() when chooseSchedule != null:
return chooseSchedule(_that.scheduleId);case Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DiaryEntity diary)  createDiary,required TResult Function( String type)  changeType,required TResult Function( String title)  changeTitle,required TResult Function( String content)  changeContent,required TResult Function( double rating)  changeRating,required TResult Function( String? imgUrl)  changePhoto,required TResult Function( int? cost)  changeCost,required TResult Function( bool isPublic)  changePublic,required TResult Function( int? scheduleId)  chooseSchedule,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case CreateDiary():
return createDiary(_that.diary);case ChangeType():
return changeType(_that.type);case ChangeTitle():
return changeTitle(_that.title);case ChangeContent():
return changeContent(_that.content);case ChangeRating():
return changeRating(_that.rating);case ChangePhoto():
return changePhoto(_that.imgUrl);case ChangeCost():
return changeCost(_that.cost);case ChangePublic():
return changePublic(_that.isPublic);case ChooseSchedule():
return chooseSchedule(_that.scheduleId);case Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DiaryEntity diary)?  createDiary,TResult? Function( String type)?  changeType,TResult? Function( String title)?  changeTitle,TResult? Function( String content)?  changeContent,TResult? Function( double rating)?  changeRating,TResult? Function( String? imgUrl)?  changePhoto,TResult? Function( int? cost)?  changeCost,TResult? Function( bool isPublic)?  changePublic,TResult? Function( int? scheduleId)?  chooseSchedule,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case CreateDiary() when createDiary != null:
return createDiary(_that.diary);case ChangeType() when changeType != null:
return changeType(_that.type);case ChangeTitle() when changeTitle != null:
return changeTitle(_that.title);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case ChangeRating() when changeRating != null:
return changeRating(_that.rating);case ChangePhoto() when changePhoto != null:
return changePhoto(_that.imgUrl);case ChangeCost() when changeCost != null:
return changeCost(_that.cost);case ChangePublic() when changePublic != null:
return changePublic(_that.isPublic);case ChooseSchedule() when chooseSchedule != null:
return chooseSchedule(_that.scheduleId);case Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class CreateDiary implements NewDiaryEvent {
  const CreateDiary({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDiaryCopyWith<CreateDiary> get copyWith => _$CreateDiaryCopyWithImpl<CreateDiary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDiary&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'NewDiaryEvent.createDiary(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $CreateDiaryCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $CreateDiaryCopyWith(CreateDiary value, $Res Function(CreateDiary) _then) = _$CreateDiaryCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$CreateDiaryCopyWithImpl<$Res>
    implements $CreateDiaryCopyWith<$Res> {
  _$CreateDiaryCopyWithImpl(this._self, this._then);

  final CreateDiary _self;
  final $Res Function(CreateDiary) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(CreateDiary(
diary: null == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as DiaryEntity,
  ));
}

/// Create a copy of NewDiaryEvent
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


class ChangeType implements NewDiaryEvent {
  const ChangeType({required this.type});
  

 final  String type;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeTypeCopyWith<ChangeType> get copyWith => _$ChangeTypeCopyWithImpl<ChangeType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeType&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'NewDiaryEvent.changeType(type: $type)';
}


}

/// @nodoc
abstract mixin class $ChangeTypeCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangeTypeCopyWith(ChangeType value, $Res Function(ChangeType) _then) = _$ChangeTypeCopyWithImpl;
@useResult
$Res call({
 String type
});




}
/// @nodoc
class _$ChangeTypeCopyWithImpl<$Res>
    implements $ChangeTypeCopyWith<$Res> {
  _$ChangeTypeCopyWithImpl(this._self, this._then);

  final ChangeType _self;
  final $Res Function(ChangeType) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(ChangeType(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeTitle implements NewDiaryEvent {
  const ChangeTitle({required this.title});
  

 final  String title;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeTitleCopyWith<ChangeTitle> get copyWith => _$ChangeTitleCopyWithImpl<ChangeTitle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTitle&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'NewDiaryEvent.changeTitle(title: $title)';
}


}

/// @nodoc
abstract mixin class $ChangeTitleCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangeTitleCopyWith(ChangeTitle value, $Res Function(ChangeTitle) _then) = _$ChangeTitleCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$ChangeTitleCopyWithImpl<$Res>
    implements $ChangeTitleCopyWith<$Res> {
  _$ChangeTitleCopyWithImpl(this._self, this._then);

  final ChangeTitle _self;
  final $Res Function(ChangeTitle) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(ChangeTitle(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeContent implements NewDiaryEvent {
  const ChangeContent({required this.content});
  

 final  String content;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeContentCopyWith<ChangeContent> get copyWith => _$ChangeContentCopyWithImpl<ChangeContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeContent&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'NewDiaryEvent.changeContent(content: $content)';
}


}

/// @nodoc
abstract mixin class $ChangeContentCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangeContentCopyWith(ChangeContent value, $Res Function(ChangeContent) _then) = _$ChangeContentCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ChangeContentCopyWithImpl<$Res>
    implements $ChangeContentCopyWith<$Res> {
  _$ChangeContentCopyWithImpl(this._self, this._then);

  final ChangeContent _self;
  final $Res Function(ChangeContent) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(ChangeContent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeRating implements NewDiaryEvent {
  const ChangeRating({required this.rating});
  

 final  double rating;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeRatingCopyWith<ChangeRating> get copyWith => _$ChangeRatingCopyWithImpl<ChangeRating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeRating&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,rating);

@override
String toString() {
  return 'NewDiaryEvent.changeRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class $ChangeRatingCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangeRatingCopyWith(ChangeRating value, $Res Function(ChangeRating) _then) = _$ChangeRatingCopyWithImpl;
@useResult
$Res call({
 double rating
});




}
/// @nodoc
class _$ChangeRatingCopyWithImpl<$Res>
    implements $ChangeRatingCopyWith<$Res> {
  _$ChangeRatingCopyWithImpl(this._self, this._then);

  final ChangeRating _self;
  final $Res Function(ChangeRating) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rating = null,}) {
  return _then(ChangeRating(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class ChangePhoto implements NewDiaryEvent {
  const ChangePhoto({required this.imgUrl});
  

 final  String? imgUrl;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePhotoCopyWith<ChangePhoto> get copyWith => _$ChangePhotoCopyWithImpl<ChangePhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePhoto&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
}


@override
int get hashCode => Object.hash(runtimeType,imgUrl);

@override
String toString() {
  return 'NewDiaryEvent.changePhoto(imgUrl: $imgUrl)';
}


}

/// @nodoc
abstract mixin class $ChangePhotoCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangePhotoCopyWith(ChangePhoto value, $Res Function(ChangePhoto) _then) = _$ChangePhotoCopyWithImpl;
@useResult
$Res call({
 String? imgUrl
});




}
/// @nodoc
class _$ChangePhotoCopyWithImpl<$Res>
    implements $ChangePhotoCopyWith<$Res> {
  _$ChangePhotoCopyWithImpl(this._self, this._then);

  final ChangePhoto _self;
  final $Res Function(ChangePhoto) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imgUrl = freezed,}) {
  return _then(ChangePhoto(
imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChangeCost implements NewDiaryEvent {
  const ChangeCost({required this.cost});
  

 final  int? cost;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCostCopyWith<ChangeCost> get copyWith => _$ChangeCostCopyWithImpl<ChangeCost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCost&&(identical(other.cost, cost) || other.cost == cost));
}


@override
int get hashCode => Object.hash(runtimeType,cost);

@override
String toString() {
  return 'NewDiaryEvent.changeCost(cost: $cost)';
}


}

/// @nodoc
abstract mixin class $ChangeCostCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangeCostCopyWith(ChangeCost value, $Res Function(ChangeCost) _then) = _$ChangeCostCopyWithImpl;
@useResult
$Res call({
 int? cost
});




}
/// @nodoc
class _$ChangeCostCopyWithImpl<$Res>
    implements $ChangeCostCopyWith<$Res> {
  _$ChangeCostCopyWithImpl(this._self, this._then);

  final ChangeCost _self;
  final $Res Function(ChangeCost) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cost = freezed,}) {
  return _then(ChangeCost(
cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ChangePublic implements NewDiaryEvent {
  const ChangePublic({required this.isPublic});
  

 final  bool isPublic;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePublicCopyWith<ChangePublic> get copyWith => _$ChangePublicCopyWithImpl<ChangePublic>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePublic&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic));
}


@override
int get hashCode => Object.hash(runtimeType,isPublic);

@override
String toString() {
  return 'NewDiaryEvent.changePublic(isPublic: $isPublic)';
}


}

/// @nodoc
abstract mixin class $ChangePublicCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChangePublicCopyWith(ChangePublic value, $Res Function(ChangePublic) _then) = _$ChangePublicCopyWithImpl;
@useResult
$Res call({
 bool isPublic
});




}
/// @nodoc
class _$ChangePublicCopyWithImpl<$Res>
    implements $ChangePublicCopyWith<$Res> {
  _$ChangePublicCopyWithImpl(this._self, this._then);

  final ChangePublic _self;
  final $Res Function(ChangePublic) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPublic = null,}) {
  return _then(ChangePublic(
isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChooseSchedule implements NewDiaryEvent {
  const ChooseSchedule({required this.scheduleId});
  

 final  int? scheduleId;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChooseScheduleCopyWith<ChooseSchedule> get copyWith => _$ChooseScheduleCopyWithImpl<ChooseSchedule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChooseSchedule&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId));
}


@override
int get hashCode => Object.hash(runtimeType,scheduleId);

@override
String toString() {
  return 'NewDiaryEvent.chooseSchedule(scheduleId: $scheduleId)';
}


}

/// @nodoc
abstract mixin class $ChooseScheduleCopyWith<$Res> implements $NewDiaryEventCopyWith<$Res> {
  factory $ChooseScheduleCopyWith(ChooseSchedule value, $Res Function(ChooseSchedule) _then) = _$ChooseScheduleCopyWithImpl;
@useResult
$Res call({
 int? scheduleId
});




}
/// @nodoc
class _$ChooseScheduleCopyWithImpl<$Res>
    implements $ChooseScheduleCopyWith<$Res> {
  _$ChooseScheduleCopyWithImpl(this._self, this._then);

  final ChooseSchedule _self;
  final $Res Function(ChooseSchedule) _then;

/// Create a copy of NewDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scheduleId = freezed,}) {
  return _then(ChooseSchedule(
scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Reset implements NewDiaryEvent {
  const Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewDiaryEvent.reset()';
}


}




// dart format on
