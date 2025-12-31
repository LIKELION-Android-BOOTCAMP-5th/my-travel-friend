// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_setting_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WidgetSettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetSettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WidgetSettingsEvent()';
}


}

/// @nodoc
class $WidgetSettingsEventCopyWith<$Res>  {
$WidgetSettingsEventCopyWith(WidgetSettingsEvent _, $Res Function(WidgetSettingsEvent) __);
}


/// Adds pattern-matching-related methods to [WidgetSettingsEvent].
extension WidgetSettingsEventPatterns on WidgetSettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadSetting value)?  loadSetting,TResult Function( ChangeTheme value)?  changeTheme,TResult Function( ToggleSystemTheme value)?  toggleSystemTheme,TResult Function( ToggleAutoSelect value)?  toggleAutoSelect,TResult Function( SelectTrip value)?  selectTrip,TResult Function( Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadSetting() when loadSetting != null:
return loadSetting(_that);case ChangeTheme() when changeTheme != null:
return changeTheme(_that);case ToggleSystemTheme() when toggleSystemTheme != null:
return toggleSystemTheme(_that);case ToggleAutoSelect() when toggleAutoSelect != null:
return toggleAutoSelect(_that);case SelectTrip() when selectTrip != null:
return selectTrip(_that);case Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadSetting value)  loadSetting,required TResult Function( ChangeTheme value)  changeTheme,required TResult Function( ToggleSystemTheme value)  toggleSystemTheme,required TResult Function( ToggleAutoSelect value)  toggleAutoSelect,required TResult Function( SelectTrip value)  selectTrip,required TResult Function( Save value)  save,}){
final _that = this;
switch (_that) {
case LoadSetting():
return loadSetting(_that);case ChangeTheme():
return changeTheme(_that);case ToggleSystemTheme():
return toggleSystemTheme(_that);case ToggleAutoSelect():
return toggleAutoSelect(_that);case SelectTrip():
return selectTrip(_that);case Save():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadSetting value)?  loadSetting,TResult? Function( ChangeTheme value)?  changeTheme,TResult? Function( ToggleSystemTheme value)?  toggleSystemTheme,TResult? Function( ToggleAutoSelect value)?  toggleAutoSelect,TResult? Function( SelectTrip value)?  selectTrip,TResult? Function( Save value)?  save,}){
final _that = this;
switch (_that) {
case LoadSetting() when loadSetting != null:
return loadSetting(_that);case ChangeTheme() when changeTheme != null:
return changeTheme(_that);case ToggleSystemTheme() when toggleSystemTheme != null:
return toggleSystemTheme(_that);case ToggleAutoSelect() when toggleAutoSelect != null:
return toggleAutoSelect(_that);case SelectTrip() when selectTrip != null:
return selectTrip(_that);case Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId)?  loadSetting,TResult Function( WidgetThemePreset preset)?  changeTheme,TResult Function( bool useSystemTheme)?  toggleSystemTheme,TResult Function( bool autoSelect)?  toggleAutoSelect,TResult Function( int tripId)?  selectTrip,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadSetting() when loadSetting != null:
return loadSetting(_that.userId);case ChangeTheme() when changeTheme != null:
return changeTheme(_that.preset);case ToggleSystemTheme() when toggleSystemTheme != null:
return toggleSystemTheme(_that.useSystemTheme);case ToggleAutoSelect() when toggleAutoSelect != null:
return toggleAutoSelect(_that.autoSelect);case SelectTrip() when selectTrip != null:
return selectTrip(_that.tripId);case Save() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId)  loadSetting,required TResult Function( WidgetThemePreset preset)  changeTheme,required TResult Function( bool useSystemTheme)  toggleSystemTheme,required TResult Function( bool autoSelect)  toggleAutoSelect,required TResult Function( int tripId)  selectTrip,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case LoadSetting():
return loadSetting(_that.userId);case ChangeTheme():
return changeTheme(_that.preset);case ToggleSystemTheme():
return toggleSystemTheme(_that.useSystemTheme);case ToggleAutoSelect():
return toggleAutoSelect(_that.autoSelect);case SelectTrip():
return selectTrip(_that.tripId);case Save():
return save();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId)?  loadSetting,TResult? Function( WidgetThemePreset preset)?  changeTheme,TResult? Function( bool useSystemTheme)?  toggleSystemTheme,TResult? Function( bool autoSelect)?  toggleAutoSelect,TResult? Function( int tripId)?  selectTrip,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case LoadSetting() when loadSetting != null:
return loadSetting(_that.userId);case ChangeTheme() when changeTheme != null:
return changeTheme(_that.preset);case ToggleSystemTheme() when toggleSystemTheme != null:
return toggleSystemTheme(_that.useSystemTheme);case ToggleAutoSelect() when toggleAutoSelect != null:
return toggleAutoSelect(_that.autoSelect);case SelectTrip() when selectTrip != null:
return selectTrip(_that.tripId);case Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class LoadSetting implements WidgetSettingsEvent {
  const LoadSetting({required this.userId});
  

 final  int userId;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadSettingCopyWith<LoadSetting> get copyWith => _$LoadSettingCopyWithImpl<LoadSetting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSetting&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WidgetSettingsEvent.loadSetting(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $LoadSettingCopyWith<$Res> implements $WidgetSettingsEventCopyWith<$Res> {
  factory $LoadSettingCopyWith(LoadSetting value, $Res Function(LoadSetting) _then) = _$LoadSettingCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$LoadSettingCopyWithImpl<$Res>
    implements $LoadSettingCopyWith<$Res> {
  _$LoadSettingCopyWithImpl(this._self, this._then);

  final LoadSetting _self;
  final $Res Function(LoadSetting) _then;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(LoadSetting(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ChangeTheme implements WidgetSettingsEvent {
  const ChangeTheme(this.preset);
  

 final  WidgetThemePreset preset;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeThemeCopyWith<ChangeTheme> get copyWith => _$ChangeThemeCopyWithImpl<ChangeTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTheme&&(identical(other.preset, preset) || other.preset == preset));
}


@override
int get hashCode => Object.hash(runtimeType,preset);

@override
String toString() {
  return 'WidgetSettingsEvent.changeTheme(preset: $preset)';
}


}

/// @nodoc
abstract mixin class $ChangeThemeCopyWith<$Res> implements $WidgetSettingsEventCopyWith<$Res> {
  factory $ChangeThemeCopyWith(ChangeTheme value, $Res Function(ChangeTheme) _then) = _$ChangeThemeCopyWithImpl;
@useResult
$Res call({
 WidgetThemePreset preset
});




}
/// @nodoc
class _$ChangeThemeCopyWithImpl<$Res>
    implements $ChangeThemeCopyWith<$Res> {
  _$ChangeThemeCopyWithImpl(this._self, this._then);

  final ChangeTheme _self;
  final $Res Function(ChangeTheme) _then;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preset = null,}) {
  return _then(ChangeTheme(
null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as WidgetThemePreset,
  ));
}


}

/// @nodoc


class ToggleSystemTheme implements WidgetSettingsEvent {
  const ToggleSystemTheme(this.useSystemTheme);
  

 final  bool useSystemTheme;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleSystemThemeCopyWith<ToggleSystemTheme> get copyWith => _$ToggleSystemThemeCopyWithImpl<ToggleSystemTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleSystemTheme&&(identical(other.useSystemTheme, useSystemTheme) || other.useSystemTheme == useSystemTheme));
}


@override
int get hashCode => Object.hash(runtimeType,useSystemTheme);

@override
String toString() {
  return 'WidgetSettingsEvent.toggleSystemTheme(useSystemTheme: $useSystemTheme)';
}


}

/// @nodoc
abstract mixin class $ToggleSystemThemeCopyWith<$Res> implements $WidgetSettingsEventCopyWith<$Res> {
  factory $ToggleSystemThemeCopyWith(ToggleSystemTheme value, $Res Function(ToggleSystemTheme) _then) = _$ToggleSystemThemeCopyWithImpl;
@useResult
$Res call({
 bool useSystemTheme
});




}
/// @nodoc
class _$ToggleSystemThemeCopyWithImpl<$Res>
    implements $ToggleSystemThemeCopyWith<$Res> {
  _$ToggleSystemThemeCopyWithImpl(this._self, this._then);

  final ToggleSystemTheme _self;
  final $Res Function(ToggleSystemTheme) _then;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? useSystemTheme = null,}) {
  return _then(ToggleSystemTheme(
null == useSystemTheme ? _self.useSystemTheme : useSystemTheme // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ToggleAutoSelect implements WidgetSettingsEvent {
  const ToggleAutoSelect(this.autoSelect);
  

 final  bool autoSelect;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleAutoSelectCopyWith<ToggleAutoSelect> get copyWith => _$ToggleAutoSelectCopyWithImpl<ToggleAutoSelect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleAutoSelect&&(identical(other.autoSelect, autoSelect) || other.autoSelect == autoSelect));
}


@override
int get hashCode => Object.hash(runtimeType,autoSelect);

@override
String toString() {
  return 'WidgetSettingsEvent.toggleAutoSelect(autoSelect: $autoSelect)';
}


}

/// @nodoc
abstract mixin class $ToggleAutoSelectCopyWith<$Res> implements $WidgetSettingsEventCopyWith<$Res> {
  factory $ToggleAutoSelectCopyWith(ToggleAutoSelect value, $Res Function(ToggleAutoSelect) _then) = _$ToggleAutoSelectCopyWithImpl;
@useResult
$Res call({
 bool autoSelect
});




}
/// @nodoc
class _$ToggleAutoSelectCopyWithImpl<$Res>
    implements $ToggleAutoSelectCopyWith<$Res> {
  _$ToggleAutoSelectCopyWithImpl(this._self, this._then);

  final ToggleAutoSelect _self;
  final $Res Function(ToggleAutoSelect) _then;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? autoSelect = null,}) {
  return _then(ToggleAutoSelect(
null == autoSelect ? _self.autoSelect : autoSelect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectTrip implements WidgetSettingsEvent {
  const SelectTrip(this.tripId);
  

 final  int tripId;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectTripCopyWith<SelectTrip> get copyWith => _$SelectTripCopyWithImpl<SelectTrip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectTrip&&(identical(other.tripId, tripId) || other.tripId == tripId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId);

@override
String toString() {
  return 'WidgetSettingsEvent.selectTrip(tripId: $tripId)';
}


}

/// @nodoc
abstract mixin class $SelectTripCopyWith<$Res> implements $WidgetSettingsEventCopyWith<$Res> {
  factory $SelectTripCopyWith(SelectTrip value, $Res Function(SelectTrip) _then) = _$SelectTripCopyWithImpl;
@useResult
$Res call({
 int tripId
});




}
/// @nodoc
class _$SelectTripCopyWithImpl<$Res>
    implements $SelectTripCopyWith<$Res> {
  _$SelectTripCopyWithImpl(this._self, this._then);

  final SelectTrip _self;
  final $Res Function(SelectTrip) _then;

/// Create a copy of WidgetSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,}) {
  return _then(SelectTrip(
null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Save implements WidgetSettingsEvent {
  const Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WidgetSettingsEvent.save()';
}


}




// dart format on
