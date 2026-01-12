import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/home_widget/widget_setting_event.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/home_widget/widget_setting_state.dart';

import '../../../../../core/result/result.dart';
import '../../../../schedule/domain/entities/schedule_entity.dart';
import '../../../../schedule/domain/usecases/get_user_schudule_usecase.dart';
import '../../../../trip/domain/usecases/get_my_trip_usecase.dart';
import '../../../domain/usecases/home_widget/get_widget_settings_usecase.dart';
import '../../../domain/usecases/home_widget/save_widget_settings_usecase.dart';
import '../../../domain/usecases/home_widget/select_trip_for_widget_usecase.dart';
import '../../../domain/usecases/home_widget/update_widget_usecase.dart';

@injectable
class WidgetSettingsBloc
    extends Bloc<WidgetSettingsEvent, WidgetSettingsState> {
  final GetWidgetSettingsUseCase _getWidgetSettingsUseCase;
  final SaveWidgetSettingsUseCase _saveWidgetSettingsUseCase;
  final UpdateWidgetUseCase _updateWidgetUseCase;
  final SelectTripForWidgetUseCase _selectTripForWidgetUseCase;
  final GetMyTripUsecase _getMyTripUseCase;
  final GetUserScheduleUseCase _getUserScheduleUseCase; // 추가!

  WidgetSettingsBloc(
    this._getWidgetSettingsUseCase,
    this._saveWidgetSettingsUseCase,
    this._updateWidgetUseCase,
    this._selectTripForWidgetUseCase,
    this._getMyTripUseCase,
    this._getUserScheduleUseCase, // 추가!
  ) : super(const WidgetSettingsState()) {
    on<LoadSetting>(_onLoad);
    on<ChangeTheme>(_onChangeTheme);
    on<ToggleSystemTheme>(_onToggleSystemTheme);
    on<ToggleAutoSelect>(_onToggleAutoSelect);
    on<SelectTrip>(_onSelectTrip);
    on<Save>(_onSave);
  }

  // _onLoad에서 userId 저장 필요
  int? _userId;

  Future<void> _onLoad(
    LoadSetting event,
    Emitter<WidgetSettingsState> emit,
  ) async {
    _userId = event.userId; // userId 저장
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final settings = await _getWidgetSettingsUseCase();
      final tripsResult = await _getMyTripUseCase(event.userId, 1);

      tripsResult.when(
        success: (trips) {
          final selectedTrip = _selectTripForWidgetUseCase(
            trips: trips,
            settings: settings,
          );

          emit(
            state.copyWith(
              isLoading: false,
              settings: settings,
              trips: trips,
              selectedTrip: selectedTrip,
            ),
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              settings: settings,
              trips: [],
              errorMessage: failure.message,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: '설정을 불러오는데 실패했습니다'));
    }
  }

  Future<void> _onChangeTheme(
    ChangeTheme event,
    Emitter<WidgetSettingsState> emit,
  ) async {
    final currentSettings = state.settings;
    if (currentSettings == null) return;

    final newSettings = currentSettings.copyWith(
      themePresetName: event.preset.name,
    );

    emit(state.copyWith(settings: newSettings, saveSuccess: false));
  }

  Future<void> _onToggleSystemTheme(
    ToggleSystemTheme event,
    Emitter<WidgetSettingsState> emit,
  ) async {
    final currentSettings = state.settings;
    if (currentSettings == null) return;

    final newSettings = currentSettings.copyWith(
      useSystemTheme: event.useSystemTheme,
    );

    emit(state.copyWith(settings: newSettings, saveSuccess: false));
  }

  Future<void> _onToggleAutoSelect(
    ToggleAutoSelect event,
    Emitter<WidgetSettingsState> emit,
  ) async {
    final currentSettings = state.settings;
    if (currentSettings == null) return;

    final newSettings = currentSettings.copyWith(
      autoSelectTrip: event.autoSelect,
      selectedTripId: event.autoSelect ? null : currentSettings.selectedTripId,
    );

    final selectedTrip = _selectTripForWidgetUseCase(
      trips: state.trips,
      settings: newSettings,
    );

    emit(
      state.copyWith(
        settings: newSettings,
        selectedTrip: selectedTrip,
        saveSuccess: false,
      ),
    );
  }

  Future<void> _onSelectTrip(
    SelectTrip event,
    Emitter<WidgetSettingsState> emit,
  ) async {
    final currentSettings = state.settings;
    if (currentSettings == null) return;

    final newSettings = currentSettings.copyWith(selectedTripId: event.tripId);

    final selectedTrip = state.trips
        .where((t) => t.id == event.tripId)
        .firstOrNull;

    emit(
      state.copyWith(
        settings: newSettings,
        selectedTrip: selectedTrip,
        saveSuccess: false,
      ),
    );
  }

  Future<void> _onSave(Save event, Emitter<WidgetSettingsState> emit) async {
    final settings = state.settings;

    print('🔍 _onSave called');
    print('🔍 settings: $settings');
    print('🔍 _userId: $_userId');
    print('🔍 trips count: ${state.trips.length}');
    print('🔍 selectedTrip: ${state.selectedTrip}');
    print('🔍 selectedTrip.id: ${state.selectedTrip?.id}');

    if (settings == null || _userId == null) {
      print('❌ Save failed: settings=$settings, userId=$_userId');
      return;
    }

    emit(state.copyWith(isSaving: true, saveSuccess: false));

    try {
      print('💾 Saving settings...');
      await _saveWidgetSettingsUseCase(settings);
      print('✅ Settings saved');

      print(
        '🔍 Checking conditions: trips.isNotEmpty=${state.trips.isNotEmpty}, selectedTrip!=null=${state.selectedTrip != null}',
      );

      if (state.trips.isNotEmpty && state.selectedTrip != null) {
        print(
          '📅 Fetching schedules for trip: ${state.selectedTrip!.id}, userId: $_userId',
        );

        final schedulesResult = await _getUserScheduleUseCase(
          tripId: state.selectedTrip!.id!,
          userId: _userId!,
        );

        print('📅 schedulesResult: $schedulesResult');

        final schedules = schedulesResult.when(
          success: (data) {
            print('✅ Got ${data.length} schedules');
            return data;
          },
          failure: (f) {
            print('⚠️ Schedule fetch failed: ${f.message}');
            return <ScheduleEntity>[];
          },
        );

        print(
          '🔄 Updating widgets with ${state.trips.length} trips and ${schedules.length} schedules',
        );
        await _updateWidgetUseCase(trips: state.trips, schedules: schedules);
        print('✅ Widgets updated');
      } else {
        print('⚠️ Skipping widget update: trips empty or no selected trip');
      }

      emit(state.copyWith(isSaving: false, saveSuccess: true));
    } catch (e, stackTrace) {
      print('❌ Save error: $e');
      print('📍 Stack trace: $stackTrace');
      emit(state.copyWith(isSaving: false, errorMessage: '설정 저장에 실패했습니다'));
    }
  }
}
