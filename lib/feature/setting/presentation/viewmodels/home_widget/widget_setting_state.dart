import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home_widget/domain/entities/widget_settings_entity.dart';
import '../../../../trip/domain/entities/trip_entity.dart';

part 'widget_setting_state.freezed.dart';

@freezed
abstract class WidgetSettingsState with _$WidgetSettingsState {
  const factory WidgetSettingsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(null) WidgetSettingsEntity? settings,
    @Default([]) List<TripEntity> trips,
    @Default(null) TripEntity? selectedTrip,
    @Default(null) String? errorMessage,
    @Default(false) bool saveSuccess,
  }) = _WidgetSettingsState;
}
