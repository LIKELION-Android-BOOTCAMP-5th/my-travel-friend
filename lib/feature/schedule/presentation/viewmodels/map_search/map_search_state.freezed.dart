// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapSearchState {

 int? get tripId; MapSearchMode get mode; String? get tripPlace; String? get tripCountry; double? get initialLat; double? get initialLng; String? get initialAddress; bool get hasInitialLocation; double? get selectedLat; double? get selectedLng; String get query; bool get isSearching; bool get isResolvingInitialLocation; bool get isMapReady; List<PlaceCandidate> get candidates; PlaceCandidate? get selectedPlace; PlaceCandidate? get focusedPlace; bool get showBottomSheet; String? get message;
/// Create a copy of MapSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapSearchStateCopyWith<MapSearchState> get copyWith => _$MapSearchStateCopyWithImpl<MapSearchState>(this as MapSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSearchState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.tripPlace, tripPlace) || other.tripPlace == tripPlace)&&(identical(other.tripCountry, tripCountry) || other.tripCountry == tripCountry)&&(identical(other.initialLat, initialLat) || other.initialLat == initialLat)&&(identical(other.initialLng, initialLng) || other.initialLng == initialLng)&&(identical(other.initialAddress, initialAddress) || other.initialAddress == initialAddress)&&(identical(other.hasInitialLocation, hasInitialLocation) || other.hasInitialLocation == hasInitialLocation)&&(identical(other.selectedLat, selectedLat) || other.selectedLat == selectedLat)&&(identical(other.selectedLng, selectedLng) || other.selectedLng == selectedLng)&&(identical(other.query, query) || other.query == query)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isResolvingInitialLocation, isResolvingInitialLocation) || other.isResolvingInitialLocation == isResolvingInitialLocation)&&(identical(other.isMapReady, isMapReady) || other.isMapReady == isMapReady)&&const DeepCollectionEquality().equals(other.candidates, candidates)&&(identical(other.selectedPlace, selectedPlace) || other.selectedPlace == selectedPlace)&&(identical(other.focusedPlace, focusedPlace) || other.focusedPlace == focusedPlace)&&(identical(other.showBottomSheet, showBottomSheet) || other.showBottomSheet == showBottomSheet)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,mode,tripPlace,tripCountry,initialLat,initialLng,initialAddress,hasInitialLocation,selectedLat,selectedLng,query,isSearching,isResolvingInitialLocation,isMapReady,const DeepCollectionEquality().hash(candidates),selectedPlace,focusedPlace,showBottomSheet,message]);

@override
String toString() {
  return 'MapSearchState(tripId: $tripId, mode: $mode, tripPlace: $tripPlace, tripCountry: $tripCountry, initialLat: $initialLat, initialLng: $initialLng, initialAddress: $initialAddress, hasInitialLocation: $hasInitialLocation, selectedLat: $selectedLat, selectedLng: $selectedLng, query: $query, isSearching: $isSearching, isResolvingInitialLocation: $isResolvingInitialLocation, isMapReady: $isMapReady, candidates: $candidates, selectedPlace: $selectedPlace, focusedPlace: $focusedPlace, showBottomSheet: $showBottomSheet, message: $message)';
}


}

/// @nodoc
abstract mixin class $MapSearchStateCopyWith<$Res>  {
  factory $MapSearchStateCopyWith(MapSearchState value, $Res Function(MapSearchState) _then) = _$MapSearchStateCopyWithImpl;
@useResult
$Res call({
 int? tripId, MapSearchMode mode, String? tripPlace, String? tripCountry, double? initialLat, double? initialLng, String? initialAddress, bool hasInitialLocation, double? selectedLat, double? selectedLng, String query, bool isSearching, bool isResolvingInitialLocation, bool isMapReady, List<PlaceCandidate> candidates, PlaceCandidate? selectedPlace, PlaceCandidate? focusedPlace, bool showBottomSheet, String? message
});




}
/// @nodoc
class _$MapSearchStateCopyWithImpl<$Res>
    implements $MapSearchStateCopyWith<$Res> {
  _$MapSearchStateCopyWithImpl(this._self, this._then);

  final MapSearchState _self;
  final $Res Function(MapSearchState) _then;

/// Create a copy of MapSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = freezed,Object? mode = null,Object? tripPlace = freezed,Object? tripCountry = freezed,Object? initialLat = freezed,Object? initialLng = freezed,Object? initialAddress = freezed,Object? hasInitialLocation = null,Object? selectedLat = freezed,Object? selectedLng = freezed,Object? query = null,Object? isSearching = null,Object? isResolvingInitialLocation = null,Object? isMapReady = null,Object? candidates = null,Object? selectedPlace = freezed,Object? focusedPlace = freezed,Object? showBottomSheet = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapSearchMode,tripPlace: freezed == tripPlace ? _self.tripPlace : tripPlace // ignore: cast_nullable_to_non_nullable
as String?,tripCountry: freezed == tripCountry ? _self.tripCountry : tripCountry // ignore: cast_nullable_to_non_nullable
as String?,initialLat: freezed == initialLat ? _self.initialLat : initialLat // ignore: cast_nullable_to_non_nullable
as double?,initialLng: freezed == initialLng ? _self.initialLng : initialLng // ignore: cast_nullable_to_non_nullable
as double?,initialAddress: freezed == initialAddress ? _self.initialAddress : initialAddress // ignore: cast_nullable_to_non_nullable
as String?,hasInitialLocation: null == hasInitialLocation ? _self.hasInitialLocation : hasInitialLocation // ignore: cast_nullable_to_non_nullable
as bool,selectedLat: freezed == selectedLat ? _self.selectedLat : selectedLat // ignore: cast_nullable_to_non_nullable
as double?,selectedLng: freezed == selectedLng ? _self.selectedLng : selectedLng // ignore: cast_nullable_to_non_nullable
as double?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isResolvingInitialLocation: null == isResolvingInitialLocation ? _self.isResolvingInitialLocation : isResolvingInitialLocation // ignore: cast_nullable_to_non_nullable
as bool,isMapReady: null == isMapReady ? _self.isMapReady : isMapReady // ignore: cast_nullable_to_non_nullable
as bool,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<PlaceCandidate>,selectedPlace: freezed == selectedPlace ? _self.selectedPlace : selectedPlace // ignore: cast_nullable_to_non_nullable
as PlaceCandidate?,focusedPlace: freezed == focusedPlace ? _self.focusedPlace : focusedPlace // ignore: cast_nullable_to_non_nullable
as PlaceCandidate?,showBottomSheet: null == showBottomSheet ? _self.showBottomSheet : showBottomSheet // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapSearchState].
extension MapSearchStatePatterns on MapSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapSearchState value)  $default,){
final _that = this;
switch (_that) {
case _MapSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _MapSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tripId,  MapSearchMode mode,  String? tripPlace,  String? tripCountry,  double? initialLat,  double? initialLng,  String? initialAddress,  bool hasInitialLocation,  double? selectedLat,  double? selectedLng,  String query,  bool isSearching,  bool isResolvingInitialLocation,  bool isMapReady,  List<PlaceCandidate> candidates,  PlaceCandidate? selectedPlace,  PlaceCandidate? focusedPlace,  bool showBottomSheet,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapSearchState() when $default != null:
return $default(_that.tripId,_that.mode,_that.tripPlace,_that.tripCountry,_that.initialLat,_that.initialLng,_that.initialAddress,_that.hasInitialLocation,_that.selectedLat,_that.selectedLng,_that.query,_that.isSearching,_that.isResolvingInitialLocation,_that.isMapReady,_that.candidates,_that.selectedPlace,_that.focusedPlace,_that.showBottomSheet,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tripId,  MapSearchMode mode,  String? tripPlace,  String? tripCountry,  double? initialLat,  double? initialLng,  String? initialAddress,  bool hasInitialLocation,  double? selectedLat,  double? selectedLng,  String query,  bool isSearching,  bool isResolvingInitialLocation,  bool isMapReady,  List<PlaceCandidate> candidates,  PlaceCandidate? selectedPlace,  PlaceCandidate? focusedPlace,  bool showBottomSheet,  String? message)  $default,) {final _that = this;
switch (_that) {
case _MapSearchState():
return $default(_that.tripId,_that.mode,_that.tripPlace,_that.tripCountry,_that.initialLat,_that.initialLng,_that.initialAddress,_that.hasInitialLocation,_that.selectedLat,_that.selectedLng,_that.query,_that.isSearching,_that.isResolvingInitialLocation,_that.isMapReady,_that.candidates,_that.selectedPlace,_that.focusedPlace,_that.showBottomSheet,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tripId,  MapSearchMode mode,  String? tripPlace,  String? tripCountry,  double? initialLat,  double? initialLng,  String? initialAddress,  bool hasInitialLocation,  double? selectedLat,  double? selectedLng,  String query,  bool isSearching,  bool isResolvingInitialLocation,  bool isMapReady,  List<PlaceCandidate> candidates,  PlaceCandidate? selectedPlace,  PlaceCandidate? focusedPlace,  bool showBottomSheet,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _MapSearchState() when $default != null:
return $default(_that.tripId,_that.mode,_that.tripPlace,_that.tripCountry,_that.initialLat,_that.initialLng,_that.initialAddress,_that.hasInitialLocation,_that.selectedLat,_that.selectedLng,_that.query,_that.isSearching,_that.isResolvingInitialLocation,_that.isMapReady,_that.candidates,_that.selectedPlace,_that.focusedPlace,_that.showBottomSheet,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _MapSearchState implements MapSearchState {
  const _MapSearchState({this.tripId, this.mode = MapSearchMode.aiSearch, this.tripPlace, this.tripCountry, this.initialLat, this.initialLng, this.initialAddress, this.hasInitialLocation = false, this.selectedLat, this.selectedLng, this.query = '', this.isSearching = false, this.isResolvingInitialLocation = false, this.isMapReady = false, final  List<PlaceCandidate> candidates = const [], this.selectedPlace, this.focusedPlace, this.showBottomSheet = false, this.message}): _candidates = candidates;
  

@override final  int? tripId;
@override@JsonKey() final  MapSearchMode mode;
@override final  String? tripPlace;
@override final  String? tripCountry;
@override final  double? initialLat;
@override final  double? initialLng;
@override final  String? initialAddress;
@override@JsonKey() final  bool hasInitialLocation;
@override final  double? selectedLat;
@override final  double? selectedLng;
@override@JsonKey() final  String query;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isResolvingInitialLocation;
@override@JsonKey() final  bool isMapReady;
 final  List<PlaceCandidate> _candidates;
@override@JsonKey() List<PlaceCandidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}

@override final  PlaceCandidate? selectedPlace;
@override final  PlaceCandidate? focusedPlace;
@override@JsonKey() final  bool showBottomSheet;
@override final  String? message;

/// Create a copy of MapSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapSearchStateCopyWith<_MapSearchState> get copyWith => __$MapSearchStateCopyWithImpl<_MapSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapSearchState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.tripPlace, tripPlace) || other.tripPlace == tripPlace)&&(identical(other.tripCountry, tripCountry) || other.tripCountry == tripCountry)&&(identical(other.initialLat, initialLat) || other.initialLat == initialLat)&&(identical(other.initialLng, initialLng) || other.initialLng == initialLng)&&(identical(other.initialAddress, initialAddress) || other.initialAddress == initialAddress)&&(identical(other.hasInitialLocation, hasInitialLocation) || other.hasInitialLocation == hasInitialLocation)&&(identical(other.selectedLat, selectedLat) || other.selectedLat == selectedLat)&&(identical(other.selectedLng, selectedLng) || other.selectedLng == selectedLng)&&(identical(other.query, query) || other.query == query)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isResolvingInitialLocation, isResolvingInitialLocation) || other.isResolvingInitialLocation == isResolvingInitialLocation)&&(identical(other.isMapReady, isMapReady) || other.isMapReady == isMapReady)&&const DeepCollectionEquality().equals(other._candidates, _candidates)&&(identical(other.selectedPlace, selectedPlace) || other.selectedPlace == selectedPlace)&&(identical(other.focusedPlace, focusedPlace) || other.focusedPlace == focusedPlace)&&(identical(other.showBottomSheet, showBottomSheet) || other.showBottomSheet == showBottomSheet)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hashAll([runtimeType,tripId,mode,tripPlace,tripCountry,initialLat,initialLng,initialAddress,hasInitialLocation,selectedLat,selectedLng,query,isSearching,isResolvingInitialLocation,isMapReady,const DeepCollectionEquality().hash(_candidates),selectedPlace,focusedPlace,showBottomSheet,message]);

@override
String toString() {
  return 'MapSearchState(tripId: $tripId, mode: $mode, tripPlace: $tripPlace, tripCountry: $tripCountry, initialLat: $initialLat, initialLng: $initialLng, initialAddress: $initialAddress, hasInitialLocation: $hasInitialLocation, selectedLat: $selectedLat, selectedLng: $selectedLng, query: $query, isSearching: $isSearching, isResolvingInitialLocation: $isResolvingInitialLocation, isMapReady: $isMapReady, candidates: $candidates, selectedPlace: $selectedPlace, focusedPlace: $focusedPlace, showBottomSheet: $showBottomSheet, message: $message)';
}


}

/// @nodoc
abstract mixin class _$MapSearchStateCopyWith<$Res> implements $MapSearchStateCopyWith<$Res> {
  factory _$MapSearchStateCopyWith(_MapSearchState value, $Res Function(_MapSearchState) _then) = __$MapSearchStateCopyWithImpl;
@override @useResult
$Res call({
 int? tripId, MapSearchMode mode, String? tripPlace, String? tripCountry, double? initialLat, double? initialLng, String? initialAddress, bool hasInitialLocation, double? selectedLat, double? selectedLng, String query, bool isSearching, bool isResolvingInitialLocation, bool isMapReady, List<PlaceCandidate> candidates, PlaceCandidate? selectedPlace, PlaceCandidate? focusedPlace, bool showBottomSheet, String? message
});




}
/// @nodoc
class __$MapSearchStateCopyWithImpl<$Res>
    implements _$MapSearchStateCopyWith<$Res> {
  __$MapSearchStateCopyWithImpl(this._self, this._then);

  final _MapSearchState _self;
  final $Res Function(_MapSearchState) _then;

/// Create a copy of MapSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = freezed,Object? mode = null,Object? tripPlace = freezed,Object? tripCountry = freezed,Object? initialLat = freezed,Object? initialLng = freezed,Object? initialAddress = freezed,Object? hasInitialLocation = null,Object? selectedLat = freezed,Object? selectedLng = freezed,Object? query = null,Object? isSearching = null,Object? isResolvingInitialLocation = null,Object? isMapReady = null,Object? candidates = null,Object? selectedPlace = freezed,Object? focusedPlace = freezed,Object? showBottomSheet = null,Object? message = freezed,}) {
  return _then(_MapSearchState(
tripId: freezed == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapSearchMode,tripPlace: freezed == tripPlace ? _self.tripPlace : tripPlace // ignore: cast_nullable_to_non_nullable
as String?,tripCountry: freezed == tripCountry ? _self.tripCountry : tripCountry // ignore: cast_nullable_to_non_nullable
as String?,initialLat: freezed == initialLat ? _self.initialLat : initialLat // ignore: cast_nullable_to_non_nullable
as double?,initialLng: freezed == initialLng ? _self.initialLng : initialLng // ignore: cast_nullable_to_non_nullable
as double?,initialAddress: freezed == initialAddress ? _self.initialAddress : initialAddress // ignore: cast_nullable_to_non_nullable
as String?,hasInitialLocation: null == hasInitialLocation ? _self.hasInitialLocation : hasInitialLocation // ignore: cast_nullable_to_non_nullable
as bool,selectedLat: freezed == selectedLat ? _self.selectedLat : selectedLat // ignore: cast_nullable_to_non_nullable
as double?,selectedLng: freezed == selectedLng ? _self.selectedLng : selectedLng // ignore: cast_nullable_to_non_nullable
as double?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isResolvingInitialLocation: null == isResolvingInitialLocation ? _self.isResolvingInitialLocation : isResolvingInitialLocation // ignore: cast_nullable_to_non_nullable
as bool,isMapReady: null == isMapReady ? _self.isMapReady : isMapReady // ignore: cast_nullable_to_non_nullable
as bool,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<PlaceCandidate>,selectedPlace: freezed == selectedPlace ? _self.selectedPlace : selectedPlace // ignore: cast_nullable_to_non_nullable
as PlaceCandidate?,focusedPlace: freezed == focusedPlace ? _self.focusedPlace : focusedPlace // ignore: cast_nullable_to_non_nullable
as PlaceCandidate?,showBottomSheet: null == showBottomSheet ? _self.showBottomSheet : showBottomSheet // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
