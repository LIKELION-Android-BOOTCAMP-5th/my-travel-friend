// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProfile value)?  loadProfile,TResult Function( SelectImg value)?  selectImg,TResult Function( RemoveImg value)?  removeImg,TResult Function( ChangeNickname value)?  changeNickname,TResult Function( UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case SelectImg() when selectImg != null:
return selectImg(_that);case RemoveImg() when removeImg != null:
return removeImg(_that);case ChangeNickname() when changeNickname != null:
return changeNickname(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProfile value)  loadProfile,required TResult Function( SelectImg value)  selectImg,required TResult Function( RemoveImg value)  removeImg,required TResult Function( ChangeNickname value)  changeNickname,required TResult Function( UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile(_that);case SelectImg():
return selectImg(_that);case RemoveImg():
return removeImg(_that);case ChangeNickname():
return changeNickname(_that);case UpdateProfile():
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProfile value)?  loadProfile,TResult? Function( SelectImg value)?  selectImg,TResult? Function( RemoveImg value)?  removeImg,TResult? Function( ChangeNickname value)?  changeNickname,TResult? Function( UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case SelectImg() when selectImg != null:
return selectImg(_that);case RemoveImg() when removeImg != null:
return removeImg(_that);case ChangeNickname() when changeNickname != null:
return changeNickname(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserEntity profile)?  loadProfile,TResult Function( File file)?  selectImg,TResult Function()?  removeImg,TResult Function( String nickname)?  changeNickname,TResult Function()?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that.profile);case SelectImg() when selectImg != null:
return selectImg(_that.file);case RemoveImg() when removeImg != null:
return removeImg();case ChangeNickname() when changeNickname != null:
return changeNickname(_that.nickname);case UpdateProfile() when updateProfile != null:
return updateProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserEntity profile)  loadProfile,required TResult Function( File file)  selectImg,required TResult Function()  removeImg,required TResult Function( String nickname)  changeNickname,required TResult Function()  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile(_that.profile);case SelectImg():
return selectImg(_that.file);case RemoveImg():
return removeImg();case ChangeNickname():
return changeNickname(_that.nickname);case UpdateProfile():
return updateProfile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserEntity profile)?  loadProfile,TResult? Function( File file)?  selectImg,TResult? Function()?  removeImg,TResult? Function( String nickname)?  changeNickname,TResult? Function()?  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that.profile);case SelectImg() when selectImg != null:
return selectImg(_that.file);case RemoveImg() when removeImg != null:
return removeImg();case ChangeNickname() when changeNickname != null:
return changeNickname(_that.nickname);case UpdateProfile() when updateProfile != null:
return updateProfile();case _:
  return null;

}
}

}

/// @nodoc


class LoadProfile implements ProfileEvent {
  const LoadProfile({required this.profile});
  

 final  UserEntity profile;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProfileCopyWith<LoadProfile> get copyWith => _$LoadProfileCopyWithImpl<LoadProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProfile&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileEvent.loadProfile(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $LoadProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $LoadProfileCopyWith(LoadProfile value, $Res Function(LoadProfile) _then) = _$LoadProfileCopyWithImpl;
@useResult
$Res call({
 UserEntity profile
});


$UserEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$LoadProfileCopyWithImpl<$Res>
    implements $LoadProfileCopyWith<$Res> {
  _$LoadProfileCopyWithImpl(this._self, this._then);

  final LoadProfile _self;
  final $Res Function(LoadProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(LoadProfile(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get profile {
  
  return $UserEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class SelectImg implements ProfileEvent {
  const SelectImg({required this.file});
  

 final  File file;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectImgCopyWith<SelectImg> get copyWith => _$SelectImgCopyWithImpl<SelectImg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectImg&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'ProfileEvent.selectImg(file: $file)';
}


}

/// @nodoc
abstract mixin class $SelectImgCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $SelectImgCopyWith(SelectImg value, $Res Function(SelectImg) _then) = _$SelectImgCopyWithImpl;
@useResult
$Res call({
 File file
});




}
/// @nodoc
class _$SelectImgCopyWithImpl<$Res>
    implements $SelectImgCopyWith<$Res> {
  _$SelectImgCopyWithImpl(this._self, this._then);

  final SelectImg _self;
  final $Res Function(SelectImg) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(SelectImg(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class RemoveImg implements ProfileEvent {
  const RemoveImg();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveImg);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.removeImg()';
}


}




/// @nodoc


class ChangeNickname implements ProfileEvent {
  const ChangeNickname({required this.nickname});
  

 final  String nickname;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeNicknameCopyWith<ChangeNickname> get copyWith => _$ChangeNicknameCopyWithImpl<ChangeNickname>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeNickname&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,nickname);

@override
String toString() {
  return 'ProfileEvent.changeNickname(nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class $ChangeNicknameCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ChangeNicknameCopyWith(ChangeNickname value, $Res Function(ChangeNickname) _then) = _$ChangeNicknameCopyWithImpl;
@useResult
$Res call({
 String nickname
});




}
/// @nodoc
class _$ChangeNicknameCopyWithImpl<$Res>
    implements $ChangeNicknameCopyWith<$Res> {
  _$ChangeNicknameCopyWithImpl(this._self, this._then);

  final ChangeNickname _self;
  final $Res Function(ChangeNickname) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickname = null,}) {
  return _then(ChangeNickname(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateProfile implements ProfileEvent {
  const UpdateProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.updateProfile()';
}


}




// dart format on
