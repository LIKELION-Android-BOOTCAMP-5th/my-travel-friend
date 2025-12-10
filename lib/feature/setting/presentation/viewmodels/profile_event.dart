import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';

part 'profile_event.freezed.dart';

// [이재은] 프로필 설정 이벤트
@freezed
class ProfileEvent with _$ProfileEvent {
  // 프로필 불러오기
  const factory ProfileEvent.loadProfile({required UserEntity profile}) =
      LoadProfile;

  // 이미지 선택
  const factory ProfileEvent.selectImg({required File file}) = SelectImg;

  // 이미지 제거
  const factory ProfileEvent.removeImg() = RemoveImg;

  // 닉네임 변경
  const factory ProfileEvent.changeNickname({required String nickname}) =
      ChangeNickname;

  // 변경 사항 저장하기
  const factory ProfileEvent.updateProfile() = UpdateProfile;
}
