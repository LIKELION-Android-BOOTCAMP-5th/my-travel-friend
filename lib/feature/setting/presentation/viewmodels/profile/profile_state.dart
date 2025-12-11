import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'profile_state.freezed.dart';

// [이재은] 프로필 설정 페이지 상태
enum ProfilePageState { initial, loading, loaded, saving, success, error }

// 닉네임 검증 상태
enum NicknameStatus {
  initial,
  checking,
  available,
  duplicated,
  empty,
  tooLong,
  tooShort,
}

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    // 원본 프로필 (변경 감지용)
    UserEntity? originalProfile,

    // 현재 편집 중인 값들
    @Default('') String nickname,
    String? imgUrl, // 서버에 저장된 이미지 URL
    File? localImgFile, // 로컬에서 선택한 새 이미지
    // 이미지 삭제 플래그 (기존 이미지 삭제 요청)
    @Default(false) bool isImgRemoved,

    // 닉네임 상태
    @Default(NicknameStatus.initial) NicknameStatus nicknameStatus,

    // 상태
    @Default(ProfilePageState.initial) ProfilePageState pageState,
    @Default(false) bool isUploading,
    String? message,
  }) = _ProfileState;

  // 닉네임 유효한지
  bool get isNicknameValid {
    return nicknameStatus == NicknameStatus.available ||
        (nicknameStatus == NicknameStatus.initial &&
            nickname == originalProfile?.nickname);
  }

  // 변경사항 있는지 확인
  bool get hasChanges {
    if (originalProfile == null) return false;

    final nicknameChanged = nickname != originalProfile!.nickname;
    final imgChanged = localImgFile != null || isImgRemoved;

    return nicknameChanged || imgChanged;
  }

  // 저장 가능한지 확인
  bool get canSave {
    if (originalProfile == null) return false;
    if (nickname.trim().isEmpty) return false;
    if (pageState == ProfilePageState.saving) return false;
    if (nicknameStatus == NicknameStatus.duplicated) return false;
    if (nicknameStatus == NicknameStatus.checking) return false;
    if (pageState == ProfilePageState.saving) return false;

    return hasChanges;
  }

  // 현재 표시할 이미지 (로컬 선택 - 서버 URL - null)
  dynamic get displayImage {
    if (localImgFile != null) return localImgFile;
    if (!isImgRemoved && imgUrl != null) return imgUrl;
    return null;
  }

  // Entity로 변환 (저장용)
  UserEntity toEntity({String? uploadedImgUrl}) {
    return originalProfile!.copyWith(
      nickname: nickname.trim(),
      profileImg: uploadedImgUrl ?? (isImgRemoved ? null : imgUrl),
    );
  }
}
