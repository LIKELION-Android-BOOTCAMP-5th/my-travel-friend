import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/service/internal/theme_service.dart';

part 'theme_state.freezed.dart';

// [이재은] 테마 설정 관련 상태
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
