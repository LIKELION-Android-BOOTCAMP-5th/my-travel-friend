import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature/setting/presentation/viewmodels/theme/theme_state.dart';

// [이재은] 테마 설정 관련 서비스
@LazySingleton()
class ThemeService {
  static const String _themeKey = 'app_theme';

  // 현재 테마 가져오기
  Future<AppThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);

    switch (themeString) {
      case 'light':
        return const AppThemeMode.light();
      case 'dark':
        return const AppThemeMode.dark();
      case 'system':
      default:
        return const AppThemeMode.system();
    }
  }

  // 테마 저장하기
  Future<void> updateTheme(AppThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();

    final themeString = switch (theme) {
      ThemeLight() => 'light',
      ThemeDark() => 'dark',
      ThemeSystem() => 'system',
      AppThemeMode() => throw UnimplementedError(),
    };

    await prefs.setString(_themeKey, themeString);
  }
}
