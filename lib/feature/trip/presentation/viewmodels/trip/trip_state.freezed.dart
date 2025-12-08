// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripState {

//조회정보
 TripEntity? get selectedTrip;//getmytrip -> 여행 리스트
 List<TripEntity>? get trips;//검색한 결과에 따른 리스트
 List<TripEntity>? get searchTrips;//검색어 상태
 String? get userSearch;//서치 아이콘과 필드가 나오는조건
 bool get search;//정렬 했냐 안했냐 조건?
 SortingTrip get sorting;//리스트 불러올때 페이징 하게하는 state
 int get currentPage;//페이지 state
 TripPageState get pageState; bool get hasMore; bool get isLoadingMore;// 메세지 (성공/에러)
 String? get message; String? get errorType; String? get actionType;
/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripStateCopyWith<TripState> get copyWith => _$TripStateCopyWithImpl<TripState>(this as TripState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripState&&(identical(other.selectedTrip, selectedTrip) || other.selectedTrip == selectedTrip)&&const DeepCollectionEquality().equals(other.trips, trips)&&const DeepCollectionEquality().equals(other.searchTrips, searchTrips)&&(identical(other.userSearch, userSearch) || other.userSearch == userSearch)&&(identical(other.search, search) || other.search == search)&&(identical(other.sorting, sorting) || other.sorting == sorting)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTrip,const DeepCollectionEquality().hash(trips),const DeepCollectionEquality().hash(searchTrips),userSearch,search,sorting,currentPage,pageState,hasMore,isLoadingMore,message,errorType,actionType);

@override
String toString() {
  return 'TripState(selectedTrip: $selectedTrip, trips: $trips, searchTrips: $searchTrips, userSearch: $userSearch, search: $search, sorting: $sorting, currentPage: $currentPage, pageState: $pageState, hasMore: $hasMore, isLoadingMore: $isLoadingMore, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $TripStateCopyWith<$Res>  {
  factory $TripStateCopyWith(TripState value, $Res Function(TripState) _then) = _$TripStateCopyWithImpl;
@useResult
$Res call({
 TripEntity? selectedTrip, List<TripEntity>? trips, List<TripEntity>? searchTrips, String? userSearch, bool search, SortingTrip sorting, int currentPage, TripPageState pageState, bool hasMore, bool isLoadingMore, String? message, String? errorType, String? actionType
});


$TripEntityCopyWith<$Res>? get selectedTrip;

}
/// @nodoc
class _$TripStateCopyWithImpl<$Res>
    implements $TripStateCopyWith<$Res> {
  _$TripStateCopyWithImpl(this._self, this._then);

  final TripState _self;
  final $Res Function(TripState) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTrip = freezed,Object? trips = freezed,Object? searchTrips = freezed,Object? userSearch = freezed,Object? search = null,Object? sorting = null,Object? currentPage = null,Object? pageState = null,Object? hasMore = null,Object? isLoadingMore = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_self.copyWith(
selectedTrip: freezed == selectedTrip ? _self.selectedTrip : selectedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,trips: freezed == trips ? _self.trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>?,searchTrips: freezed == searchTrips ? _self.searchTrips : searchTrips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>?,userSearch: freezed == userSearch ? _self.userSearch : userSearch // ignore: cast_nullable_to_non_nullable
as String?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as bool,sorting: null == sorting ? _self.sorting : sorting // ignore: cast_nullable_to_non_nullable
as SortingTrip,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripPageState,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TripState
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


/// Adds pattern-matching-related methods to [TripState].
extension TripStatePatterns on TripState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripState value)  $default,){
final _that = this;
switch (_that) {
case _TripState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripState value)?  $default,){
final _that = this;
switch (_that) {
case _TripState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripEntity? selectedTrip,  List<TripEntity>? trips,  List<TripEntity>? searchTrips,  String? userSearch,  bool search,  SortingTrip sorting,  int currentPage,  TripPageState pageState,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripState() when $default != null:
return $default(_that.selectedTrip,_that.trips,_that.searchTrips,_that.userSearch,_that.search,_that.sorting,_that.currentPage,_that.pageState,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripEntity? selectedTrip,  List<TripEntity>? trips,  List<TripEntity>? searchTrips,  String? userSearch,  bool search,  SortingTrip sorting,  int currentPage,  TripPageState pageState,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType)  $default,) {final _that = this;
switch (_that) {
case _TripState():
return $default(_that.selectedTrip,_that.trips,_that.searchTrips,_that.userSearch,_that.search,_that.sorting,_that.currentPage,_that.pageState,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripEntity? selectedTrip,  List<TripEntity>? trips,  List<TripEntity>? searchTrips,  String? userSearch,  bool search,  SortingTrip sorting,  int currentPage,  TripPageState pageState,  bool hasMore,  bool isLoadingMore,  String? message,  String? errorType,  String? actionType)?  $default,) {final _that = this;
switch (_that) {
case _TripState() when $default != null:
return $default(_that.selectedTrip,_that.trips,_that.searchTrips,_that.userSearch,_that.search,_that.sorting,_that.currentPage,_that.pageState,_that.hasMore,_that.isLoadingMore,_that.message,_that.errorType,_that.actionType);case _:
  return null;

}
}

}

/// @nodoc


class _TripState implements TripState {
  const _TripState({this.selectedTrip, required final  List<TripEntity>? trips, final  List<TripEntity>? searchTrips, this.userSearch, this.search = false, this.sorting = SortingTrip.recent, this.currentPage = 1, this.pageState = TripPageState.init, this.hasMore = false, this.isLoadingMore = false, this.message, this.errorType, this.actionType}): _trips = trips,_searchTrips = searchTrips;
  

//조회정보
@override final  TripEntity? selectedTrip;
//getmytrip -> 여행 리스트
 final  List<TripEntity>? _trips;
//getmytrip -> 여행 리스트
@override List<TripEntity>? get trips {
  final value = _trips;
  if (value == null) return null;
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

//검색한 결과에 따른 리스트
 final  List<TripEntity>? _searchTrips;
//검색한 결과에 따른 리스트
@override List<TripEntity>? get searchTrips {
  final value = _searchTrips;
  if (value == null) return null;
  if (_searchTrips is EqualUnmodifiableListView) return _searchTrips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

//검색어 상태
@override final  String? userSearch;
//서치 아이콘과 필드가 나오는조건
@override@JsonKey() final  bool search;
//정렬 했냐 안했냐 조건?
@override@JsonKey() final  SortingTrip sorting;
//리스트 불러올때 페이징 하게하는 state
@override@JsonKey() final  int currentPage;
//페이지 state
@override@JsonKey() final  TripPageState pageState;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
// 메세지 (성공/에러)
@override final  String? message;
@override final  String? errorType;
@override final  String? actionType;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripStateCopyWith<_TripState> get copyWith => __$TripStateCopyWithImpl<_TripState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripState&&(identical(other.selectedTrip, selectedTrip) || other.selectedTrip == selectedTrip)&&const DeepCollectionEquality().equals(other._trips, _trips)&&const DeepCollectionEquality().equals(other._searchTrips, _searchTrips)&&(identical(other.userSearch, userSearch) || other.userSearch == userSearch)&&(identical(other.search, search) || other.search == search)&&(identical(other.sorting, sorting) || other.sorting == sorting)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTrip,const DeepCollectionEquality().hash(_trips),const DeepCollectionEquality().hash(_searchTrips),userSearch,search,sorting,currentPage,pageState,hasMore,isLoadingMore,message,errorType,actionType);

@override
String toString() {
  return 'TripState(selectedTrip: $selectedTrip, trips: $trips, searchTrips: $searchTrips, userSearch: $userSearch, search: $search, sorting: $sorting, currentPage: $currentPage, pageState: $pageState, hasMore: $hasMore, isLoadingMore: $isLoadingMore, message: $message, errorType: $errorType, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class _$TripStateCopyWith<$Res> implements $TripStateCopyWith<$Res> {
  factory _$TripStateCopyWith(_TripState value, $Res Function(_TripState) _then) = __$TripStateCopyWithImpl;
@override @useResult
$Res call({
 TripEntity? selectedTrip, List<TripEntity>? trips, List<TripEntity>? searchTrips, String? userSearch, bool search, SortingTrip sorting, int currentPage, TripPageState pageState, bool hasMore, bool isLoadingMore, String? message, String? errorType, String? actionType
});


@override $TripEntityCopyWith<$Res>? get selectedTrip;

}
/// @nodoc
class __$TripStateCopyWithImpl<$Res>
    implements _$TripStateCopyWith<$Res> {
  __$TripStateCopyWithImpl(this._self, this._then);

  final _TripState _self;
  final $Res Function(_TripState) _then;

/// Create a copy of TripState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTrip = freezed,Object? trips = freezed,Object? searchTrips = freezed,Object? userSearch = freezed,Object? search = null,Object? sorting = null,Object? currentPage = null,Object? pageState = null,Object? hasMore = null,Object? isLoadingMore = null,Object? message = freezed,Object? errorType = freezed,Object? actionType = freezed,}) {
  return _then(_TripState(
selectedTrip: freezed == selectedTrip ? _self.selectedTrip : selectedTrip // ignore: cast_nullable_to_non_nullable
as TripEntity?,trips: freezed == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>?,searchTrips: freezed == searchTrips ? _self._searchTrips : searchTrips // ignore: cast_nullable_to_non_nullable
as List<TripEntity>?,userSearch: freezed == userSearch ? _self.userSearch : userSearch // ignore: cast_nullable_to_non_nullable
as String?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as bool,sorting: null == sorting ? _self.sorting : sorting // ignore: cast_nullable_to_non_nullable
as SortingTrip,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as TripPageState,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TripState
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
