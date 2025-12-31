import 'package:injectable/injectable.dart';

import '../../../../home_widget/domain/entities/widget_settings_entity.dart';
import '../../../../home_widget/service/home_widget_service.dart';

@LazySingleton()
class GetWidgetSettingsUseCase {
  final HomeWidgetService _homeWidgetService;

  GetWidgetSettingsUseCase(this._homeWidgetService);

  Future<WidgetSettingsEntity> call() {
    return _homeWidgetService.getSettings();
  }
}
