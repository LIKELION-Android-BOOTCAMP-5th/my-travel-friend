import 'package:flutter/material.dart';

import 'app_colors.dart';

// [이재은] 앱 테마에서 사용할 컬러 지정
class AppColorTheme {
  // 라이트 테마
  static ColorScheme get lightColorScheme {
    return ColorScheme(
      brightness: Brightness.light,

      // Primary
      primary: AppColors.primaryLight,
      onPrimary: AppColors.light,
      primaryContainer: const Color(0xFFD6EFFA),
      onPrimaryContainer: const Color(0xFF1A4D66),

      // Secondary
      secondary: AppColors.secondary,
      onSecondary: AppColors.light,
      secondaryContainer: const Color(0xFFFFE5E5),
      onSecondaryContainer: const Color(0xFF5C2A2A),

      // Tertiary
      tertiary: AppColors.tertiary,
      onTertiary: const Color(0xFF3D3000),
      tertiaryContainer: const Color(0xFFFFF0CC),
      onTertiaryContainer: const Color(0xFF4D3D00),

      // Error
      error: const Color(0xFFBA1A1A),
      onError: AppColors.light,
      errorContainer: const Color(0xFFFFDAD6),
      onErrorContainer: const Color(0xFF410002),

      // Background & Surface
      surface: AppColors.light,
      onSurface: AppColors.dark,
      surfaceContainerHighest: AppColors.lessLight,
      onSurfaceVariant: AppColors.lessDark,

      // Outline
      outline: const Color(0xFFE0E0E0),
      outlineVariant: const Color(0xFFC4C4C4),

      // Others
      shadow: Colors.black.withValues(alpha: 0.1),
      scrim: Colors.black.withValues(alpha: 0.3),
      inverseSurface: AppColors.dark,
      onInverseSurface: AppColors.lessLight,
      inversePrimary: AppColors.primaryDark,
    );
  }

  // 다크 테마 컬러
  static ColorScheme get darkColorScheme {
    return ColorScheme(
      brightness: Brightness.dark,

      // Primary
      primary: AppColors.primaryDark,
      onPrimary: AppColors.navy,
      primaryContainer: const Color(0xFF2A5A7A),
      onPrimaryContainer: const Color(0xFFD6EFFA),

      // Secondary
      secondary: AppColors.secondary,
      onSecondary: const Color(0xFF3D1A1A),
      secondaryContainer: const Color(0xFF5C3A3A),
      onSecondaryContainer: const Color(0xFFFFE5E5),

      // Tertiary
      tertiary: AppColors.tertiary,
      onTertiary: const Color(0xFF3D3000),
      tertiaryContainer: const Color(0xFF5C4D1A),
      onTertiaryContainer: const Color(0xFFFFF0CC),

      // Error
      error: const Color(0xFFFFB4AB),
      onError: const Color(0xFF690005),
      errorContainer: const Color(0xFF93000A),
      onErrorContainer: const Color(0xFFFFDAD6),

      // Background & Surface
      surface: AppColors.navy,
      onSurface: const Color(0xFFF5F5F5),
      surfaceContainerHighest: AppColors.navySurface,
      onSurfaceVariant: const Color(0xFFB0B0B0),

      // Outline
      outline: AppColors.navyOutline,
      outlineVariant: const Color(0xFF5A7A9A),

      // Others
      shadow: Colors.black.withValues(alpha: 0.3),
      scrim: Colors.black.withValues(alpha: 0.5),
      inverseSurface: AppColors.lessLight,
      onInverseSurface: AppColors.dark,
      inversePrimary: AppColors.primaryLight,
    );
  }
}
