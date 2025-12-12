import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/service/internal/theme_service.dart';

part 'theme_event.freezed.dart';

// [이재은] 테마 설정 관련 이벤트
@freezed
abstract class ThemeEvent with _$ThemeEvent {
  // 테마 상태 불러오기
  const factory ThemeEvent.loadTheme() = LoadTheme;

  // 테마 변경
  const factory ThemeEvent.updateTheme(AppThemeType type) = UpdateTheme;
}
