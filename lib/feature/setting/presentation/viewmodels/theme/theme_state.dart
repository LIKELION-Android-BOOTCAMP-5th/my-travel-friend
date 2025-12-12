import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

// [이재은] 테마 설정 관련 상태

// 페이지 상태
enum ThemePageState { initial, loading, loaded, error }

// 테마 정보
class ThemeInfo {
  final String title;
  final String description;

  const ThemeInfo({required this.title, required this.description});
}

// 테마 타입 (팩토리 생성자)
@freezed
abstract class AppThemeMode with _$AppThemeMode {
  const AppThemeMode._();
  const factory AppThemeMode.light() = ThemeLight; // 라이트모드
  const factory AppThemeMode.dark() = ThemeDark; // 다크모드
  const factory AppThemeMode.system() = ThemeSystem; // 시스템설정
}

// 테마 옵션 목록
const Map<Type, ThemeInfo> themeOptionsMap = {
  ThemeLight: ThemeInfo(title: '라이트 모드', description: '밝은 테마로 표시됩니다'),
  ThemeDark: ThemeInfo(title: '다크 모드', description: '어두운 테마로 표시됩니다'),
  ThemeSystem: ThemeInfo(title: '시스템 설정', description: '기기 설정을 따릅니다'),
};

// 테마 상태
@freezed
abstract class ThemeState with _$ThemeState {
  const ThemeState._();
  const factory ThemeState({
    @Default(ThemePageState.initial) ThemePageState pageState,
    @Default(AppThemeMode.system()) AppThemeMode selectedTheme,
    String? message,
  }) = _ThemeState;
}

// 테마 정보 가져오기
ThemeInfo? getThemeInfo(AppThemeMode theme) =>
    themeOptionsMap[theme.runtimeType];
