// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEntity {

 int get id; String get title; String get description; String get imagePath;
/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingEntityCopyWith<OnboardingEntity> get copyWith => _$OnboardingEntityCopyWithImpl<OnboardingEntity>(this as OnboardingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,imagePath);

@override
String toString() {
  return 'OnboardingEntity(id: $id, title: $title, description: $description, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $OnboardingEntityCopyWith<$Res>  {
  factory $OnboardingEntityCopyWith(OnboardingEntity value, $Res Function(OnboardingEntity) _then) = _$OnboardingEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String imagePath
});




}
/// @nodoc
class _$OnboardingEntityCopyWithImpl<$Res>
    implements $OnboardingEntityCopyWith<$Res> {
  _$OnboardingEntityCopyWithImpl(this._self, this._then);

  final OnboardingEntity _self;
  final $Res Function(OnboardingEntity) _then;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imagePath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingEntity].
extension OnboardingEntityPatterns on OnboardingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingEntity value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String imagePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String imagePath)  $default,) {final _that = this;
switch (_that) {
case _OnboardingEntity():
return $default(_that.id,_that.title,_that.description,_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String imagePath)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingEntity implements OnboardingEntity {
  const _OnboardingEntity({required this.id, required this.title, required this.description, required this.imagePath});
  

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String imagePath;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingEntityCopyWith<_OnboardingEntity> get copyWith => __$OnboardingEntityCopyWithImpl<_OnboardingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,imagePath);

@override
String toString() {
  return 'OnboardingEntity(id: $id, title: $title, description: $description, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$OnboardingEntityCopyWith<$Res> implements $OnboardingEntityCopyWith<$Res> {
  factory _$OnboardingEntityCopyWith(_OnboardingEntity value, $Res Function(_OnboardingEntity) _then) = __$OnboardingEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String imagePath
});




}
/// @nodoc
class __$OnboardingEntityCopyWithImpl<$Res>
    implements _$OnboardingEntityCopyWith<$Res> {
  __$OnboardingEntityCopyWithImpl(this._self, this._then);

  final _OnboardingEntity _self;
  final $Res Function(_OnboardingEntity) _then;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imagePath = null,}) {
  return _then(_OnboardingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
