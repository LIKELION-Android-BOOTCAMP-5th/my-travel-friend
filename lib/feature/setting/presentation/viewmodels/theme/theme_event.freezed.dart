// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent()';
}


}

/// @nodoc
class $ThemeEventCopyWith<$Res>  {
$ThemeEventCopyWith(ThemeEvent _, $Res Function(ThemeEvent) __);
}


/// Adds pattern-matching-related methods to [ThemeEvent].
extension ThemeEventPatterns on ThemeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTheme value)?  loadTheme,TResult Function( UpdateTheme value)?  updateTheme,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTheme() when loadTheme != null:
return loadTheme(_that);case UpdateTheme() when updateTheme != null:
return updateTheme(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTheme value)  loadTheme,required TResult Function( UpdateTheme value)  updateTheme,}){
final _that = this;
switch (_that) {
case LoadTheme():
return loadTheme(_that);case UpdateTheme():
return updateTheme(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTheme value)?  loadTheme,TResult? Function( UpdateTheme value)?  updateTheme,}){
final _that = this;
switch (_that) {
case LoadTheme() when loadTheme != null:
return loadTheme(_that);case UpdateTheme() when updateTheme != null:
return updateTheme(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTheme,TResult Function( AppThemeType type)?  updateTheme,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTheme() when loadTheme != null:
return loadTheme();case UpdateTheme() when updateTheme != null:
return updateTheme(_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTheme,required TResult Function( AppThemeType type)  updateTheme,}) {final _that = this;
switch (_that) {
case LoadTheme():
return loadTheme();case UpdateTheme():
return updateTheme(_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTheme,TResult? Function( AppThemeType type)?  updateTheme,}) {final _that = this;
switch (_that) {
case LoadTheme() when loadTheme != null:
return loadTheme();case UpdateTheme() when updateTheme != null:
return updateTheme(_that.type);case _:
  return null;

}
}

}

/// @nodoc


class LoadTheme implements ThemeEvent {
  const LoadTheme();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTheme);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent.loadTheme()';
}


}




/// @nodoc


class UpdateTheme implements ThemeEvent {
  const UpdateTheme(this.type);
  

 final  AppThemeType type;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateThemeCopyWith<UpdateTheme> get copyWith => _$UpdateThemeCopyWithImpl<UpdateTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTheme&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'ThemeEvent.updateTheme(type: $type)';
}


}

/// @nodoc
abstract mixin class $UpdateThemeCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory $UpdateThemeCopyWith(UpdateTheme value, $Res Function(UpdateTheme) _then) = _$UpdateThemeCopyWithImpl;
@useResult
$Res call({
 AppThemeType type
});




}
/// @nodoc
class _$UpdateThemeCopyWithImpl<$Res>
    implements $UpdateThemeCopyWith<$Res> {
  _$UpdateThemeCopyWithImpl(this._self, this._then);

  final UpdateTheme _self;
  final $Res Function(UpdateTheme) _then;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(UpdateTheme(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppThemeType,
  ));
}


}

// dart format on
