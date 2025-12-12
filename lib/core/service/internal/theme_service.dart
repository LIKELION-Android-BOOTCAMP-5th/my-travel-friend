import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature/setting/presentation/viewmodels/theme/theme_state.dart';

// [이재은] 테마 설정 관련 서비스
@LazySingleton()
class ThemeService {
  static const String _themeKey = 'app_theme';

  final SharedPreferences _prefs; // 👈 DI로 주입

  ThemeService(this._prefs); // 👈 생성자 주입

  // 현재 테마 가져오기
  AppThemeType getTheme() {
    // 👈 async 제거
    final themeString = _prefs.getString(_themeKey);

    if (themeString == null) return AppThemeType.system;

    return AppThemeType.values.firstWhere(
      (e) => e.name == themeString,
      orElse: () => AppThemeType.system,
    );
  }

  // 테마 저장하기
  Future<void> updateTheme(AppThemeType type) async {
    await _prefs.setString(_themeKey, type.name);
  }
}
