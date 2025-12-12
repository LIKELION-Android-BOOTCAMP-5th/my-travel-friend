import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

// [이재은] 테마 설정 관련 상태

// 테마 타입
enum AppThemeType { light, dark, system }

// 테마 정보
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

// 테마 옵션 목록 (Map)
const Map<AppThemeType, ThemeInfo> themeOptionsMap = {
  AppThemeType.light: ThemeInfo(
    type: AppThemeType.light,
    title: '라이트 모드',
    description: '밝은 테마로 표시됩니다',
  ),
  AppThemeType.dark: ThemeInfo(
    type: AppThemeType.dark,
    title: '다크 모드',
    description: '어두운 테마로 표시됩니다',
  ),
  AppThemeType.system: ThemeInfo(
    type: AppThemeType.system,
    title: '시스템 설정',
    description: '기기 설정을 따릅니다',
  ),
};

// 페이지 상태
enum ThemePageState { initial, loading, loaded, error }

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemePageState.initial) ThemePageState pageState,
    @Default(AppThemeType.system) AppThemeType selectedTheme,
    @Default([]) List<ThemeInfo> themeOptions,
    String? message,
  }) = _ThemeState;

  const ThemeState._();

  // 테마 정보 가져오기
  ThemeInfo? getThemeInfo(AppThemeType type) => themeOptionsMap[type];
}
