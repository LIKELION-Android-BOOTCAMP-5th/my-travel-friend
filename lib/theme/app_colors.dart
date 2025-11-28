import 'dart:ui';

// [이재은] 앱 테마 무관 둘 다 사용할 수 있는 컬러칩
//  -> 혹시 컬러 테마로 색상 적용이 안될 경우 직접 불러서 사용

class AppColors {
  static const Color primaryLight = Color(0xFF6BB9E0); // 라이트 모드일 때 하늘색
  static const Color primaryDark = Color(0xFF7CC5E8); // 다크 모드일 때 하늘색

  static const Color secondary = Color(0xFFF27B7B);

  static const Color tertiary = Color(0xFFF5C651);

  static const Color lightGreen = Color(0xFF8BC34A);

  static const Color navy = Color(0xFF1E3A5F);
  static const Color navySurface = Color(0xFF3A5678);
  static const Color navyOutline = Color(0xFF4A6A8A);

  static const Color light = Color(0xFFFEFEFE);
  static const Color lessLight = Color(0xFFF5F5F5);
  static const Color dark = Color(0xFF2E2E2E);
  static const Color lessDark = Color(0xFF5E5E5E);
}
