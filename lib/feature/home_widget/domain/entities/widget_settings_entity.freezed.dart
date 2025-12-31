// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WidgetSettingsEntity {

// 테마 설정
 String get themePresetName; bool get useSystemTheme;// 여행 선택 설정
 bool get autoSelectTrip;// true: 가장 가까운 여행 자동, false: 고정
 int? get selectedTripId;
/// Create a copy of WidgetSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetSettingsEntityCopyWith<WidgetSettingsEntity> get copyWith => _$WidgetSettingsEntityCopyWithImpl<WidgetSettingsEntity>(this as WidgetSettingsEntity, _$identity);

  /// Serializes this WidgetSettingsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetSettingsEntity&&(identical(other.themePresetName, themePresetName) || other.themePresetName == themePresetName)&&(identical(other.useSystemTheme, useSystemTheme) || other.useSystemTheme == useSystemTheme)&&(identical(other.autoSelectTrip, autoSelectTrip) || other.autoSelectTrip == autoSelectTrip)&&(identical(other.selectedTripId, selectedTripId) || other.selectedTripId == selectedTripId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themePresetName,useSystemTheme,autoSelectTrip,selectedTripId);

@override
String toString() {
  return 'WidgetSettingsEntity(themePresetName: $themePresetName, useSystemTheme: $useSystemTheme, autoSelectTrip: $autoSelectTrip, selectedTripId: $selectedTripId)';
}


}

/// @nodoc
abstract mixin class $WidgetSettingsEntityCopyWith<$Res>  {
  factory $WidgetSettingsEntityCopyWith(WidgetSettingsEntity value, $Res Function(WidgetSettingsEntity) _then) = _$WidgetSettingsEntityCopyWithImpl;
@useResult
$Res call({
 String themePresetName, bool useSystemTheme, bool autoSelectTrip, int? selectedTripId
});




}
/// @nodoc
class _$WidgetSettingsEntityCopyWithImpl<$Res>
    implements $WidgetSettingsEntityCopyWith<$Res> {
  _$WidgetSettingsEntityCopyWithImpl(this._self, this._then);

  final WidgetSettingsEntity _self;
  final $Res Function(WidgetSettingsEntity) _then;

/// Create a copy of WidgetSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themePresetName = null,Object? useSystemTheme = null,Object? autoSelectTrip = null,Object? selectedTripId = freezed,}) {
  return _then(_self.copyWith(
themePresetName: null == themePresetName ? _self.themePresetName : themePresetName // ignore: cast_nullable_to_non_nullable
as String,useSystemTheme: null == useSystemTheme ? _self.useSystemTheme : useSystemTheme // ignore: cast_nullable_to_non_nullable
as bool,autoSelectTrip: null == autoSelectTrip ? _self.autoSelectTrip : autoSelectTrip // ignore: cast_nullable_to_non_nullable
as bool,selectedTripId: freezed == selectedTripId ? _self.selectedTripId : selectedTripId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WidgetSettingsEntity].
extension WidgetSettingsEntityPatterns on WidgetSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _WidgetSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String themePresetName,  bool useSystemTheme,  bool autoSelectTrip,  int? selectedTripId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetSettingsEntity() when $default != null:
return $default(_that.themePresetName,_that.useSystemTheme,_that.autoSelectTrip,_that.selectedTripId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String themePresetName,  bool useSystemTheme,  bool autoSelectTrip,  int? selectedTripId)  $default,) {final _that = this;
switch (_that) {
case _WidgetSettingsEntity():
return $default(_that.themePresetName,_that.useSystemTheme,_that.autoSelectTrip,_that.selectedTripId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String themePresetName,  bool useSystemTheme,  bool autoSelectTrip,  int? selectedTripId)?  $default,) {final _that = this;
switch (_that) {
case _WidgetSettingsEntity() when $default != null:
return $default(_that.themePresetName,_that.useSystemTheme,_that.autoSelectTrip,_that.selectedTripId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetSettingsEntity implements WidgetSettingsEntity {
  const _WidgetSettingsEntity({this.themePresetName = 'defaultLight', this.useSystemTheme = true, this.autoSelectTrip = true, this.selectedTripId = null});
  factory _WidgetSettingsEntity.fromJson(Map<String, dynamic> json) => _$WidgetSettingsEntityFromJson(json);

// 테마 설정
@override@JsonKey() final  String themePresetName;
@override@JsonKey() final  bool useSystemTheme;
// 여행 선택 설정
@override@JsonKey() final  bool autoSelectTrip;
// true: 가장 가까운 여행 자동, false: 고정
@override@JsonKey() final  int? selectedTripId;

/// Create a copy of WidgetSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetSettingsEntityCopyWith<_WidgetSettingsEntity> get copyWith => __$WidgetSettingsEntityCopyWithImpl<_WidgetSettingsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetSettingsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetSettingsEntity&&(identical(other.themePresetName, themePresetName) || other.themePresetName == themePresetName)&&(identical(other.useSystemTheme, useSystemTheme) || other.useSystemTheme == useSystemTheme)&&(identical(other.autoSelectTrip, autoSelectTrip) || other.autoSelectTrip == autoSelectTrip)&&(identical(other.selectedTripId, selectedTripId) || other.selectedTripId == selectedTripId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themePresetName,useSystemTheme,autoSelectTrip,selectedTripId);

@override
String toString() {
  return 'WidgetSettingsEntity(themePresetName: $themePresetName, useSystemTheme: $useSystemTheme, autoSelectTrip: $autoSelectTrip, selectedTripId: $selectedTripId)';
}


}

/// @nodoc
abstract mixin class _$WidgetSettingsEntityCopyWith<$Res> implements $WidgetSettingsEntityCopyWith<$Res> {
  factory _$WidgetSettingsEntityCopyWith(_WidgetSettingsEntity value, $Res Function(_WidgetSettingsEntity) _then) = __$WidgetSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 String themePresetName, bool useSystemTheme, bool autoSelectTrip, int? selectedTripId
});




}
/// @nodoc
class __$WidgetSettingsEntityCopyWithImpl<$Res>
    implements _$WidgetSettingsEntityCopyWith<$Res> {
  __$WidgetSettingsEntityCopyWithImpl(this._self, this._then);

  final _WidgetSettingsEntity _self;
  final $Res Function(_WidgetSettingsEntity) _then;

/// Create a copy of WidgetSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themePresetName = null,Object? useSystemTheme = null,Object? autoSelectTrip = null,Object? selectedTripId = freezed,}) {
  return _then(_WidgetSettingsEntity(
themePresetName: null == themePresetName ? _self.themePresetName : themePresetName // ignore: cast_nullable_to_non_nullable
as String,useSystemTheme: null == useSystemTheme ? _self.useSystemTheme : useSystemTheme // ignore: cast_nullable_to_non_nullable
as bool,autoSelectTrip: null == autoSelectTrip ? _self.autoSelectTrip : autoSelectTrip // ignore: cast_nullable_to_non_nullable
as bool,selectedTripId: freezed == selectedTripId ? _self.selectedTripId : selectedTripId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
