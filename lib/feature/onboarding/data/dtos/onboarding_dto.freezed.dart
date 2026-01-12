// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingDTO {

 int get id; String get title; String get description;@JsonKey(name: 'image_path') String get imagePath; int get index;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of OnboardingDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingDTOCopyWith<OnboardingDTO> get copyWith => _$OnboardingDTOCopyWithImpl<OnboardingDTO>(this as OnboardingDTO, _$identity);

  /// Serializes this OnboardingDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.index, index) || other.index == index)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imagePath,index,isActive);

@override
String toString() {
  return 'OnboardingDTO(id: $id, title: $title, description: $description, imagePath: $imagePath, index: $index, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $OnboardingDTOCopyWith<$Res>  {
  factory $OnboardingDTOCopyWith(OnboardingDTO value, $Res Function(OnboardingDTO) _then) = _$OnboardingDTOCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'image_path') String imagePath, int index,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$OnboardingDTOCopyWithImpl<$Res>
    implements $OnboardingDTOCopyWith<$Res> {
  _$OnboardingDTOCopyWithImpl(this._self, this._then);

  final OnboardingDTO _self;
  final $Res Function(OnboardingDTO) _then;

/// Create a copy of OnboardingDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imagePath = null,Object? index = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingDTO].
extension OnboardingDTOPatterns on OnboardingDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingDTO value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingDTO value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'image_path')  String imagePath,  int index, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingDTO() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imagePath,_that.index,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'image_path')  String imagePath,  int index, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _OnboardingDTO():
return $default(_that.id,_that.title,_that.description,_that.imagePath,_that.index,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description, @JsonKey(name: 'image_path')  String imagePath,  int index, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingDTO() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imagePath,_that.index,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingDTO extends OnboardingDTO {
  const _OnboardingDTO({required this.id, required this.title, required this.description, @JsonKey(name: 'image_path') required this.imagePath, required this.index, @JsonKey(name: 'is_active') required this.isActive}): super._();
  factory _OnboardingDTO.fromJson(Map<String, dynamic> json) => _$OnboardingDTOFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'image_path') final  String imagePath;
@override final  int index;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of OnboardingDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingDTOCopyWith<_OnboardingDTO> get copyWith => __$OnboardingDTOCopyWithImpl<_OnboardingDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.index, index) || other.index == index)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imagePath,index,isActive);

@override
String toString() {
  return 'OnboardingDTO(id: $id, title: $title, description: $description, imagePath: $imagePath, index: $index, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$OnboardingDTOCopyWith<$Res> implements $OnboardingDTOCopyWith<$Res> {
  factory _$OnboardingDTOCopyWith(_OnboardingDTO value, $Res Function(_OnboardingDTO) _then) = __$OnboardingDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'image_path') String imagePath, int index,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$OnboardingDTOCopyWithImpl<$Res>
    implements _$OnboardingDTOCopyWith<$Res> {
  __$OnboardingDTOCopyWithImpl(this._self, this._then);

  final _OnboardingDTO _self;
  final $Res Function(_OnboardingDTO) _then;

/// Create a copy of OnboardingDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imagePath = null,Object? index = null,Object? isActive = null,}) {
  return _then(_OnboardingDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
