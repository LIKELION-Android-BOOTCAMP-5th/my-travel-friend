import 'package:injectable/injectable.dart';

import '../../../../home_widget/domain/entities/widget_settings_entity.dart';
import '../../../../home_widget/service/home_widget_service.dart';

@LazySingleton()
class SaveWidgetSettingsUseCase {
  final HomeWidgetService _homeWidgetService;

  SaveWidgetSettingsUseCase(this._homeWidgetService);

  Future<void> call(WidgetSettingsEntity settings) {
    return _homeWidgetService.saveSettings(settings);
  }
}
