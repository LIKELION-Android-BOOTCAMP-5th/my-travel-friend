import 'package:injectable/injectable.dart';

import '../../../../home_widget/domain/entities/widget_settings_entity.dart';
import '../../../../home_widget/service/home_widget_service.dart';
import '../../../../trip/domain/entities/trip_entity.dart';

@LazySingleton()
class SelectTripForWidgetUseCase {
  final HomeWidgetService _homeWidgetService;

  SelectTripForWidgetUseCase(this._homeWidgetService);

  TripEntity? call({
    required List<TripEntity> trips,
    required WidgetSettingsEntity settings,
  }) {
    return _homeWidgetService.selectTripForWidget(
      trips: trips,
      settings: settings,
    );
  }
}
