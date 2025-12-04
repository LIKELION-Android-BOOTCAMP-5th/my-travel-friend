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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateDiary value)?  updateDiary,TResult Function( ResetEditDiary value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateDiary() when updateDiary != null:
return updateDiary(_that);case ResetEditDiary() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateDiary value)  updateDiary,required TResult Function( ResetEditDiary value)  reset,}){
final _that = this;
switch (_that) {
case UpdateDiary():
return updateDiary(_that);case ResetEditDiary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateDiary value)?  updateDiary,TResult? Function( ResetEditDiary value)?  reset,}){
final _that = this;
switch (_that) {
case UpdateDiary() when updateDiary != null:
return updateDiary(_that);case ResetEditDiary() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DiaryEntity diary)?  updateDiary,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateDiary() when updateDiary != null:
return updateDiary(_that.diary);case ResetEditDiary() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DiaryEntity diary)  updateDiary,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case UpdateDiary():
return updateDiary(_that.diary);case ResetEditDiary():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DiaryEntity diary)?  updateDiary,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case UpdateDiary() when updateDiary != null:
return updateDiary(_that.diary);case ResetEditDiary() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class UpdateDiary implements EditDiaryEvent {
  const UpdateDiary({required this.diary});
  

 final  DiaryEntity diary;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDiaryCopyWith<UpdateDiary> get copyWith => _$UpdateDiaryCopyWithImpl<UpdateDiary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDiary&&(identical(other.diary, diary) || other.diary == diary));
}


@override
int get hashCode => Object.hash(runtimeType,diary);

@override
String toString() {
  return 'EditDiaryEvent.updateDiary(diary: $diary)';
}


}

/// @nodoc
abstract mixin class $UpdateDiaryCopyWith<$Res> implements $EditDiaryEventCopyWith<$Res> {
  factory $UpdateDiaryCopyWith(UpdateDiary value, $Res Function(UpdateDiary) _then) = _$UpdateDiaryCopyWithImpl;
@useResult
$Res call({
 DiaryEntity diary
});


$DiaryEntityCopyWith<$Res> get diary;

}
/// @nodoc
class _$UpdateDiaryCopyWithImpl<$Res>
    implements $UpdateDiaryCopyWith<$Res> {
  _$UpdateDiaryCopyWithImpl(this._self, this._then);

  final UpdateDiary _self;
  final $Res Function(UpdateDiary) _then;

/// Create a copy of EditDiaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diary = null,}) {
  return _then(UpdateDiary(
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


class ResetEditDiary implements EditDiaryEvent {
  const ResetEditDiary();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetEditDiary);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditDiaryEvent.reset()';
}


}




// dart format on
