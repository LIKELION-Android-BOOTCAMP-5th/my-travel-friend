// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_schedule_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditScheduleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditScheduleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent()';
}


}

/// @nodoc
class $EditScheduleEventCopyWith<$Res>  {
$EditScheduleEventCopyWith(EditScheduleEvent _, $Res Function(EditScheduleEvent) __);
}


/// Adds pattern-matching-related methods to [EditScheduleEvent].
extension EditScheduleEventPatterns on EditScheduleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialized value)?  initialized,TResult Function( LoadScheduleMembers value)?  loadScheduleMembers,TResult Function( TitleChanged value)?  titleChanged,TResult Function( DescriptionChanged value)?  descriptionChanged,TResult Function( DateSelected value)?  dateSelected,TResult Function( TimeSelected value)?  timeSelected,TResult Function( PlaceTextChanged value)?  placeTextChanged,TResult Function( PlaceSearchRequested value)?  placeSearchRequested,TResult Function( PlaceSelected value)?  placeSelected,TResult Function( PlaceCleared value)?  placeCleared,TResult Function( CategorySelected value)?  categorySelected,TResult Function( LoadTripMembers value)?  loadTripMembers,TResult Function( CrewAdded value)?  crewAdded,TResult Function( CrewRemoved value)?  crewRemoved,TResult Function( SubmitPressed value)?  submitPressed,TResult Function( ExitRequested value)?  exitRequested,TResult Function( ExitConfirmed value)?  exitConfirmed,TResult Function( ClearMessage value)?  clearMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case LoadScheduleMembers() when loadScheduleMembers != null:
return loadScheduleMembers(_that);case TitleChanged() when titleChanged != null:
return titleChanged(_that);case DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case DateSelected() when dateSelected != null:
return dateSelected(_that);case TimeSelected() when timeSelected != null:
return timeSelected(_that);case PlaceTextChanged() when placeTextChanged != null:
return placeTextChanged(_that);case PlaceSearchRequested() when placeSearchRequested != null:
return placeSearchRequested(_that);case PlaceSelected() when placeSelected != null:
return placeSelected(_that);case PlaceCleared() when placeCleared != null:
return placeCleared(_that);case CategorySelected() when categorySelected != null:
return categorySelected(_that);case LoadTripMembers() when loadTripMembers != null:
return loadTripMembers(_that);case CrewAdded() when crewAdded != null:
return crewAdded(_that);case CrewRemoved() when crewRemoved != null:
return crewRemoved(_that);case SubmitPressed() when submitPressed != null:
return submitPressed(_that);case ExitRequested() when exitRequested != null:
return exitRequested(_that);case ExitConfirmed() when exitConfirmed != null:
return exitConfirmed(_that);case ClearMessage() when clearMessage != null:
return clearMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialized value)  initialized,required TResult Function( LoadScheduleMembers value)  loadScheduleMembers,required TResult Function( TitleChanged value)  titleChanged,required TResult Function( DescriptionChanged value)  descriptionChanged,required TResult Function( DateSelected value)  dateSelected,required TResult Function( TimeSelected value)  timeSelected,required TResult Function( PlaceTextChanged value)  placeTextChanged,required TResult Function( PlaceSearchRequested value)  placeSearchRequested,required TResult Function( PlaceSelected value)  placeSelected,required TResult Function( PlaceCleared value)  placeCleared,required TResult Function( CategorySelected value)  categorySelected,required TResult Function( LoadTripMembers value)  loadTripMembers,required TResult Function( CrewAdded value)  crewAdded,required TResult Function( CrewRemoved value)  crewRemoved,required TResult Function( SubmitPressed value)  submitPressed,required TResult Function( ExitRequested value)  exitRequested,required TResult Function( ExitConfirmed value)  exitConfirmed,required TResult Function( ClearMessage value)  clearMessage,}){
final _that = this;
switch (_that) {
case Initialized():
return initialized(_that);case LoadScheduleMembers():
return loadScheduleMembers(_that);case TitleChanged():
return titleChanged(_that);case DescriptionChanged():
return descriptionChanged(_that);case DateSelected():
return dateSelected(_that);case TimeSelected():
return timeSelected(_that);case PlaceTextChanged():
return placeTextChanged(_that);case PlaceSearchRequested():
return placeSearchRequested(_that);case PlaceSelected():
return placeSelected(_that);case PlaceCleared():
return placeCleared(_that);case CategorySelected():
return categorySelected(_that);case LoadTripMembers():
return loadTripMembers(_that);case CrewAdded():
return crewAdded(_that);case CrewRemoved():
return crewRemoved(_that);case SubmitPressed():
return submitPressed(_that);case ExitRequested():
return exitRequested(_that);case ExitConfirmed():
return exitConfirmed(_that);case ClearMessage():
return clearMessage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialized value)?  initialized,TResult? Function( LoadScheduleMembers value)?  loadScheduleMembers,TResult? Function( TitleChanged value)?  titleChanged,TResult? Function( DescriptionChanged value)?  descriptionChanged,TResult? Function( DateSelected value)?  dateSelected,TResult? Function( TimeSelected value)?  timeSelected,TResult? Function( PlaceTextChanged value)?  placeTextChanged,TResult? Function( PlaceSearchRequested value)?  placeSearchRequested,TResult? Function( PlaceSelected value)?  placeSelected,TResult? Function( PlaceCleared value)?  placeCleared,TResult? Function( CategorySelected value)?  categorySelected,TResult? Function( LoadTripMembers value)?  loadTripMembers,TResult? Function( CrewAdded value)?  crewAdded,TResult? Function( CrewRemoved value)?  crewRemoved,TResult? Function( SubmitPressed value)?  submitPressed,TResult? Function( ExitRequested value)?  exitRequested,TResult? Function( ExitConfirmed value)?  exitConfirmed,TResult? Function( ClearMessage value)?  clearMessage,}){
final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that);case LoadScheduleMembers() when loadScheduleMembers != null:
return loadScheduleMembers(_that);case TitleChanged() when titleChanged != null:
return titleChanged(_that);case DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case DateSelected() when dateSelected != null:
return dateSelected(_that);case TimeSelected() when timeSelected != null:
return timeSelected(_that);case PlaceTextChanged() when placeTextChanged != null:
return placeTextChanged(_that);case PlaceSearchRequested() when placeSearchRequested != null:
return placeSearchRequested(_that);case PlaceSelected() when placeSelected != null:
return placeSelected(_that);case PlaceCleared() when placeCleared != null:
return placeCleared(_that);case CategorySelected() when categorySelected != null:
return categorySelected(_that);case LoadTripMembers() when loadTripMembers != null:
return loadTripMembers(_that);case CrewAdded() when crewAdded != null:
return crewAdded(_that);case CrewRemoved() when crewRemoved != null:
return crewRemoved(_that);case SubmitPressed() when submitPressed != null:
return submitPressed(_that);case ExitRequested() when exitRequested != null:
return exitRequested(_that);case ExitConfirmed() when exitConfirmed != null:
return exitConfirmed(_that);case ClearMessage() when clearMessage != null:
return clearMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ScheduleEntity schedule)?  initialized,TResult Function()?  loadScheduleMembers,TResult Function( String title)?  titleChanged,TResult Function( String description)?  descriptionChanged,TResult Function( DateTime date)?  dateSelected,TResult Function( TimeOfDay time)?  timeSelected,TResult Function( String text)?  placeTextChanged,TResult Function()?  placeSearchRequested,TResult Function( String place,  String address,  double lat,  double lng)?  placeSelected,TResult Function()?  placeCleared,TResult Function( int categoryId)?  categorySelected,TResult Function()?  loadTripMembers,TResult Function( UserEntity user)?  crewAdded,TResult Function( int userId)?  crewRemoved,TResult Function()?  submitPressed,TResult Function()?  exitRequested,TResult Function()?  exitConfirmed,TResult Function()?  clearMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.schedule);case LoadScheduleMembers() when loadScheduleMembers != null:
return loadScheduleMembers();case TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case DateSelected() when dateSelected != null:
return dateSelected(_that.date);case TimeSelected() when timeSelected != null:
return timeSelected(_that.time);case PlaceTextChanged() when placeTextChanged != null:
return placeTextChanged(_that.text);case PlaceSearchRequested() when placeSearchRequested != null:
return placeSearchRequested();case PlaceSelected() when placeSelected != null:
return placeSelected(_that.place,_that.address,_that.lat,_that.lng);case PlaceCleared() when placeCleared != null:
return placeCleared();case CategorySelected() when categorySelected != null:
return categorySelected(_that.categoryId);case LoadTripMembers() when loadTripMembers != null:
return loadTripMembers();case CrewAdded() when crewAdded != null:
return crewAdded(_that.user);case CrewRemoved() when crewRemoved != null:
return crewRemoved(_that.userId);case SubmitPressed() when submitPressed != null:
return submitPressed();case ExitRequested() when exitRequested != null:
return exitRequested();case ExitConfirmed() when exitConfirmed != null:
return exitConfirmed();case ClearMessage() when clearMessage != null:
return clearMessage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ScheduleEntity schedule)  initialized,required TResult Function()  loadScheduleMembers,required TResult Function( String title)  titleChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( DateTime date)  dateSelected,required TResult Function( TimeOfDay time)  timeSelected,required TResult Function( String text)  placeTextChanged,required TResult Function()  placeSearchRequested,required TResult Function( String place,  String address,  double lat,  double lng)  placeSelected,required TResult Function()  placeCleared,required TResult Function( int categoryId)  categorySelected,required TResult Function()  loadTripMembers,required TResult Function( UserEntity user)  crewAdded,required TResult Function( int userId)  crewRemoved,required TResult Function()  submitPressed,required TResult Function()  exitRequested,required TResult Function()  exitConfirmed,required TResult Function()  clearMessage,}) {final _that = this;
switch (_that) {
case Initialized():
return initialized(_that.schedule);case LoadScheduleMembers():
return loadScheduleMembers();case TitleChanged():
return titleChanged(_that.title);case DescriptionChanged():
return descriptionChanged(_that.description);case DateSelected():
return dateSelected(_that.date);case TimeSelected():
return timeSelected(_that.time);case PlaceTextChanged():
return placeTextChanged(_that.text);case PlaceSearchRequested():
return placeSearchRequested();case PlaceSelected():
return placeSelected(_that.place,_that.address,_that.lat,_that.lng);case PlaceCleared():
return placeCleared();case CategorySelected():
return categorySelected(_that.categoryId);case LoadTripMembers():
return loadTripMembers();case CrewAdded():
return crewAdded(_that.user);case CrewRemoved():
return crewRemoved(_that.userId);case SubmitPressed():
return submitPressed();case ExitRequested():
return exitRequested();case ExitConfirmed():
return exitConfirmed();case ClearMessage():
return clearMessage();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ScheduleEntity schedule)?  initialized,TResult? Function()?  loadScheduleMembers,TResult? Function( String title)?  titleChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( DateTime date)?  dateSelected,TResult? Function( TimeOfDay time)?  timeSelected,TResult? Function( String text)?  placeTextChanged,TResult? Function()?  placeSearchRequested,TResult? Function( String place,  String address,  double lat,  double lng)?  placeSelected,TResult? Function()?  placeCleared,TResult? Function( int categoryId)?  categorySelected,TResult? Function()?  loadTripMembers,TResult? Function( UserEntity user)?  crewAdded,TResult? Function( int userId)?  crewRemoved,TResult? Function()?  submitPressed,TResult? Function()?  exitRequested,TResult? Function()?  exitConfirmed,TResult? Function()?  clearMessage,}) {final _that = this;
switch (_that) {
case Initialized() when initialized != null:
return initialized(_that.schedule);case LoadScheduleMembers() when loadScheduleMembers != null:
return loadScheduleMembers();case TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case DateSelected() when dateSelected != null:
return dateSelected(_that.date);case TimeSelected() when timeSelected != null:
return timeSelected(_that.time);case PlaceTextChanged() when placeTextChanged != null:
return placeTextChanged(_that.text);case PlaceSearchRequested() when placeSearchRequested != null:
return placeSearchRequested();case PlaceSelected() when placeSelected != null:
return placeSelected(_that.place,_that.address,_that.lat,_that.lng);case PlaceCleared() when placeCleared != null:
return placeCleared();case CategorySelected() when categorySelected != null:
return categorySelected(_that.categoryId);case LoadTripMembers() when loadTripMembers != null:
return loadTripMembers();case CrewAdded() when crewAdded != null:
return crewAdded(_that.user);case CrewRemoved() when crewRemoved != null:
return crewRemoved(_that.userId);case SubmitPressed() when submitPressed != null:
return submitPressed();case ExitRequested() when exitRequested != null:
return exitRequested();case ExitConfirmed() when exitConfirmed != null:
return exitConfirmed();case ClearMessage() when clearMessage != null:
return clearMessage();case _:
  return null;

}
}

}

/// @nodoc


class Initialized implements EditScheduleEvent {
  const Initialized({required this.schedule});
  

 final  ScheduleEntity schedule;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializedCopyWith<Initialized> get copyWith => _$InitializedCopyWithImpl<Initialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialized&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,schedule);

@override
String toString() {
  return 'EditScheduleEvent.initialized(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $InitializedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $InitializedCopyWith(Initialized value, $Res Function(Initialized) _then) = _$InitializedCopyWithImpl;
@useResult
$Res call({
 ScheduleEntity schedule
});


$ScheduleEntityCopyWith<$Res> get schedule;

}
/// @nodoc
class _$InitializedCopyWithImpl<$Res>
    implements $InitializedCopyWith<$Res> {
  _$InitializedCopyWithImpl(this._self, this._then);

  final Initialized _self;
  final $Res Function(Initialized) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(Initialized(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleEntity,
  ));
}

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<$Res> get schedule {
  
  return $ScheduleEntityCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}
}

/// @nodoc


class LoadScheduleMembers implements EditScheduleEvent {
  const LoadScheduleMembers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadScheduleMembers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.loadScheduleMembers()';
}


}




/// @nodoc


class TitleChanged implements EditScheduleEvent {
  const TitleChanged(this.title);
  

 final  String title;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleChangedCopyWith<TitleChanged> get copyWith => _$TitleChangedCopyWithImpl<TitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TitleChanged&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'EditScheduleEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class $TitleChangedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $TitleChangedCopyWith(TitleChanged value, $Res Function(TitleChanged) _then) = _$TitleChangedCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$TitleChangedCopyWithImpl<$Res>
    implements $TitleChangedCopyWith<$Res> {
  _$TitleChangedCopyWithImpl(this._self, this._then);

  final TitleChanged _self;
  final $Res Function(TitleChanged) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DescriptionChanged implements EditScheduleEvent {
  const DescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DescriptionChangedCopyWith<DescriptionChanged> get copyWith => _$DescriptionChangedCopyWithImpl<DescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DescriptionChanged&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'EditScheduleEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class $DescriptionChangedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $DescriptionChangedCopyWith(DescriptionChanged value, $Res Function(DescriptionChanged) _then) = _$DescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$DescriptionChangedCopyWithImpl<$Res>
    implements $DescriptionChangedCopyWith<$Res> {
  _$DescriptionChangedCopyWithImpl(this._self, this._then);

  final DescriptionChanged _self;
  final $Res Function(DescriptionChanged) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(DescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DateSelected implements EditScheduleEvent {
  const DateSelected(this.date);
  

 final  DateTime date;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateSelectedCopyWith<DateSelected> get copyWith => _$DateSelectedCopyWithImpl<DateSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateSelected&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'EditScheduleEvent.dateSelected(date: $date)';
}


}

/// @nodoc
abstract mixin class $DateSelectedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $DateSelectedCopyWith(DateSelected value, $Res Function(DateSelected) _then) = _$DateSelectedCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$DateSelectedCopyWithImpl<$Res>
    implements $DateSelectedCopyWith<$Res> {
  _$DateSelectedCopyWithImpl(this._self, this._then);

  final DateSelected _self;
  final $Res Function(DateSelected) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(DateSelected(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class TimeSelected implements EditScheduleEvent {
  const TimeSelected(this.time);
  

 final  TimeOfDay time;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSelectedCopyWith<TimeSelected> get copyWith => _$TimeSelectedCopyWithImpl<TimeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSelected&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'EditScheduleEvent.timeSelected(time: $time)';
}


}

/// @nodoc
abstract mixin class $TimeSelectedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $TimeSelectedCopyWith(TimeSelected value, $Res Function(TimeSelected) _then) = _$TimeSelectedCopyWithImpl;
@useResult
$Res call({
 TimeOfDay time
});




}
/// @nodoc
class _$TimeSelectedCopyWithImpl<$Res>
    implements $TimeSelectedCopyWith<$Res> {
  _$TimeSelectedCopyWithImpl(this._self, this._then);

  final TimeSelected _self;
  final $Res Function(TimeSelected) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(TimeSelected(
null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,
  ));
}


}

/// @nodoc


class PlaceTextChanged implements EditScheduleEvent {
  const PlaceTextChanged(this.text);
  

 final  String text;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceTextChangedCopyWith<PlaceTextChanged> get copyWith => _$PlaceTextChangedCopyWithImpl<PlaceTextChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceTextChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'EditScheduleEvent.placeTextChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class $PlaceTextChangedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $PlaceTextChangedCopyWith(PlaceTextChanged value, $Res Function(PlaceTextChanged) _then) = _$PlaceTextChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$PlaceTextChangedCopyWithImpl<$Res>
    implements $PlaceTextChangedCopyWith<$Res> {
  _$PlaceTextChangedCopyWithImpl(this._self, this._then);

  final PlaceTextChanged _self;
  final $Res Function(PlaceTextChanged) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(PlaceTextChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlaceSearchRequested implements EditScheduleEvent {
  const PlaceSearchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceSearchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.placeSearchRequested()';
}


}




/// @nodoc


class PlaceSelected implements EditScheduleEvent {
  const PlaceSelected({required this.place, required this.address, required this.lat, required this.lng});
  

 final  String place;
 final  String address;
 final  double lat;
 final  double lng;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceSelectedCopyWith<PlaceSelected> get copyWith => _$PlaceSelectedCopyWithImpl<PlaceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceSelected&&(identical(other.place, place) || other.place == place)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,place,address,lat,lng);

@override
String toString() {
  return 'EditScheduleEvent.placeSelected(place: $place, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $PlaceSelectedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $PlaceSelectedCopyWith(PlaceSelected value, $Res Function(PlaceSelected) _then) = _$PlaceSelectedCopyWithImpl;
@useResult
$Res call({
 String place, String address, double lat, double lng
});




}
/// @nodoc
class _$PlaceSelectedCopyWithImpl<$Res>
    implements $PlaceSelectedCopyWith<$Res> {
  _$PlaceSelectedCopyWithImpl(this._self, this._then);

  final PlaceSelected _self;
  final $Res Function(PlaceSelected) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? place = null,Object? address = null,Object? lat = null,Object? lng = null,}) {
  return _then(PlaceSelected(
place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PlaceCleared implements EditScheduleEvent {
  const PlaceCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.placeCleared()';
}


}




/// @nodoc


class CategorySelected implements EditScheduleEvent {
  const CategorySelected(this.categoryId);
  

 final  int categoryId;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySelectedCopyWith<CategorySelected> get copyWith => _$CategorySelectedCopyWithImpl<CategorySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySelected&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'EditScheduleEvent.categorySelected(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CategorySelectedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $CategorySelectedCopyWith(CategorySelected value, $Res Function(CategorySelected) _then) = _$CategorySelectedCopyWithImpl;
@useResult
$Res call({
 int categoryId
});




}
/// @nodoc
class _$CategorySelectedCopyWithImpl<$Res>
    implements $CategorySelectedCopyWith<$Res> {
  _$CategorySelectedCopyWithImpl(this._self, this._then);

  final CategorySelected _self;
  final $Res Function(CategorySelected) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(CategorySelected(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadTripMembers implements EditScheduleEvent {
  const LoadTripMembers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTripMembers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.loadTripMembers()';
}


}




/// @nodoc


class CrewAdded implements EditScheduleEvent {
  const CrewAdded(this.user);
  

 final  UserEntity user;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrewAddedCopyWith<CrewAdded> get copyWith => _$CrewAddedCopyWithImpl<CrewAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrewAdded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'EditScheduleEvent.crewAdded(user: $user)';
}


}

/// @nodoc
abstract mixin class $CrewAddedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $CrewAddedCopyWith(CrewAdded value, $Res Function(CrewAdded) _then) = _$CrewAddedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$CrewAddedCopyWithImpl<$Res>
    implements $CrewAddedCopyWith<$Res> {
  _$CrewAddedCopyWithImpl(this._self, this._then);

  final CrewAdded _self;
  final $Res Function(CrewAdded) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(CrewAdded(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class CrewRemoved implements EditScheduleEvent {
  const CrewRemoved(this.userId);
  

 final  int userId;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrewRemovedCopyWith<CrewRemoved> get copyWith => _$CrewRemovedCopyWithImpl<CrewRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrewRemoved&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'EditScheduleEvent.crewRemoved(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CrewRemovedCopyWith<$Res> implements $EditScheduleEventCopyWith<$Res> {
  factory $CrewRemovedCopyWith(CrewRemoved value, $Res Function(CrewRemoved) _then) = _$CrewRemovedCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$CrewRemovedCopyWithImpl<$Res>
    implements $CrewRemovedCopyWith<$Res> {
  _$CrewRemovedCopyWithImpl(this._self, this._then);

  final CrewRemoved _self;
  final $Res Function(CrewRemoved) _then;

/// Create a copy of EditScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(CrewRemoved(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SubmitPressed implements EditScheduleEvent {
  const SubmitPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.submitPressed()';
}


}




/// @nodoc


class ExitRequested implements EditScheduleEvent {
  const ExitRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExitRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.exitRequested()';
}


}




/// @nodoc


class ExitConfirmed implements EditScheduleEvent {
  const ExitConfirmed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExitConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.exitConfirmed()';
}


}




/// @nodoc


class ClearMessage implements EditScheduleEvent {
  const ClearMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditScheduleEvent.clearMessage()';
}


}




// dart format on
