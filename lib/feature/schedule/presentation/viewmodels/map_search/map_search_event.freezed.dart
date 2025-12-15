// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapSearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapSearchEvent()';
}


}

/// @nodoc
class $MapSearchEventCopyWith<$Res>  {
$MapSearchEventCopyWith(MapSearchEvent _, $Res Function(MapSearchEvent) __);
}


/// Adds pattern-matching-related methods to [MapSearchEvent].
extension MapSearchEventPatterns on MapSearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialized value)?  initialized,TResult Function( QueryChanged value)?  queryChanged,TResult Function( SearchRequested value)?  searchRequested,TResult Function( PlaceFocused value)?  placeFocused,TResult Function( PlaceSelected value)?  placeSelected,TResult Function( ConfirmPressed value)?  confirmPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case QueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchRequested() when searchRequested != null:
return searchRequested(_that);case PlaceFocused() when placeFocused != null:
return placeFocused(_that);case PlaceSelected() when placeSelected != null:
return placeSelected(_that);case ConfirmPressed() when confirmPressed != null:
return confirmPressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialized value)  initialized,required TResult Function( QueryChanged value)  queryChanged,required TResult Function( SearchRequested value)  searchRequested,required TResult Function( PlaceFocused value)  placeFocused,required TResult Function( PlaceSelected value)  placeSelected,required TResult Function( ConfirmPressed value)  confirmPressed,}){
final _that = this;
switch (_that) {
case Initialized():
return initialized(_that);case QueryChanged():
return queryChanged(_that);case SearchRequested():
return searchRequested(_that);case PlaceFocused():
return placeFocused(_that);case PlaceSelected():
return placeSelected(_that);case ConfirmPressed():
return confirmPressed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialized value)?  initialized,TResult? Function( QueryChanged value)?  queryChanged,TResult? Function( SearchRequested value)?  searchRequested,TResult? Function( PlaceFocused value)?  placeFocused,TResult? Function( PlaceSelected value)?  placeSelected,TResult? Function( ConfirmPressed value)?  confirmPressed,}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case QueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchRequested() when searchRequested != null:
return searchRequested(_that);case PlaceFocused() when placeFocused != null:
return placeFocused(_that);case PlaceSelected() when placeSelected != null:
return placeSelected(_that);case ConfirmPressed() when confirmPressed != null:
return confirmPressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId,  double? lat,  double? lng,  String? address)?  initialized,TResult Function( String query)?  queryChanged,TResult Function()?  searchRequested,TResult Function( PlaceCandidate place)?  placeFocused,TResult Function( PlaceCandidate place)?  placeSelected,TResult Function()?  confirmPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.tripId,_that.lat,_that.lng,_that.address);case QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchRequested() when searchRequested != null:
return searchRequested();case PlaceFocused() when placeFocused != null:
return placeFocused(_that.place);case PlaceSelected() when placeSelected != null:
return placeSelected(_that.place);case ConfirmPressed() when confirmPressed != null:
return confirmPressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId,  double? lat,  double? lng,  String? address)  initialized,required TResult Function( String query)  queryChanged,required TResult Function()  searchRequested,required TResult Function( PlaceCandidate place)  placeFocused,required TResult Function( PlaceCandidate place)  placeSelected,required TResult Function()  confirmPressed,}) {final _that = this;
switch (_that) {
case Initialized():
return initialized(_that.tripId,_that.lat,_that.lng,_that.address);case QueryChanged():
return queryChanged(_that.query);case SearchRequested():
return searchRequested();case PlaceFocused():
return placeFocused(_that.place);case PlaceSelected():
return placeSelected(_that.place);case ConfirmPressed():
return confirmPressed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId,  double? lat,  double? lng,  String? address)?  initialized,TResult? Function( String query)?  queryChanged,TResult? Function()?  searchRequested,TResult? Function( PlaceCandidate place)?  placeFocused,TResult? Function( PlaceCandidate place)?  placeSelected,TResult? Function()?  confirmPressed,}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.tripId,_that.lat,_that.lng,_that.address);case QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchRequested() when searchRequested != null:
return searchRequested();case PlaceFocused() when placeFocused != null:
return placeFocused(_that.place);case PlaceSelected() when placeSelected != null:
return placeSelected(_that.place);case ConfirmPressed() when confirmPressed != null:
return confirmPressed();case _:
  return null;

}
}

}

/// @nodoc


class Initialized implements MapSearchEvent {
  const Initialized({required this.tripId, this.lat, this.lng, this.address});
  

 final  int tripId;
 final  double? lat;
 final  double? lng;
 final  String? address;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializedCopyWith<Initialized> get copyWith => _$InitializedCopyWithImpl<Initialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialized&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,lat,lng,address);

@override
String toString() {
  return 'MapSearchEvent.initialized(tripId: $tripId, lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class $InitializedCopyWith<$Res> implements $MapSearchEventCopyWith<$Res> {
  factory $InitializedCopyWith(Initialized value, $Res Function(Initialized) _then) = _$InitializedCopyWithImpl;
@useResult
$Res call({
 int tripId, double? lat, double? lng, String? address
});




}
/// @nodoc
class _$InitializedCopyWithImpl<$Res>
    implements $InitializedCopyWith<$Res> {
  _$InitializedCopyWithImpl(this._self, this._then);

  final Initialized _self;
  final $Res Function(Initialized) _then;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? lat = freezed,Object? lng = freezed,Object? address = freezed,}) {
  return _then(Initialized(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class QueryChanged implements MapSearchEvent {
  const QueryChanged(this.query);
  

 final  String query;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryChangedCopyWith<QueryChanged> get copyWith => _$QueryChangedCopyWithImpl<QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'MapSearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $QueryChangedCopyWith<$Res> implements $MapSearchEventCopyWith<$Res> {
  factory $QueryChangedCopyWith(QueryChanged value, $Res Function(QueryChanged) _then) = _$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$QueryChangedCopyWithImpl<$Res>
    implements $QueryChangedCopyWith<$Res> {
  _$QueryChangedCopyWithImpl(this._self, this._then);

  final QueryChanged _self;
  final $Res Function(QueryChanged) _then;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchRequested implements MapSearchEvent {
  const SearchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapSearchEvent.searchRequested()';
}


}




/// @nodoc


class PlaceFocused implements MapSearchEvent {
  const PlaceFocused(this.place);
  

 final  PlaceCandidate place;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceFocusedCopyWith<PlaceFocused> get copyWith => _$PlaceFocusedCopyWithImpl<PlaceFocused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceFocused&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,place);

@override
String toString() {
  return 'MapSearchEvent.placeFocused(place: $place)';
}


}

/// @nodoc
abstract mixin class $PlaceFocusedCopyWith<$Res> implements $MapSearchEventCopyWith<$Res> {
  factory $PlaceFocusedCopyWith(PlaceFocused value, $Res Function(PlaceFocused) _then) = _$PlaceFocusedCopyWithImpl;
@useResult
$Res call({
 PlaceCandidate place
});




}
/// @nodoc
class _$PlaceFocusedCopyWithImpl<$Res>
    implements $PlaceFocusedCopyWith<$Res> {
  _$PlaceFocusedCopyWithImpl(this._self, this._then);

  final PlaceFocused _self;
  final $Res Function(PlaceFocused) _then;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? place = null,}) {
  return _then(PlaceFocused(
null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceCandidate,
  ));
}


}

/// @nodoc


class PlaceSelected implements MapSearchEvent {
  const PlaceSelected(this.place);
  

 final  PlaceCandidate place;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceSelectedCopyWith<PlaceSelected> get copyWith => _$PlaceSelectedCopyWithImpl<PlaceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceSelected&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,place);

@override
String toString() {
  return 'MapSearchEvent.placeSelected(place: $place)';
}


}

/// @nodoc
abstract mixin class $PlaceSelectedCopyWith<$Res> implements $MapSearchEventCopyWith<$Res> {
  factory $PlaceSelectedCopyWith(PlaceSelected value, $Res Function(PlaceSelected) _then) = _$PlaceSelectedCopyWithImpl;
@useResult
$Res call({
 PlaceCandidate place
});




}
/// @nodoc
class _$PlaceSelectedCopyWithImpl<$Res>
    implements $PlaceSelectedCopyWith<$Res> {
  _$PlaceSelectedCopyWithImpl(this._self, this._then);

  final PlaceSelected _self;
  final $Res Function(PlaceSelected) _then;

/// Create a copy of MapSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? place = null,}) {
  return _then(PlaceSelected(
null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceCandidate,
  ));
}


}

/// @nodoc


class ConfirmPressed implements MapSearchEvent {
  const ConfirmPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapSearchEvent.confirmPressed()';
}


}




// dart format on
