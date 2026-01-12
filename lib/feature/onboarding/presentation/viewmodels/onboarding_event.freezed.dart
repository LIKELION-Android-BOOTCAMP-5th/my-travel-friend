// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialize value)?  initialize,TResult Function( NextPage value)?  nextPage,TResult Function( PrevPage value)?  prevPage,TResult Function( GoToPage value)?  goToPage,TResult Function( Skip value)?  skip,TResult Function( Complete value)?  complete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case NextPage() when nextPage != null:
return nextPage(_that);case PrevPage() when prevPage != null:
return prevPage(_that);case GoToPage() when goToPage != null:
return goToPage(_that);case Skip() when skip != null:
return skip(_that);case Complete() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialize value)  initialize,required TResult Function( NextPage value)  nextPage,required TResult Function( PrevPage value)  prevPage,required TResult Function( GoToPage value)  goToPage,required TResult Function( Skip value)  skip,required TResult Function( Complete value)  complete,}){
final _that = this;
switch (_that) {
case Initialize():
return initialize(_that);case NextPage():
return nextPage(_that);case PrevPage():
return prevPage(_that);case GoToPage():
return goToPage(_that);case Skip():
return skip(_that);case Complete():
return complete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialize value)?  initialize,TResult? Function( NextPage value)?  nextPage,TResult? Function( PrevPage value)?  prevPage,TResult? Function( GoToPage value)?  goToPage,TResult? Function( Skip value)?  skip,TResult? Function( Complete value)?  complete,}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case NextPage() when nextPage != null:
return nextPage(_that);case PrevPage() when prevPage != null:
return prevPage(_that);case GoToPage() when goToPage != null:
return goToPage(_that);case Skip() when skip != null:
return skip(_that);case Complete() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  nextPage,TResult Function()?  prevPage,TResult Function( int pageIndex)?  goToPage,TResult Function()?  skip,TResult Function()?  complete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize();case NextPage() when nextPage != null:
return nextPage();case PrevPage() when prevPage != null:
return prevPage();case GoToPage() when goToPage != null:
return goToPage(_that.pageIndex);case Skip() when skip != null:
return skip();case Complete() when complete != null:
return complete();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  nextPage,required TResult Function()  prevPage,required TResult Function( int pageIndex)  goToPage,required TResult Function()  skip,required TResult Function()  complete,}) {final _that = this;
switch (_that) {
case Initialize():
return initialize();case NextPage():
return nextPage();case PrevPage():
return prevPage();case GoToPage():
return goToPage(_that.pageIndex);case Skip():
return skip();case Complete():
return complete();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  nextPage,TResult? Function()?  prevPage,TResult? Function( int pageIndex)?  goToPage,TResult? Function()?  skip,TResult? Function()?  complete,}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize();case NextPage() when nextPage != null:
return nextPage();case PrevPage() when prevPage != null:
return prevPage();case GoToPage() when goToPage != null:
return goToPage(_that.pageIndex);case Skip() when skip != null:
return skip();case Complete() when complete != null:
return complete();case _:
  return null;

}
}

}

/// @nodoc


class Initialize implements OnboardingEvent {
  const Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.initialize()';
}


}




/// @nodoc


class NextPage implements OnboardingEvent {
  const NextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.nextPage()';
}


}




/// @nodoc


class PrevPage implements OnboardingEvent {
  const PrevPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrevPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.prevPage()';
}


}




/// @nodoc


class GoToPage implements OnboardingEvent {
  const GoToPage({required this.pageIndex});
  

 final  int pageIndex;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoToPageCopyWith<GoToPage> get copyWith => _$GoToPageCopyWithImpl<GoToPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoToPage&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex);

@override
String toString() {
  return 'OnboardingEvent.goToPage(pageIndex: $pageIndex)';
}


}

/// @nodoc
abstract mixin class $GoToPageCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $GoToPageCopyWith(GoToPage value, $Res Function(GoToPage) _then) = _$GoToPageCopyWithImpl;
@useResult
$Res call({
 int pageIndex
});




}
/// @nodoc
class _$GoToPageCopyWithImpl<$Res>
    implements $GoToPageCopyWith<$Res> {
  _$GoToPageCopyWithImpl(this._self, this._then);

  final GoToPage _self;
  final $Res Function(GoToPage) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,}) {
  return _then(GoToPage(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Skip implements OnboardingEvent {
  const Skip();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Skip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.skip()';
}


}




/// @nodoc


class Complete implements OnboardingEvent {
  const Complete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Complete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.complete()';
}


}




// dart format on
