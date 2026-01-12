// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WidgetSettingsEntity _$WidgetSettingsEntityFromJson(
  Map<String, dynamic> json,
) => _WidgetSettingsEntity(
  themePresetName: json['themePresetName'] as String? ?? 'defaultLight',
  useSystemTheme: json['useSystemTheme'] as bool? ?? true,
  autoSelectTrip: json['autoSelectTrip'] as bool? ?? true,
  selectedTripId: (json['selectedTripId'] as num?)?.toInt() ?? null,
);

Map<String, dynamic> _$WidgetSettingsEntityToJson(
  _WidgetSettingsEntity instance,
) => <String, dynamic>{
  'themePresetName': instance.themePresetName,
  'useSystemTheme': instance.useSystemTheme,
  'autoSelectTrip': instance.autoSelectTrip,
  'selectedTripId': instance.selectedTripId,
};
