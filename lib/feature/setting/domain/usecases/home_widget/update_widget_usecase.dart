import 'package:injectable/injectable.dart';

import '../../../../home_widget/service/home_widget_service.dart';
import '../../../../schedule/domain/entities/schedule_entity.dart';
import '../../../../trip/domain/entities/trip_entity.dart';

@LazySingleton()
class UpdateWidgetUseCase {
  final HomeWidgetService _homeWidgetService;

  UpdateWidgetUseCase(this._homeWidgetService);

  Future<void> call({
    required List<TripEntity> trips,
    required List<ScheduleEntity> schedules,
  }) {
    return _homeWidgetService.updateAllWidgets(
      trips: trips,
      userSchedules: schedules,
    );
  }
}
