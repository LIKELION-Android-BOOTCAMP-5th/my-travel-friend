// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_diary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditDiaryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDiaryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditDiaryEvent()';
}


}

/// @nodoc
class $EditDiaryEventCopyWith<$Res>  {
$EditDiaryEventCopyWith(EditDiaryEvent _, $Res Function(EditDiaryEvent) __);
}


/// Adds pattern-matching-related methods to [EditDiaryEvent].
extension EditDiaryEventPatterns on EditDiaryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDiary value)?  loadDiary,TResult Function( UpdateDiary value)?  updateDiary,TResult Function( ChangeType value)?  changeType,TResult Function( ChangeTitle value)?  changeTitle,TResult Function( ChangeContent value)?  changeContent,TResult Function( ChangeRating value)?  changeRating,TResult Function( SelectImg value)?  selectImg,TResult Function( RemoveImg value)?  removeImg,TResult Function( ChangeCost value)?  changeCost,TResult Function( ChangeCurrency value)?  changeCurrency,TResult Function( ChangePayment value)?  changePayment,TResult Function( ChangePublic value)?  changePublic,TResult Function( Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDiary() when loadDiary != null:
return loadDiary(_that);case UpdateDiary() when updateDiary != null:
return updateDiary(_that);case ChangeType() when changeType != null:
return changeType(_that);case ChangeTitle() when changeTitle != null:
return changeTitle(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case ChangeRating() when changeRating != null:
return changeRating(_that);case SelectImg() when selectImg != null:
return selectImg(_that);case RemoveImg() when removeImg != null:
return removeImg(_that);case ChangeCost() when changeCost != null:
return changeCost(_that);case ChangeCurrency() when changeCurrency != null:
return changeCurrency(_that);case ChangePayment() when changePayment != null:
return changePayment(_that);case ChangePublic() when changePublic != null:
return changePublic(_that);case Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDiary value)  loadDiary,required TResult Function( UpdateDiary value)  updateDiary,required TResult Function( ChangeType value)  changeType,required TResult Function( ChangeTitle value)  changeTitle,required TResult Function( ChangeContent value)  changeContent,required TResult Function( ChangeRating value)  changeRating,required TResult Function( SelectImg value)  selectImg,required TResult Function( RemoveImg value)  removeImg,required TResult Function( ChangeCost value)  changeCost,required TResult Function( ChangeCurrency value)  changeCurrency,required TResult Function( ChangePayment value)  changePayment,required TResult Function( ChangePublic value)  changePublic,required TResult Function( Reset value)  reset,}){
final _that = this;
switch (_that) {
case LoadDiary():
return loadDiary(_that);case UpdateDiary():
return updateDiary(_that);case ChangeType():
return changeType(_that);case ChangeTitle():
return changeTitle(_that);case ChangeContent():
return changeContent(_that);case ChangeRating():
return changeRating(_that);case SelectImg():
return selectImg(_that);case RemoveImg():
return removeImg(_that);case ChangeCost():
return changeCost(_that);case ChangeCurrency():
return changeCurrency(_that);case ChangePayment():
return changePayment(_that);case ChangePublic():
return changePublic(_that);case Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDiary value)?  loadDiary,TResult? Function( UpdateDiary value)?  updateDiary,TResult? Function( ChangeType value)?  changeType,TResult? Function( ChangeTitle value)?  changeTitle,TResult? Function( ChangeContent value)?  changeContent,TResult? Function( ChangeRating value)?  changeRating,TResult? Function( SelectImg value)?  selectImg,TResult? Function( RemoveImg value)?  removeImg,TResult? Function( ChangeCost value)?  changeCost,TResult? Function( ChangeCurrency value)?  changeCurrency,TResult? Function( ChangePayment value)?  changePayment,TResult? Function( ChangePublic value)?  changePublic,TResult? Function( Reset value)?  reset,}){
final _that = this;
switch (_that) {
case LoadDiary() when loadDiary != null:
return loadDiary(_that);case UpdateDiary() when updateDiary != null:
return updateDiary(_that);case ChangeType() when changeType != null:
return changeType(_that);case ChangeTitle() when changeTitle != null:
return changeTitle(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case ChangeRating() when changeRating != null:
return changeRating(_that);case SelectImg() when selectImg != null:
return selectImg(_that);case RemoveImg() when removeImg != null:
return removeImg(_that);case ChangeCost() when changeCost != null:
return changeCost(_that);case ChangeCurrency() when changeCurrency != null:
return changeCurrency(_that);case ChangePayment() when changePayment != null:
return changePayment(_that);case ChangePublic() when changePublic != null:
return changePublic(_that);case Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DiaryEntity diary)?  loadDiary,TResult Function()?  updateDiary,TResult Function( String type)?  changeType,TResult Function( String title)?  changeTitle,TResult Function( String content)?  changeContent,TResult Function( double rating)?  changeRating,TResult Function( File file)?  selectImg,TResult Function()?  removeImg,TResult Function( int? cost)?  changeCost,TResult Function( String currency)?  changeCurrency,TResult Function( String payment)?  changePayment,TResult Function( bool isPublic)?  changePublic,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDiary() when loadDiary != null:
return loadDiary(_that.diary);case UpdateDiary() when updateDiary != null:
return updateDiary();case ChangeType() when changeType != null:
return changeType(_that.type);case ChangeTitle() when changeTitle != null:
return changeTitle(_that.title);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case ChangeRating() when changeRating != null:
return changeRating(_that.rating);case SelectImg() when selectImg != null:
return selectImg(_that.file);case RemoveImg() when removeImg != null:
return removeImg();case ChangeCost() when changeCost != null:
return changeCost(_that.cost);case ChangeCurrency() when changeCurrency != null:
return changeCurrency(_that.currency);case ChangePayment() when changePayment != null:
return changePayment(_that.payment);case ChangePublic() when changePublic != null:
return changePublic(_that.isPublic);case Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DiaryEntity diary)  loadDiary,required TResult Function()  updateDiary,required TResult Function( String type)  changeType,required TResult Function( String title)  changeTitle,required TResult Function( String content)  changeContent,required TResult Function( double rating)  changeRating,required TResult Function( File file)  selectImg,required TResult Function()  removeImg,required TResult Function( int? cost)  changeCost,required TResult Function( String currency)  changeCurrency,required TResult Function( String payment)  changePayment,required TResult Function( bool isPublic)  changePublic,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case LoadDiary():
return loadDiary(_that.diary);case UpdateDiary():
return updateDiary();case ChangeType():
return changeType(_that.type);case ChangeTitle():
return changeTitle(_that.title);case ChangeContent():
return changeContent(_that.content);case ChangeRating():
return changeRating(_that.rating);case SelectImg():
return selectImg(_that.file);case RemoveImg():
return removeImg();case ChangeCost():
return changeCost(_that.cost);case ChangeCurrency():
return changeCurrency(_that.currency);case ChangePayment():
return changePayment(_that.payment);case ChangePublic():
return changePublic(_that.isPublic);case Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DiaryEntity diary)?  loadDiary,TResult? Function()?  updateDiary,TResult? Function( String type)?  changeType,TResult? Function( String title)?  changeTitle,TResult? Function( String content)?  changeContent,TResult? Function( double rating)?  changeRating,TResult? Function( File file)?  selectImg,TResult? Function()?  removeImg,TResult? Function( int? cost)?  changeCost,TResult? Function( String currency)?  changeCurrency,TResult? Function( String payment)?  changePayment,TResult? Function( bool isPublic)?  changePublic,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case LoadDiary() when loadDiary != null:
return loadDiary(_that.diary);case UpdateDiary() when updateDiary != null:
return updateDiary();case ChangeType() when changeType != null:
return changeType(_that.type);case ChangeTitle() when changeTitle != null:
return changeTitle(_that.title);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case ChangeRating() when changeRating != null:
return changeRating(_that.rating);case SelectImg() when selectImg != null:
return selectImg(_that.file);case RemoveImg() when removeImg != null:
return removeImg();case ChangeCost() when changeCost != null:
return changeCost(_that.cost);case ChangeCurrency() when changeCurrency != null:
return changeCurrency(_that.currency);case ChangePayment() when changePayment != null:
return changePayment(_that.payment);case ChangePublic() when changePublic != null:
return changePublic(_that.isPublic);case Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class LoadDiary implements EditDiaryEvent {
  const LoadDiary({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDiaryCopyWith<LoadDiary> get copyWith => _$LoadDiaryCopyWithImpl<LoadDiary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDiary&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'EditDiaryEvent.loadDiary(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $LoadDiaryCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
  factory $LoadDiaryCopyWith(LoadDiary value, $Res Function(LoadDiary) _then) = _$LoadDiaryCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$LoadDiaryCopyWithImpl<$Res>
    implements $LoadDiaryCopyWith<$Res> {
  _$LoadDiaryCopyWithImpl(this._self, this._then);

  final LoadDiary _self;
  final $Res Function(LoadDiary) _then;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(LoadDiary(
diary: null == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as DiaryEntity,
  ));
}

/// Create a copy of EditDiaryEvent
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


class UpdateDiary implements EditDiaryEvent {
  const UpdateDiary();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDiary);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditDiaryEvent.updateDiary()';
}


}




/// @nodoc


class ChangeType implements EditDiaryEvent {
  const ChangeType({required this.type});
  

 final  String type;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changeType(type: $type)';
}


}

/// @nodoc
abstract mixin class $ChangeTypeCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(ChangeType(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeTitle implements EditDiaryEvent {
  const ChangeTitle({required this.title});
  

 final  String title;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changeTitle(title: $title)';
}


}

/// @nodoc
abstract mixin class $ChangeTitleCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(ChangeTitle(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeContent implements EditDiaryEvent {
  const ChangeContent({required this.content});
  

 final  String content;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changeContent(content: $content)';
}


}

/// @nodoc
abstract mixin class $ChangeContentCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(ChangeContent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeRating implements EditDiaryEvent {
  const ChangeRating({required this.rating});
  

 final  double rating;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changeRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class $ChangeRatingCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rating = null,}) {
  return _then(ChangeRating(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SelectImg implements EditDiaryEvent {
  const SelectImg({required this.file});
  

 final  File file;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectImgCopyWith<SelectImg> get copyWith => _$SelectImgCopyWithImpl<SelectImg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectImg&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'EditDiaryEvent.selectImg(file: $file)';
}


}

/// @nodoc
abstract mixin class $SelectImgCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
  factory $SelectImgCopyWith(SelectImg value, $Res Function(SelectImg) _then) = _$SelectImgCopyWithImpl;
@useResult
$Res call({
 File file
});




}
/// @nodoc
class _$SelectImgCopyWithImpl<$Res>
    implements $SelectImgCopyWith<$Res> {
  _$SelectImgCopyWithImpl(this._self, this._then);

  final SelectImg _self;
  final $Res Function(SelectImg) _then;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(SelectImg(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class RemoveImg implements EditDiaryEvent {
  const RemoveImg();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveImg);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditDiaryEvent.removeImg()';
}


}




/// @nodoc


class ChangeCost implements EditDiaryEvent {
  const ChangeCost({required this.cost});
  

 final  int? cost;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changeCost(cost: $cost)';
}


}

/// @nodoc
abstract mixin class $ChangeCostCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cost = freezed,}) {
  return _then(ChangeCost(
cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ChangeCurrency implements EditDiaryEvent {
  const ChangeCurrency({required this.currency});
  

 final  String currency;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCurrencyCopyWith<ChangeCurrency> get copyWith => _$ChangeCurrencyCopyWithImpl<ChangeCurrency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCurrency&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,currency);

@override
String toString() {
  return 'EditDiaryEvent.changeCurrency(currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ChangeCurrencyCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
  factory $ChangeCurrencyCopyWith(ChangeCurrency value, $Res Function(ChangeCurrency) _then) = _$ChangeCurrencyCopyWithImpl;
@useResult
$Res call({
 String currency
});




}
/// @nodoc
class _$ChangeCurrencyCopyWithImpl<$Res>
    implements $ChangeCurrencyCopyWith<$Res> {
  _$ChangeCurrencyCopyWithImpl(this._self, this._then);

  final ChangeCurrency _self;
  final $Res Function(ChangeCurrency) _then;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currency = null,}) {
  return _then(ChangeCurrency(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangePayment implements EditDiaryEvent {
  const ChangePayment({required this.payment});
  

 final  String payment;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePaymentCopyWith<ChangePayment> get copyWith => _$ChangePaymentCopyWithImpl<ChangePayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePayment&&(identical(other.payment, payment) || other.payment == payment));
}


@override
int get hashCode => Object.hash(runtimeType,payment);

@override
String toString() {
  return 'EditDiaryEvent.changePayment(payment: $payment)';
}


}

/// @nodoc
abstract mixin class $ChangePaymentCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
  factory $ChangePaymentCopyWith(ChangePayment value, $Res Function(ChangePayment) _then) = _$ChangePaymentCopyWithImpl;
@useResult
$Res call({
 String payment
});




}
/// @nodoc
class _$ChangePaymentCopyWithImpl<$Res>
    implements $ChangePaymentCopyWith<$Res> {
  _$ChangePaymentCopyWithImpl(this._self, this._then);

  final ChangePayment _self;
  final $Res Function(ChangePayment) _then;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payment = null,}) {
  return _then(ChangePayment(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangePublic implements EditDiaryEvent {
  const ChangePublic({required this.isPublic});
  

 final  bool isPublic;

/// Create a copy of EditDiaryEvent
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
  return 'EditDiaryEvent.changePublic(isPublic: $isPublic)';
}


}

/// @nodoc
abstract mixin class $ChangePublicCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
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

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPublic = null,}) {
  return _then(ChangePublic(
isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Reset implements EditDiaryEvent {
  const Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditDiaryEvent.reset()';
}


}




// dart format on
