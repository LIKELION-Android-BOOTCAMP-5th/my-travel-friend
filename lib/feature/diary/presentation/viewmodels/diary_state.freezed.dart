// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryState {

// 조회 정보
 int get tripId; int? get userId; bool get isMyDiaries;// 페이지 상태
 DiaryPageState get pageState;
/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryStateCopyWith<DiaryState> get copyWith => _$DiaryStateCopyWithImpl<DiaryState>(this as DiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isMyDiaries, isMyDiaries) || other.isMyDiaries == isMyDiaries)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,isMyDiaries,pageState);

@override
String toString() {
  return 'DiaryState(tripId: $tripId, userId: $userId, isMyDiaries: $isMyDiaries, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $DiaryStateCopyWith<$Res>  {
  factory $DiaryStateCopyWith(DiaryState value, $Res Function(DiaryState) _then) = _$DiaryStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int? userId, bool isMyDiaries, DiaryPageState pageState
});


$DiaryPageStateCopyWith<$Res> get pageState;

}
/// @nodoc
class _$DiaryStateCopyWithImpl<$Res>
    implements $DiaryStateCopyWith<$Res> {
  _$DiaryStateCopyWithImpl(this._self, this._then);

  final DiaryState _self;
  final $Res Function(DiaryState) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = freezed,Object? isMyDiaries = null,Object? pageState = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,isMyDiaries: null == isMyDiaries ? _self.isMyDiaries : isMyDiaries // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as DiaryPageState,
  ));
}
/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryPageStateCopyWith<$Res> get pageState {
  
  return $DiaryPageStateCopyWith<$Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiaryState].
extension DiaryStatePatterns on DiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryState value)  $default,){
final _that = this;
switch (_that) {
case _DiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int? userId,  bool isMyDiaries,  DiaryPageState pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int? userId,  bool isMyDiaries,  DiaryPageState pageState)  $default,) {final _that = this;
switch (_that) {
case _DiaryState():
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int? userId,  bool isMyDiaries,  DiaryPageState pageState)?  $default,) {final _that = this;
switch (_that) {
case _DiaryState() when $default != null:
return $default(_that.tripId,_that.userId,_that.isMyDiaries,_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryState implements DiaryState {
  const _DiaryState({this.tripId = 0, this.userId, this.isMyDiaries = false, this.pageState = const DiaryPageState.initial()});
  

// 조회 정보
@override@JsonKey() final  int tripId;
@override final  int? userId;
@override@JsonKey() final  bool isMyDiaries;
// 페이지 상태
@override@JsonKey() final  DiaryPageState pageState;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryStateCopyWith<_DiaryState> get copyWith => __$DiaryStateCopyWithImpl<_DiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isMyDiaries, isMyDiaries) || other.isMyDiaries == isMyDiaries)&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,isMyDiaries,pageState);

@override
String toString() {
  return 'DiaryState(tripId: $tripId, userId: $userId, isMyDiaries: $isMyDiaries, pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$DiaryStateCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory _$DiaryStateCopyWith(_DiaryState value, $Res Function(_DiaryState) _then) = __$DiaryStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int? userId, bool isMyDiaries, DiaryPageState pageState
});


@override $DiaryPageStateCopyWith<$Res> get pageState;

}
/// @nodoc
class __$DiaryStateCopyWithImpl<$Res>
    implements _$DiaryStateCopyWith<$Res> {
  __$DiaryStateCopyWithImpl(this._self, this._then);

  final _DiaryState _self;
  final $Res Function(_DiaryState) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = freezed,Object? isMyDiaries = null,Object? pageState = null,}) {
  return _then(_DiaryState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,isMyDiaries: null == isMyDiaries ? _self.isMyDiaries : isMyDiaries // ignore: cast_nullable_to_non_nullable
as bool,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as DiaryPageState,
  ));
}

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryPageStateCopyWith<$Res> get pageState {
  
  return $DiaryPageStateCopyWith<$Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
