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
}
