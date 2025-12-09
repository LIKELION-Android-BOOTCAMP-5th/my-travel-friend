// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListsEvent()';
}


}

/// @nodoc
class $ListsEventCopyWith<$Res>  {
$ListsEventCopyWith(ListsEvent _, $Res Function(ListsEvent) __);
}


/// Adds pattern-matching-related methods to [ListsEvent].
extension ListsEventPatterns on ListsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Load value)?  load,TResult Function( ChangeTab value)?  changeTab,TResult Function( ChangeContent value)?  changeContent,TResult Function( CreateChecklist value)?  createChecklist,TResult Function( DeleteChecklist value)?  deleteChecklist,TResult Function( ToggleChecklist value)?  toggleChecklist,TResult Function( CreateTodoList value)?  createTodoList,TResult Function( DeleteTodoList value)?  deleteTodoList,TResult Function( ToggleTodoList value)?  toggleTodoList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that);case ChangeTab() when changeTab != null:
return changeTab(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case CreateChecklist() when createChecklist != null:
return createChecklist(_that);case DeleteChecklist() when deleteChecklist != null:
return deleteChecklist(_that);case ToggleChecklist() when toggleChecklist != null:
return toggleChecklist(_that);case CreateTodoList() when createTodoList != null:
return createTodoList(_that);case DeleteTodoList() when deleteTodoList != null:
return deleteTodoList(_that);case ToggleTodoList() when toggleTodoList != null:
return toggleTodoList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Load value)  load,required TResult Function( ChangeTab value)  changeTab,required TResult Function( ChangeContent value)  changeContent,required TResult Function( CreateChecklist value)  createChecklist,required TResult Function( DeleteChecklist value)  deleteChecklist,required TResult Function( ToggleChecklist value)  toggleChecklist,required TResult Function( CreateTodoList value)  createTodoList,required TResult Function( DeleteTodoList value)  deleteTodoList,required TResult Function( ToggleTodoList value)  toggleTodoList,}){
final _that = this;
switch (_that) {
case Load():
return load(_that);case ChangeTab():
return changeTab(_that);case ChangeContent():
return changeContent(_that);case CreateChecklist():
return createChecklist(_that);case DeleteChecklist():
return deleteChecklist(_that);case ToggleChecklist():
return toggleChecklist(_that);case CreateTodoList():
return createTodoList(_that);case DeleteTodoList():
return deleteTodoList(_that);case ToggleTodoList():
return toggleTodoList(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Load value)?  load,TResult? Function( ChangeTab value)?  changeTab,TResult? Function( ChangeContent value)?  changeContent,TResult? Function( CreateChecklist value)?  createChecklist,TResult? Function( DeleteChecklist value)?  deleteChecklist,TResult? Function( ToggleChecklist value)?  toggleChecklist,TResult? Function( CreateTodoList value)?  createTodoList,TResult? Function( DeleteTodoList value)?  deleteTodoList,TResult? Function( ToggleTodoList value)?  toggleTodoList,}){
final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that);case ChangeTab() when changeTab != null:
return changeTab(_that);case ChangeContent() when changeContent != null:
return changeContent(_that);case CreateChecklist() when createChecklist != null:
return createChecklist(_that);case DeleteChecklist() when deleteChecklist != null:
return deleteChecklist(_that);case ToggleChecklist() when toggleChecklist != null:
return toggleChecklist(_that);case CreateTodoList() when createTodoList != null:
return createTodoList(_that);case DeleteTodoList() when deleteTodoList != null:
return deleteTodoList(_that);case ToggleTodoList() when toggleTodoList != null:
return toggleTodoList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int tripId,  int userId)?  load,TResult Function( ListsTab tab)?  changeTab,TResult Function( String content)?  changeContent,TResult Function()?  createChecklist,TResult Function( int id)?  deleteChecklist,TResult Function( int id,  bool isChecked)?  toggleChecklist,TResult Function()?  createTodoList,TResult Function( int id)?  deleteTodoList,TResult Function( int id,  bool isChecked)?  toggleTodoList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that.tripId,_that.userId);case ChangeTab() when changeTab != null:
return changeTab(_that.tab);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case CreateChecklist() when createChecklist != null:
return createChecklist();case DeleteChecklist() when deleteChecklist != null:
return deleteChecklist(_that.id);case ToggleChecklist() when toggleChecklist != null:
return toggleChecklist(_that.id,_that.isChecked);case CreateTodoList() when createTodoList != null:
return createTodoList();case DeleteTodoList() when deleteTodoList != null:
return deleteTodoList(_that.id);case ToggleTodoList() when toggleTodoList != null:
return toggleTodoList(_that.id,_that.isChecked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int tripId,  int userId)  load,required TResult Function( ListsTab tab)  changeTab,required TResult Function( String content)  changeContent,required TResult Function()  createChecklist,required TResult Function( int id)  deleteChecklist,required TResult Function( int id,  bool isChecked)  toggleChecklist,required TResult Function()  createTodoList,required TResult Function( int id)  deleteTodoList,required TResult Function( int id,  bool isChecked)  toggleTodoList,}) {final _that = this;
switch (_that) {
case Load():
return load(_that.tripId,_that.userId);case ChangeTab():
return changeTab(_that.tab);case ChangeContent():
return changeContent(_that.content);case CreateChecklist():
return createChecklist();case DeleteChecklist():
return deleteChecklist(_that.id);case ToggleChecklist():
return toggleChecklist(_that.id,_that.isChecked);case CreateTodoList():
return createTodoList();case DeleteTodoList():
return deleteTodoList(_that.id);case ToggleTodoList():
return toggleTodoList(_that.id,_that.isChecked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int tripId,  int userId)?  load,TResult? Function( ListsTab tab)?  changeTab,TResult? Function( String content)?  changeContent,TResult? Function()?  createChecklist,TResult? Function( int id)?  deleteChecklist,TResult? Function( int id,  bool isChecked)?  toggleChecklist,TResult? Function()?  createTodoList,TResult? Function( int id)?  deleteTodoList,TResult? Function( int id,  bool isChecked)?  toggleTodoList,}) {final _that = this;
switch (_that) {
case Load() when load != null:
return load(_that.tripId,_that.userId);case ChangeTab() when changeTab != null:
return changeTab(_that.tab);case ChangeContent() when changeContent != null:
return changeContent(_that.content);case CreateChecklist() when createChecklist != null:
return createChecklist();case DeleteChecklist() when deleteChecklist != null:
return deleteChecklist(_that.id);case ToggleChecklist() when toggleChecklist != null:
return toggleChecklist(_that.id,_that.isChecked);case CreateTodoList() when createTodoList != null:
return createTodoList();case DeleteTodoList() when deleteTodoList != null:
return deleteTodoList(_that.id);case ToggleTodoList() when toggleTodoList != null:
return toggleTodoList(_that.id,_that.isChecked);case _:
  return null;

}
}

}

/// @nodoc


class Load extends ListsEvent {
  const Load({required this.tripId, required this.userId}): super._();
  

 final  int tripId;
 final  int userId;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadCopyWith<Load> get copyWith => _$LoadCopyWithImpl<Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Load&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,userId);

@override
String toString() {
  return 'ListsEvent.load(tripId: $tripId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $LoadCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) _then) = _$LoadCopyWithImpl;
@useResult
$Res call({
 int tripId, int userId
});




}
/// @nodoc
class _$LoadCopyWithImpl<$Res>
    implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(this._self, this._then);

  final Load _self;
  final $Res Function(Load) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? userId = null,}) {
  return _then(Load(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ChangeTab extends ListsEvent {
  const ChangeTab({required this.tab}): super._();
  

 final  ListsTab tab;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeTabCopyWith<ChangeTab> get copyWith => _$ChangeTabCopyWithImpl<ChangeTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTab&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'ListsEvent.changeTab(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $ChangeTabCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $ChangeTabCopyWith(ChangeTab value, $Res Function(ChangeTab) _then) = _$ChangeTabCopyWithImpl;
@useResult
$Res call({
 ListsTab tab
});




}
/// @nodoc
class _$ChangeTabCopyWithImpl<$Res>
    implements $ChangeTabCopyWith<$Res> {
  _$ChangeTabCopyWithImpl(this._self, this._then);

  final ChangeTab _self;
  final $Res Function(ChangeTab) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(ChangeTab(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ListsTab,
  ));
}


}

/// @nodoc


class ChangeContent extends ListsEvent {
  const ChangeContent({required this.content}): super._();
  

 final  String content;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeContentCopyWith<ChangeContent> get copyWith => _$ChangeContentCopyWithImpl<ChangeContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeContent&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'ListsEvent.changeContent(content: $content)';
}


}

/// @nodoc
abstract mixin class $ChangeContentCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $ChangeContentCopyWith(ChangeContent value, $Res Function(ChangeContent) _then) = _$ChangeContentCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ChangeContentCopyWithImpl<$Res>
    implements $ChangeContentCopyWith<$Res> {
  _$ChangeContentCopyWithImpl(this._self, this._then);

  final ChangeContent _self;
  final $Res Function(ChangeContent) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(ChangeContent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateChecklist extends ListsEvent {
  const CreateChecklist(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChecklist);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListsEvent.createChecklist()';
}


}




/// @nodoc


class DeleteChecklist extends ListsEvent {
  const DeleteChecklist({required this.id}): super._();
  

 final  int id;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteChecklistCopyWith<DeleteChecklist> get copyWith => _$DeleteChecklistCopyWithImpl<DeleteChecklist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteChecklist&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ListsEvent.deleteChecklist(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteChecklistCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $DeleteChecklistCopyWith(DeleteChecklist value, $Res Function(DeleteChecklist) _then) = _$DeleteChecklistCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteChecklistCopyWithImpl<$Res>
    implements $DeleteChecklistCopyWith<$Res> {
  _$DeleteChecklistCopyWithImpl(this._self, this._then);

  final DeleteChecklist _self;
  final $Res Function(DeleteChecklist) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteChecklist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ToggleChecklist extends ListsEvent {
  const ToggleChecklist({required this.id, required this.isChecked}): super._();
  

 final  int id;
 final  bool isChecked;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleChecklistCopyWith<ToggleChecklist> get copyWith => _$ToggleChecklistCopyWithImpl<ToggleChecklist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleChecklist&&(identical(other.id, id) || other.id == id)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,isChecked);

@override
String toString() {
  return 'ListsEvent.toggleChecklist(id: $id, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class $ToggleChecklistCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $ToggleChecklistCopyWith(ToggleChecklist value, $Res Function(ToggleChecklist) _then) = _$ToggleChecklistCopyWithImpl;
@useResult
$Res call({
 int id, bool isChecked
});




}
/// @nodoc
class _$ToggleChecklistCopyWithImpl<$Res>
    implements $ToggleChecklistCopyWith<$Res> {
  _$ToggleChecklistCopyWithImpl(this._self, this._then);

  final ToggleChecklist _self;
  final $Res Function(ToggleChecklist) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isChecked = null,}) {
  return _then(ToggleChecklist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreateTodoList extends ListsEvent {
  const CreateTodoList(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTodoList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListsEvent.createTodoList()';
}


}




/// @nodoc


class DeleteTodoList extends ListsEvent {
  const DeleteTodoList({required this.id}): super._();
  

 final  int id;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTodoListCopyWith<DeleteTodoList> get copyWith => _$DeleteTodoListCopyWithImpl<DeleteTodoList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTodoList&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ListsEvent.deleteTodoList(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTodoListCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $DeleteTodoListCopyWith(DeleteTodoList value, $Res Function(DeleteTodoList) _then) = _$DeleteTodoListCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteTodoListCopyWithImpl<$Res>
    implements $DeleteTodoListCopyWith<$Res> {
  _$DeleteTodoListCopyWithImpl(this._self, this._then);

  final DeleteTodoList _self;
  final $Res Function(DeleteTodoList) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTodoList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ToggleTodoList extends ListsEvent {
  const ToggleTodoList({required this.id, required this.isChecked}): super._();
  

 final  int id;
 final  bool isChecked;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleTodoListCopyWith<ToggleTodoList> get copyWith => _$ToggleTodoListCopyWithImpl<ToggleTodoList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleTodoList&&(identical(other.id, id) || other.id == id)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,isChecked);

@override
String toString() {
  return 'ListsEvent.toggleTodoList(id: $id, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class $ToggleTodoListCopyWith<$Res> implements $ListsEventCopyWith<$Res> {
  factory $ToggleTodoListCopyWith(ToggleTodoList value, $Res Function(ToggleTodoList) _then) = _$ToggleTodoListCopyWithImpl;
@useResult
$Res call({
 int id, bool isChecked
});




}
/// @nodoc
class _$ToggleTodoListCopyWithImpl<$Res>
    implements $ToggleTodoListCopyWith<$Res> {
  _$ToggleTodoListCopyWithImpl(this._self, this._then);

  final ToggleTodoList _self;
  final $Res Function(ToggleTodoList) _then;

/// Create a copy of ListsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isChecked = null,}) {
  return _then(ToggleTodoList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
