import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/presentation/viewmodels/theme_state.dart';

// [이재은] 테마 설정 관련 서비스
@LazySingleton()
class ThemeService {
  static const String _themeKey = 'app_theme';

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
}
