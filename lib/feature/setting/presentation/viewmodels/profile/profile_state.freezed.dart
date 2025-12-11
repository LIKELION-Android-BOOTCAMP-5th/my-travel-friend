// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

// 원본 프로필 (변경 감지용)
 UserEntity? get originalProfile;// 현재 편집 중인 값들
 String get nickname; String? get imgUrl;// 서버에 저장된 이미지 URL
 File? get localImgFile;// 로컬에서 선택한 새 이미지
// 이미지 삭제 플래그 (기존 이미지 삭제 요청)
 bool get isImgRemoved;// 닉네임 상태
 NicknameStatus get nicknameStatus;// 상태
 ProfilePageState get pageState; bool get isUploading; String? get message;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.originalProfile, originalProfile) || other.originalProfile == originalProfile)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.isImgRemoved, isImgRemoved) || other.isImgRemoved == isImgRemoved)&&(identical(other.nicknameStatus, nicknameStatus) || other.nicknameStatus == nicknameStatus)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,originalProfile,nickname,imgUrl,localImgFile,isImgRemoved,nicknameStatus,pageState,isUploading,message);

@override
String toString() {
  return 'ProfileState(originalProfile: $originalProfile, nickname: $nickname, imgUrl: $imgUrl, localImgFile: $localImgFile, isImgRemoved: $isImgRemoved, nicknameStatus: $nicknameStatus, pageState: $pageState, isUploading: $isUploading, message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 UserEntity? originalProfile, String nickname, String? imgUrl, File? localImgFile, bool isImgRemoved, NicknameStatus nicknameStatus, ProfilePageState pageState, bool isUploading, String? message
});


$UserEntityCopyWith<$Res>? get originalProfile;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalProfile = freezed,Object? nickname = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? isImgRemoved = null,Object? nicknameStatus = null,Object? pageState = null,Object? isUploading = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
originalProfile: freezed == originalProfile ? _self.originalProfile : originalProfile // ignore: cast_nullable_to_non_nullable
as UserEntity?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,isImgRemoved: null == isImgRemoved ? _self.isImgRemoved : isImgRemoved // ignore: cast_nullable_to_non_nullable
as bool,nicknameStatus: null == nicknameStatus ? _self.nicknameStatus : nicknameStatus // ignore: cast_nullable_to_non_nullable
as NicknameStatus,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ProfilePageState,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get originalProfile {
    if (_self.originalProfile == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.originalProfile!, (value) {
    return _then(_self.copyWith(originalProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity? originalProfile,  String nickname,  String? imgUrl,  File? localImgFile,  bool isImgRemoved,  NicknameStatus nicknameStatus,  ProfilePageState pageState,  bool isUploading,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.originalProfile,_that.nickname,_that.imgUrl,_that.localImgFile,_that.isImgRemoved,_that.nicknameStatus,_that.pageState,_that.isUploading,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity? originalProfile,  String nickname,  String? imgUrl,  File? localImgFile,  bool isImgRemoved,  NicknameStatus nicknameStatus,  ProfilePageState pageState,  bool isUploading,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.originalProfile,_that.nickname,_that.imgUrl,_that.localImgFile,_that.isImgRemoved,_that.nicknameStatus,_that.pageState,_that.isUploading,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity? originalProfile,  String nickname,  String? imgUrl,  File? localImgFile,  bool isImgRemoved,  NicknameStatus nicknameStatus,  ProfilePageState pageState,  bool isUploading,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.originalProfile,_that.nickname,_that.imgUrl,_that.localImgFile,_that.isImgRemoved,_that.nicknameStatus,_that.pageState,_that.isUploading,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState extends ProfileState {
  const _ProfileState({this.originalProfile, this.nickname = '', this.imgUrl, this.localImgFile, this.isImgRemoved = false, this.nicknameStatus = NicknameStatus.initial, this.pageState = ProfilePageState.initial, this.isUploading = false, this.message}): super._();
  

// 원본 프로필 (변경 감지용)
@override final  UserEntity? originalProfile;
// 현재 편집 중인 값들
@override@JsonKey() final  String nickname;
@override final  String? imgUrl;
// 서버에 저장된 이미지 URL
@override final  File? localImgFile;
// 로컬에서 선택한 새 이미지
// 이미지 삭제 플래그 (기존 이미지 삭제 요청)
@override@JsonKey() final  bool isImgRemoved;
// 닉네임 상태
@override@JsonKey() final  NicknameStatus nicknameStatus;
// 상태
@override@JsonKey() final  ProfilePageState pageState;
@override@JsonKey() final  bool isUploading;
@override final  String? message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.originalProfile, originalProfile) || other.originalProfile == originalProfile)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.localImgFile, localImgFile) || other.localImgFile == localImgFile)&&(identical(other.isImgRemoved, isImgRemoved) || other.isImgRemoved == isImgRemoved)&&(identical(other.nicknameStatus, nicknameStatus) || other.nicknameStatus == nicknameStatus)&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,originalProfile,nickname,imgUrl,localImgFile,isImgRemoved,nicknameStatus,pageState,isUploading,message);

@override
String toString() {
  return 'ProfileState(originalProfile: $originalProfile, nickname: $nickname, imgUrl: $imgUrl, localImgFile: $localImgFile, isImgRemoved: $isImgRemoved, nicknameStatus: $nicknameStatus, pageState: $pageState, isUploading: $isUploading, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserEntity? originalProfile, String nickname, String? imgUrl, File? localImgFile, bool isImgRemoved, NicknameStatus nicknameStatus, ProfilePageState pageState, bool isUploading, String? message
});


@override $UserEntityCopyWith<$Res>? get originalProfile;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalProfile = freezed,Object? nickname = null,Object? imgUrl = freezed,Object? localImgFile = freezed,Object? isImgRemoved = null,Object? nicknameStatus = null,Object? pageState = null,Object? isUploading = null,Object? message = freezed,}) {
  return _then(_ProfileState(
originalProfile: freezed == originalProfile ? _self.originalProfile : originalProfile // ignore: cast_nullable_to_non_nullable
as UserEntity?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,localImgFile: freezed == localImgFile ? _self.localImgFile : localImgFile // ignore: cast_nullable_to_non_nullable
as File?,isImgRemoved: null == isImgRemoved ? _self.isImgRemoved : isImgRemoved // ignore: cast_nullable_to_non_nullable
as bool,nicknameStatus: null == nicknameStatus ? _self.nicknameStatus : nicknameStatus // ignore: cast_nullable_to_non_nullable
as NicknameStatus,pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as ProfilePageState,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get originalProfile {
    if (_self.originalProfile == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.originalProfile!, (value) {
    return _then(_self.copyWith(originalProfile: value));
  });
}
}

// dart format on
