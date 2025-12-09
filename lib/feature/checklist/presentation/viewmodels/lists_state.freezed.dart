// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListsState {

// 정보 조회
 int get tripId; int get userId;// 현재 탭
 ListsTab get currentTab;// 체크리스트(짐목록)
 List<ChecklistEntity> get checklists;// 투두리스트(할일목록)
 List<TodoListEntity> get todolists;// 입력필드 (새 항목 추가용)
 String get newItemContent;// 메시지
 String? get message;// 페이지 상태
 ListsPageState get pageState; bool get isLoading;
/// Create a copy of ListsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListsStateCopyWith<ListsState> get copyWith => _$ListsStateCopyWithImpl<ListsState>(this as ListsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListsState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other.checklists, checklists)&&const DeepCollectionEquality().equals(other.todolists, todolists)&&(identical(other.newItemContent, newItemContent) || other.newItemContent == newItemContent)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,currentTab,const DeepCollectionEquality().hash(checklists),const DeepCollectionEquality().hash(todolists),newItemContent,message,pageState,isLoading);

@override
String toString() {
  return 'ListsState(tripId: $tripId, userId: $userId, currentTab: $currentTab, checklists: $checklists, todolists: $todolists, newItemContent: $newItemContent, message: $message, pageState: $pageState, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ListsStateCopyWith<$Res>  {
  factory $ListsStateCopyWith(ListsState value, $Res Function(ListsState) _then) = _$ListsStateCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId, ListsTab currentTab, List<ChecklistEntity> checklists, List<TodoListEntity> todolists, String newItemContent, String? message, ListsPageState pageState, bool isLoading
});




}
/// @nodoc
class _$ListsStateCopyWithImpl<$Res>
    implements $ListsStateCopyWith<$Res> {
  _$ListsStateCopyWithImpl(this._self, this._then);

  final ListsState _self;
  final $Res Function(ListsState) _then;

/// Create a copy of ListsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? userId = null,Object? currentTab = null,Object? checklists = null,Object? todolists = null,Object? newItemContent = null,Object? message = freezed,Object? pageState = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as ListsTab,checklists: null == checklists ? _self.checklists : checklists // ignore: cast_nullable_to_non_nullable
as List<ChecklistEntity>,todolists: null == todolists ? _self.todolists : todolists // ignore: cast_nullable_to_non_nullable
as List<TodoListEntity>,newItemContent: null == newItemContent ? _self.newItemContent : newItemContent // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ListsPageState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListsState].
extension ListsStatePatterns on ListsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListsState value)  $default,){
final _that = this;
switch (_that) {
case _ListsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListsState value)?  $default,){
final _that = this;
switch (_that) {
case _ListsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int userId,  ListsTab currentTab,  List<ChecklistEntity> checklists,  List<TodoListEntity> todolists,  String newItemContent,  String? message,  ListsPageState pageState,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListsState() when $default != null:
return $default(_that.tripId,_that.userId,_that.currentTab,_that.checklists,_that.todolists,_that.newItemContent,_that.message,_that.pageState,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int userId,  ListsTab currentTab,  List<ChecklistEntity> checklists,  List<TodoListEntity> todolists,  String newItemContent,  String? message,  ListsPageState pageState,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _ListsState():
return $default(_that.tripId,_that.userId,_that.currentTab,_that.checklists,_that.todolists,_that.newItemContent,_that.message,_that.pageState,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int userId,  ListsTab currentTab,  List<ChecklistEntity> checklists,  List<TodoListEntity> todolists,  String newItemContent,  String? message,  ListsPageState pageState,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _ListsState() when $default != null:
return $default(_that.tripId,_that.userId,_that.currentTab,_that.checklists,_that.todolists,_that.newItemContent,_that.message,_that.pageState,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ListsState extends ListsState {
  const _ListsState({this.tripId = 0, this.userId = 0, this.currentTab = ListsTab.checklist, final  List<ChecklistEntity> checklists = const [], final  List<TodoListEntity> todolists = const [], this.newItemContent = '', this.message, this.pageState = ListsPageState.initial, this.isLoading = false}): _checklists = checklists,_todolists = todolists,super._();
  

// 정보 조회
@override@JsonKey() final  int tripId;
@override@JsonKey() final  int userId;
// 현재 탭
@override@JsonKey() final  ListsTab currentTab;
// 체크리스트(짐목록)
 final  List<ChecklistEntity> _checklists;
// 체크리스트(짐목록)
@override@JsonKey() List<ChecklistEntity> get checklists {
  if (_checklists is EqualUnmodifiableListView) return _checklists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklists);
}

// 투두리스트(할일목록)
 final  List<TodoListEntity> _todolists;
// 투두리스트(할일목록)
@override@JsonKey() List<TodoListEntity> get todolists {
  if (_todolists is EqualUnmodifiableListView) return _todolists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todolists);
}

// 입력필드 (새 항목 추가용)
@override@JsonKey() final  String newItemContent;
// 메시지
@override final  String? message;
// 페이지 상태
@override@JsonKey() final  ListsPageState pageState;
@override@JsonKey() final  bool isLoading;

/// Create a copy of ListsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListsStateCopyWith<_ListsState> get copyWith => __$ListsStateCopyWithImpl<_ListsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListsState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other._checklists, _checklists)&&const DeepCollectionEquality().equals(other._todolists, _todolists)&&(identical(other.newItemContent, newItemContent) || other.newItemContent == newItemContent)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId,currentTab,const DeepCollectionEquality().hash(_checklists),const DeepCollectionEquality().hash(_todolists),newItemContent,message,pageState,isLoading);

@override
String toString() {
  return 'ListsState(tripId: $tripId, userId: $userId, currentTab: $currentTab, checklists: $checklists, todolists: $todolists, newItemContent: $newItemContent, message: $message, pageState: $pageState, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ListsStateCopyWith<$Res> implements $ListsStateCopyWith<$Res> {
  factory _$ListsStateCopyWith(_ListsState value, $Res Function(_ListsState) _then) = __$ListsStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int userId, ListsTab currentTab, List<ChecklistEntity> checklists, List<TodoListEntity> todolists, String newItemContent, String? message, ListsPageState pageState, bool isLoading
});




}
/// @nodoc
class __$ListsStateCopyWithImpl<$Res>
    implements _$ListsStateCopyWith<$Res> {
  __$ListsStateCopyWithImpl(this._self, this._then);

  final _ListsState _self;
  final $Res Function(_ListsState) _then;

/// Create a copy of ListsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,Object? currentTab = null,Object? checklists = null,Object? todolists = null,Object? newItemContent = null,Object? message = freezed,Object? pageState = null,Object? isLoading = null,}) {
  return _then(_ListsState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as ListsTab,checklists: null == checklists ? _self._checklists : checklists // ignore: cast_nullable_to_non_nullable
as List<ChecklistEntity>,todolists: null == todolists ? _self._todolists : todolists // ignore: cast_nullable_to_non_nullable
as List<TodoListEntity>,newItemContent: null == newItemContent ? _self.newItemContent : newItemContent // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ListsPageState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
