import 'dart:convert';
import 'dart:io';

import 'package:home_widget/home_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../schedule/domain/entities/schedule_entity.dart';
import '../../trip/domain/entities/trip_entity.dart';
import '../domain/entities/widget_settings_entity.dart';

@LazySingleton()
class HomeWidgetService {
  static const String _appGroupId = 'group.com.team1113.mytravelfriend';
  static const String _settingsKey = 'widget_settings';

  static const String ddayWidgetAndroid = 'DDayWidgetProvider';
  static const String ddayWidgetIOS = 'DDayWidget';
  static const String scheduleWidgetAndroid = 'ScheduleWidgetProvider';
  static const String scheduleWidgetIOS = 'ScheduleWidget';

  HomeWidgetService() {
    _initialize();
  }

  Future<void> _initialize() async {
    await HomeWidget.setAppGroupId(_appGroupId);
  }

  // 위젯 설정 관리

  Future<WidgetSettingsEntity> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_settingsKey);

    if (jsonString == null) {
      return const WidgetSettingsEntity();
    }

    try {
      final json = jsonDecode(jsonString);
      return WidgetSettingsEntity.fromJson(json);
    } catch (e) {
      return const WidgetSettingsEntity();
    }
  }

  Future<void> saveSettings(WidgetSettingsEntity settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));

    await _applySettingsToWidget(settings);
    await refreshAllWidgets();
  }

  Future<void> _applySettingsToWidget(WidgetSettingsEntity settings) async {
    final preset = settings.themePreset;

    await HomeWidget.saveWidgetData(
      'settings_bg_color',
      _colorToHex(preset.backgroundColor),
    );
    await HomeWidget.saveWidgetData(
      'settings_bg_opacity',
      preset.backgroundOpacity,
    );
    await HomeWidget.saveWidgetData(
      'settings_text_color',
      _colorToHex(preset.textColor),
    );
    await HomeWidget.saveWidgetData(
      'settings_accent_color',
      _colorToHex(preset.accentColor),
    );
    await HomeWidget.saveWidgetData(
      'settings_use_system_theme',
      settings.useSystemTheme,
    );
  }

  String _colorToHex(int colorValue) {
    // ARGB 형식으로 변환 (#AARRGGBB)
    return '#${colorValue.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  // 여행 선택 로직

  // 여행 목록에서 위젯에 표시할 여행 선택
  // 1. autoSelectTrip = true → 가장 가까운 여행 자동 선택
  // 2. autoSelectTrip = false → selectedTripId에 해당하는 여행
  // 3. 선택된 여행이 없거나 찾을 수 없으면 → 가장 가까운 여행
  TripEntity? selectTripForWidget({
    required List<TripEntity> trips,
    required WidgetSettingsEntity settings,
  }) {
    if (trips.isEmpty) return null;

    // 자동 선택 모드
    if (settings.autoSelectTrip) {
      return _findClosestTrip(trips);
    }

    // 고정된 여행 찾기
    if (settings.selectedTripId != null) {
      final selectedTrip = trips
          .where((t) => t.id == settings.selectedTripId)
          .firstOrNull;

      // 찾으면 반환, 못 찾으면 가장 가까운 여행으로 폴백
      return selectedTrip ?? _findClosestTrip(trips);
    }

    // 기본값: 가장 가까운 여행
    return _findClosestTrip(trips);
  }

  // 가장 가까운 여행 찾기
  // 우선순위:
  // 1. 현재 진행 중인 여행 (오늘이 여행 기간 내)
  // 2. 다가오는 여행 중 가장 가까운 것
  // 3. 지난 여행 중 가장 최근 것
  TripEntity? _findClosestTrip(List<TripEntity> trips) {
    if (trips.isEmpty) return null;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    TripEntity? ongoingTrip;
    TripEntity? closestUpcoming;
    TripEntity? closestPast;

    int? minDaysToStart;
    int? minDaysFromEnd;

    for (final trip in trips) {
      final startDate = DateTime.parse(trip.startAt);
      final endDate = DateTime.parse(trip.endAt);
      final startDay = DateTime(startDate.year, startDate.month, startDate.day);
      final endDay = DateTime(endDate.year, endDate.month, endDate.day);

      // 진행 중인 여행
      if (!today.isBefore(startDay) && !today.isAfter(endDay)) {
        ongoingTrip = trip;
        break; // 진행 중인 여행이 있으면 바로 반환
      }

      // 다가오는 여행
      if (today.isBefore(startDay)) {
        final daysToStart = startDay.difference(today).inDays;
        if (minDaysToStart == null || daysToStart < minDaysToStart) {
          minDaysToStart = daysToStart;
          closestUpcoming = trip;
        }
      }

      // 지난 여행
      if (today.isAfter(endDay)) {
        final daysFromEnd = today.difference(endDay).inDays;
        if (minDaysFromEnd == null || daysFromEnd < minDaysFromEnd) {
          minDaysFromEnd = daysFromEnd;
          closestPast = trip;
        }
      }
    }

    // 우선순위대로 반환
    return ongoingTrip ?? closestUpcoming ?? closestPast;
  }

  // D-Day 위젯

  // D-Day 위젯 업데이트 (여행 직접 지정)
  Future<void> updateDDayWidget({required TripEntity trip}) async {
    final now = DateTime.now();
    final startDate = DateTime.parse(trip.startAt);
    final endDate = DateTime.parse(trip.endAt);

    final dDay = _calculateDDay(now, startDate, endDate);
    final dDayText = _formatDDayText(dDay, now, startDate, endDate);

    final settings = await getSettings();
    await _applySettingsToWidget(settings);

    await HomeWidget.saveWidgetData('dday_trip_id', trip.id);
    await HomeWidget.saveWidgetData('dday_trip_title', trip.title ?? '여행');
    await HomeWidget.saveWidgetData('dday_trip_place', trip.place ?? '');
    await HomeWidget.saveWidgetData('dday_start_date', _formatDate(startDate));
    await HomeWidget.saveWidgetData('dday_end_date', _formatDate(endDate));
    await HomeWidget.saveWidgetData('dday_value', dDay);
    await HomeWidget.saveWidgetData('dday_text', dDayText);
    await HomeWidget.saveWidgetData('dday_updated_at', now.toIso8601String());

    await HomeWidget.updateWidget(
      androidName: ddayWidgetAndroid,
      iOSName: ddayWidgetIOS,
    );
  }

  // D-Day 위젯 업데이트 (여행 목록에서 자동 선택)
  Future<void> updateDDayWidgetAuto({required List<TripEntity> trips}) async {
    final settings = await getSettings();
    final selectedTrip = selectTripForWidget(trips: trips, settings: settings);

    if (selectedTrip != null) {
      await updateDDayWidget(trip: selectedTrip);
    } else {
      // 여행이 없으면 빈 상태로 업데이트
      await _clearDDayWidget();
    }
  }

  Future<void> _clearDDayWidget() async {
    await HomeWidget.saveWidgetData('dday_trip_id', -1);
    await HomeWidget.saveWidgetData('dday_trip_title', '여행을 추가해주세요');
    await HomeWidget.saveWidgetData('dday_trip_place', '');
    await HomeWidget.saveWidgetData('dday_start_date', '');
    await HomeWidget.saveWidgetData('dday_end_date', '');
    await HomeWidget.saveWidgetData('dday_value', 0);
    await HomeWidget.saveWidgetData('dday_text', 'D-?');

    await HomeWidget.updateWidget(
      androidName: ddayWidgetAndroid,
      iOSName: ddayWidgetIOS,
    );
  }

  int _calculateDDay(DateTime now, DateTime start, DateTime end) {
    final today = DateTime(now.year, now.month, now.day);
    final startDay = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day);

    if (today.isBefore(startDay)) {
      return today.difference(startDay).inDays;
    } else if (today.isAfter(endDay)) {
      return today.difference(endDay).inDays;
    } else {
      return today.difference(startDay).inDays + 1;
    }
  }

  String _formatDDayText(int dDay, DateTime now, DateTime start, DateTime end) {
    final today = DateTime(now.year, now.month, now.day);
    final startDay = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day);

    if (today.isBefore(startDay)) {
      if (dDay == 0) return 'D-Day';
      return 'D$dDay';
    } else if (today.isAfter(endDay)) {
      return 'D+$dDay';
    } else {
      return 'Day $dDay';
    }
  }

  // 일정 위젯
  Future<void> updateScheduleWidget({
    required TripEntity trip,
    required List<ScheduleEntity> todaySchedules,
  }) async {
    final now = DateTime.now();

    final settings = await getSettings();
    await _applySettingsToWidget(settings);

    await HomeWidget.saveWidgetData('schedule_trip_id', trip.id);
    await HomeWidget.saveWidgetData('schedule_trip_title', trip.title ?? '여행');
    await HomeWidget.saveWidgetData('schedule_date', _formatDateKorean(now));

    final schedulesJson = todaySchedules.map((s) {
      final dateTime = DateTime.tryParse(s.date ?? '');
      // UTC를 로컬 시간으로 변환
      final localDateTime = dateTime?.toLocal();
      return {
        'id': s.id,
        'title': s.title,
        'time': localDateTime != null ? _formatTime(localDateTime) : '',
        'place': s.place ?? '',
        'categoryId': s.categoryId,
      };
    }).toList();

    await HomeWidget.saveWidgetData('schedule_list', jsonEncode(schedulesJson));
    await HomeWidget.saveWidgetData('schedule_count', todaySchedules.length);
    await HomeWidget.saveWidgetData(
      'schedule_updated_at',
      now.toIso8601String(),
    );

    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );
  }

  // 공통

  // 모든 위젯 업데이트 (D-Day + 일정)
  Future<void> updateAllWidgets({
    required List<TripEntity> trips,
    required List<ScheduleEntity> userSchedules,
  }) async {
    final settings = await getSettings();
    final selectedTrip = selectTripForWidget(trips: trips, settings: settings);

    if (selectedTrip != null) {
      // D-Day 위젯 업데이트
      await updateDDayWidget(trip: selectedTrip);

      // 오늘 일정만 필터링
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final todaySchedules = userSchedules.where((schedule) {
        if (schedule.date == null) return false;
        final scheduleDate = DateTime.tryParse(schedule.date!);
        if (scheduleDate == null) return false;
        final scheduleDay = DateTime(
          scheduleDate.year,
          scheduleDate.month,
          scheduleDate.day,
        );
        return scheduleDay.isAtSameMomentAs(today);
      }).toList();

      // 시간순 정렬
      todaySchedules.sort((a, b) {
        final aDate = DateTime.tryParse(a.date ?? '');
        final bDate = DateTime.tryParse(b.date ?? '');
        if (aDate == null || bDate == null) return 0;
        return aDate.compareTo(bDate);
      });

      // 일정 위젯 업데이트
      await updateScheduleWidget(
        trip: selectedTrip,
        todaySchedules: todaySchedules,
      );
    } else {
      await _clearDDayWidget();
      await _clearScheduleWidget();
    }
  }

  Future<void> _clearScheduleWidget() async {
    final now = DateTime.now();
    await HomeWidget.saveWidgetData('schedule_trip_id', -1);
    await HomeWidget.saveWidgetData('schedule_trip_title', '여행을 추가해주세요');
    await HomeWidget.saveWidgetData('schedule_date', _formatDateKorean(now));
    await HomeWidget.saveWidgetData('schedule_list', '[]');
    await HomeWidget.saveWidgetData('schedule_count', 0);

    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );
  }

  Future<Uri?> getInitialUri() async {
    return await HomeWidget.initiallyLaunchedFromHomeWidget();
  }

  Stream<Uri?> get widgetClicked => HomeWidget.widgetClicked;

  Future<void> refreshAllWidgets() async {
    // Android
    await HomeWidget.updateWidget(
      androidName: ddayWidgetAndroid,
      iOSName: ddayWidgetIOS,
    );
    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );

    // iOS 위젯 타임라인 강제 리로드
    if (Platform.isIOS) {
      await HomeWidget.updateWidget(
        iOSName: ddayWidgetIOS,
        qualifiedAndroidName: '',
      );
      await HomeWidget.updateWidget(
        iOSName: scheduleWidgetIOS,
        qualifiedAndroidName: '',
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }

  String _formatDateKorean(DateTime date) {
    return '${date.month}월 ${date.day}일';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
