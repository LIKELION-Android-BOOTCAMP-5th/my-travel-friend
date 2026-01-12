import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/home_widget/domain/entities/widget_theme_preset.dart';

part 'widget_settings_entity.freezed.dart';
part 'widget_settings_entity.g.dart';

@freezed
abstract class WidgetSettingsEntity with _$WidgetSettingsEntity {
  const factory WidgetSettingsEntity({
    // 테마 설정
    @Default('defaultLight') String themePresetName,
    @Default(true) bool useSystemTheme,

    // 여행 선택 설정
    @Default(true) bool autoSelectTrip, // true: 가장 가까운 여행 자동, false: 고정
    @Default(null) int? selectedTripId, // 고정할 여행 ID (autoSelectTrip이 false일 때)
  }) = _WidgetSettingsEntity;

  factory WidgetSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$WidgetSettingsEntityFromJson(json);
}

// 프리셋 가져오기 extension
extension WidgetSettingsEntityX on WidgetSettingsEntity {
  WidgetThemePreset get themePreset {
    return WidgetThemePreset.values.firstWhere(
      (e) => e.name == themePresetName,
      orElse: () => WidgetThemePreset.defaultLight,
    );
  }
}
