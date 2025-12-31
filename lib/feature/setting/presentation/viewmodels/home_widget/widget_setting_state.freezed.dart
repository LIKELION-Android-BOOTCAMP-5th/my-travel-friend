// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WidgetSettingsState {

 bool get isLoading; bool get isSaving; WidgetSettingsEntity? get settings; List<TripEntity> get trips; TripEntity? get selectedTrip; String? get errorMessage; bool get saveSuccess;
/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetSettingsStateCopyWith<WidgetSettingsState> get copyWith => _$WidgetSettingsStateCopyWithImpl<WidgetSettingsState>(this as WidgetSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetSettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other.trips, trips)&&(identical(other.selectedTrip, selectedTrip) || other.selectedTrip == selectedTrip)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,settings,const DeepCollectionEquality().hash(trips),selectedTrip,errorMessage,saveSuccess);

@override
String toString() {
  return 'WidgetSettingsState(isLoading: $isLoading, isSaving: $isSaving, settings: $settings, trips: $trips, selectedTrip: $selectedTrip, errorMessage: $errorMessage, saveSuccess: $saveSuccess)';
}


}

/// @nodoc
abstract mixin class $WidgetSettingsStateCopyWith<$Res>  {
  factory $WidgetSettingsStateCopyWith(WidgetSettingsState value, $Res Function(WidgetSettingsState) _then) = _$WidgetSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSaving, WidgetSettingsEntity? settings, List<TripEntity> trips, TripEntity? selectedTrip, String? errorMessage, bool saveSuccess
});


$WidgetSettingsEntityCopyWith<$Res>? get settings;$TripEntityCopyWith<$Res>? get selectedTrip;

}
/// @nodoc
class _$WidgetSettingsStateCopyWithImpl<$Res>
    implements $WidgetSettingsStateCopyWith<$Res> {
  _$WidgetSettingsStateCopyWithImpl(this._self, this._then);

  final WidgetSettingsState _self;
  final $Res Function(WidgetSettingsState) _then;

/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSaving = null,Object? settings = freezed,Object? trips = null,Object? selectedTrip = freezed,Object? errorMessage = freezed,Object? saveSuccess = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as WidgetSettingsEntity?,trips: null == trips ? _self.trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>,selectedTrip: freezed == selectedTrip ? _self.selectedTrip : selectedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WidgetSettingsEntityCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $WidgetSettingsEntityCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get selectedTrip {
    if (_self.selectedTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.selectedTrip!, (value) {
    return _then(_self.copyWith(selectedTrip: value));
  });
}
}


/// Adds pattern-matching-related methods to [WidgetSettingsState].
extension WidgetSettingsStatePatterns on WidgetSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _WidgetSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  WidgetSettingsEntity? settings,  List<TripEntity> trips,  TripEntity? selectedTrip,  String? errorMessage,  bool saveSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetSettingsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.settings,_that.trips,_that.selectedTrip,_that.errorMessage,_that.saveSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  WidgetSettingsEntity? settings,  List<TripEntity> trips,  TripEntity? selectedTrip,  String? errorMessage,  bool saveSuccess)  $default,) {final _that = this;
switch (_that) {
case _WidgetSettingsState():
return $default(_that.isLoading,_that.isSaving,_that.settings,_that.trips,_that.selectedTrip,_that.errorMessage,_that.saveSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSaving,  WidgetSettingsEntity? settings,  List<TripEntity> trips,  TripEntity? selectedTrip,  String? errorMessage,  bool saveSuccess)?  $default,) {final _that = this;
switch (_that) {
case _WidgetSettingsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.settings,_that.trips,_that.selectedTrip,_that.errorMessage,_that.saveSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _WidgetSettingsState implements WidgetSettingsState {
  const _WidgetSettingsState({this.isLoading = false, this.isSaving = false, this.settings = null, final  List<TripEntity> trips = const [], this.selectedTrip = null, this.errorMessage = null, this.saveSuccess = false}): _trips = trips;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  WidgetSettingsEntity? settings;
 final  List<TripEntity> _trips;
@override@JsonKey() List<TripEntity> get trips {
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trips);
}

@override@JsonKey() final  TripEntity? selectedTrip;
@override@JsonKey() final  String? errorMessage;
@override@JsonKey() final  bool saveSuccess;

/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetSettingsStateCopyWith<_WidgetSettingsState> get copyWith => __$WidgetSettingsStateCopyWithImpl<_WidgetSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetSettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other._trips, _trips)&&(identical(other.selectedTrip, selectedTrip) || other.selectedTrip == selectedTrip)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,settings,const DeepCollectionEquality().hash(_trips),selectedTrip,errorMessage,saveSuccess);

@override
String toString() {
  return 'WidgetSettingsState(isLoading: $isLoading, isSaving: $isSaving, settings: $settings, trips: $trips, selectedTrip: $selectedTrip, errorMessage: $errorMessage, saveSuccess: $saveSuccess)';
}


}

/// @nodoc
abstract mixin class _$WidgetSettingsStateCopyWith<$Res> implements $WidgetSettingsStateCopyWith<$Res> {
  factory _$WidgetSettingsStateCopyWith(_WidgetSettingsState value, $Res Function(_WidgetSettingsState) _then) = __$WidgetSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSaving, WidgetSettingsEntity? settings, List<TripEntity> trips, TripEntity? selectedTrip, String? errorMessage, bool saveSuccess
});


@override $WidgetSettingsEntityCopyWith<$Res>? get settings;@override $TripEntityCopyWith<$Res>? get selectedTrip;

}
/// @nodoc
class __$WidgetSettingsStateCopyWithImpl<$Res>
    implements _$WidgetSettingsStateCopyWith<$Res> {
  __$WidgetSettingsStateCopyWithImpl(this._self, this._then);

  final _WidgetSettingsState _self;
  final $Res Function(_WidgetSettingsState) _then;

/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSaving = null,Object? settings = freezed,Object? trips = null,Object? selectedTrip = freezed,Object? errorMessage = freezed,Object? saveSuccess = null,}) {
  return _then(_WidgetSettingsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as WidgetSettingsEntity?,trips: null == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>,selectedTrip: freezed == selectedTrip ? _self.selectedTrip : selectedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WidgetSettingsEntityCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $WidgetSettingsEntityCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of WidgetSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripEntityCopyWith<$Res>? get selectedTrip {
    if (_self.selectedTrip == null) {
    return null;
  }

  return $TripEntityCopyWith<$Res>(_self.selectedTrip!, (value) {
    return _then(_self.copyWith(selectedTrip: value));
  });
}
}

// dart format on
