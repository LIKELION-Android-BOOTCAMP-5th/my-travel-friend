// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionEvent()';
}


}

/// @nodoc
class $PermissionEventCopyWith<$Res>  {
$PermissionEventCopyWith(PermissionEvent _, $Res Function(PermissionEvent) __);
}


/// Adds pattern-matching-related methods to [PermissionEvent].
extension PermissionEventPatterns on PermissionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPermission value)?  loadPermission,TResult Function( Toggled value)?  toggled,TResult Function( OpenSystem value)?  openSystem,TResult Function( Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPermission() when loadPermission != null:
return loadPermission(_that);case Toggled() when toggled != null:
return toggled(_that);case OpenSystem() when openSystem != null:
return openSystem(_that);case Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPermission value)  loadPermission,required TResult Function( Toggled value)  toggled,required TResult Function( OpenSystem value)  openSystem,required TResult Function( Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case LoadPermission():
return loadPermission(_that);case Toggled():
return toggled(_that);case OpenSystem():
return openSystem(_that);case Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPermission value)?  loadPermission,TResult? Function( Toggled value)?  toggled,TResult? Function( OpenSystem value)?  openSystem,TResult? Function( Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case LoadPermission() when loadPermission != null:
return loadPermission(_that);case Toggled() when toggled != null:
return toggled(_that);case OpenSystem() when openSystem != null:
return openSystem(_that);case Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPermission,TResult Function( AppPermissionType type)?  toggled,TResult Function()?  openSystem,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPermission() when loadPermission != null:
return loadPermission();case Toggled() when toggled != null:
return toggled(_that.type);case OpenSystem() when openSystem != null:
return openSystem();case Refresh() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPermission,required TResult Function( AppPermissionType type)  toggled,required TResult Function()  openSystem,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case LoadPermission():
return loadPermission();case Toggled():
return toggled(_that.type);case OpenSystem():
return openSystem();case Refresh():
return refresh();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPermission,TResult? Function( AppPermissionType type)?  toggled,TResult? Function()?  openSystem,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case LoadPermission() when loadPermission != null:
return loadPermission();case Toggled() when toggled != null:
return toggled(_that.type);case OpenSystem() when openSystem != null:
return openSystem();case Refresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class LoadPermission implements PermissionEvent {
  const LoadPermission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionEvent.loadPermission()';
}


}




/// @nodoc


class Toggled implements PermissionEvent {
  const Toggled(this.type);
  

 final  AppPermissionType type;

/// Create a copy of PermissionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggledCopyWith<Toggled> get copyWith => _$ToggledCopyWithImpl<Toggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Toggled&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'PermissionEvent.toggled(type: $type)';
}


}

/// @nodoc
abstract mixin class $ToggledCopyWith<$Res> implements $PermissionEventCopyWith<$Res> {
  factory $ToggledCopyWith(Toggled value, $Res Function(Toggled) _then) = _$ToggledCopyWithImpl;
@useResult
$Res call({
 AppPermissionType type
});




}
/// @nodoc
class _$ToggledCopyWithImpl<$Res>
    implements $ToggledCopyWith<$Res> {
  _$ToggledCopyWithImpl(this._self, this._then);

  final Toggled _self;
  final $Res Function(Toggled) _then;

/// Create a copy of PermissionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(Toggled(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppPermissionType,
  ));
}


}

/// @nodoc


class OpenSystem implements PermissionEvent {
  const OpenSystem();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenSystem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionEvent.openSystem()';
}


}




/// @nodoc


class Refresh implements PermissionEvent {
  const Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionEvent.refresh()';
}


}




// dart format on
