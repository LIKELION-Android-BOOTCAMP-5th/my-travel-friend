import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// [이재은] 테마 설정 관련 서비스
enum AppThemeType {
  light, // 라이트 모드
  dark, // 다크 모드
  system, // 시스템 설정
}

class ThemeInfo {
  final AppThemeType type;
  final String title;
  final String description;

  const ThemeInfo({
    required this.type,
    required this.title,
    required this.description,
  });
}

@LazySingleton()
class ThemeService {
  static const String _themeKey = 'app_theme';

  // 테마 옵션 목록
  static List<ThemeInfo> themeOptions = [
    ThemeInfo(
      type: AppThemeType.light,
      title: '라이트 모드',
      description: '밝은 테마로 표시됩니다',
    ),
    ThemeInfo(
      type: AppThemeType.dark,
      title: '다크 모드',
      description: '어두운 테마로 표시됩니다',
    ),
    ThemeInfo(
      type: AppThemeType.system,
      title: '시스템 설정',
      description: '기기 설정을 따릅니다',
    ),
  ];

  // 현재 테마 가져오기
  Future<AppThemeType> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);

    if (themeString == null) return AppThemeType.system;

    return AppThemeType.values.firstWhere(
      (e) => e.name == themeString,
      orElse: () => AppThemeType.system,
    );
  }

  // 테마 저장하기
  Future<void> updateTheme(AppThemeType type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, type.name);
  }

  // AppThemeType → ThemeMode 변환
  ThemeMode toThemeMode(AppThemeType type) {
    switch (type) {
      case AppThemeType.light:
        return ThemeMode.light;
      case AppThemeType.dark:
        return ThemeMode.dark;
      case AppThemeType.system:
        return ThemeMode.system;
    }
  }
}
