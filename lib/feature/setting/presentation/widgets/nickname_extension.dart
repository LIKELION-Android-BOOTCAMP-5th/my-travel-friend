// [이재은] Nickname 에러 extension
import '../viewmodels/profile/profile_state.dart';

extension NicknameStatusExtension on NicknameStatus {
  // 에러 메시지
  String? get errorMessage {
    return switch (this) {
      NicknameStatus.duplicated => '이미 사용 중인 닉네임이에요',
      NicknameStatus.empty => '닉네임을 입력해주세요',
      NicknameStatus.tooLong => '닉네임은 10글자 이하여야 해요',
      NicknameStatus.tooShort => '닉네임은 2글자 이상이어야 해요',
      _ => null,
    };
  }

  // 에러 여부
  bool get hasError => errorMessage != null;

  // 로딩 여부
  bool get isChecking => this == NicknameStatus.checking;

  // 사용 가능 여부
  bool get isAvailable => this == NicknameStatus.available;
}
