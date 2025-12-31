import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home_widget/domain/entities/widget_theme_preset.dart';

part 'widget_setting_event.freezed.dart';

@freezed
class WidgetSettingsEvent with _$WidgetSettingsEvent {
  // 설정 로드
  const factory WidgetSettingsEvent.loadSetting({required int userId}) =
      LoadSetting;

  // 테마 프리셋 변경
  const factory WidgetSettingsEvent.changeTheme(WidgetThemePreset preset) =
      ChangeTheme;

  // 시스템 테마 사용 토글
  const factory WidgetSettingsEvent.toggleSystemTheme(bool useSystemTheme) =
      ToggleSystemTheme;

  // 자동 선택 토글
  const factory WidgetSettingsEvent.toggleAutoSelect(bool autoSelect) =
      ToggleAutoSelect;

  // 여행 선택
  const factory WidgetSettingsEvent.selectTrip(int tripId) = SelectTrip;

  // 설정 저장
  const factory WidgetSettingsEvent.save() = Save;
}
