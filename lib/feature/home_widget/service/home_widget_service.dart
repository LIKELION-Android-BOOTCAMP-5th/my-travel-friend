import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // 백그라운드 위젯 업데이트 (WorkManager/BGTaskScheduler에서 호출)

  Future<void> refreshWidgetsInBackground() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('widget_user_id');

      if (userId == null) {
        debugPrint('⚠️ No user ID for background widget update');
        return;
      }

      debugPrint('🔄 Background widget update for user: $userId');

      final supabase = Supabase.instance.client;

      // 1. 여행 목록 조회
      final tripsResponse = await supabase
          .from('trip_crew')
          .select('''
            trip:trip_id (
              id,
              created_at,
              title,
              place,
              start_at,
              end_at,
              cover_type,
              cover_img,
              user_id,
              deleted_at,
              country
            )
          ''')
          .eq('member_id', userId)
          .order('created_at', ascending: false)
          .limit(10);

      if (tripsResponse == null || (tripsResponse as List).isEmpty) {
        debugPrint('⚠️ No trips found for background update');
        await _clearAllWidgets();
        return;
      }

      // Trip 데이터 파싱
      final trips = (tripsResponse as List)
          .map((item) {
            final tripData = item['trip'] as Map<String, dynamic>;
            return TripEntity(
              id: tripData['id'],
              createdAt: tripData['created_at'],
              title: tripData['title'] ?? '',
              place: tripData['place'] ?? '',
              startAt: tripData['start_at'] ?? '',
              endAt: tripData['end_at'] ?? '',
              coverType: tripData['cover_type'] ?? 'BLUE',
              coverImg: tripData['cover_img'],
              userId: tripData['user_id'],
              deletedAt: tripData['deleted_at'],
              country: tripData['country'] ?? '',
            );
          })
          .where((trip) => trip.deletedAt == null)
          .toList();

      if (trips.isEmpty) {
        await _clearAllWidgets();
        return;
      }

      // 2. 위젯에 표시할 여행 선택
      final settings = await getSettings();
      final selectedTrip = selectTripForWidget(
        trips: trips,
        settings: settings,
      );

      if (selectedTrip == null) {
        await _clearAllWidgets();
        return;
      }

      // 3. 선택된 여행의 전체 일정 조회
      final schedulesResponse = await supabase
          .from('schedule')
          .select()
          .eq('trip_id', selectedTrip.id!)
          .isFilter('deleted_at', null)
          .order('date', ascending: true);

      final allSchedules =
          (schedulesResponse as List?)?.map((item) {
            return ScheduleEntity(
              id: item['id'],
              createdAt: item['created_at'],
              tripId: item['trip_id'],
              title: item['title'] ?? '',
              place: item['place'],
              address: item['address'],
              lat: item['lat']?.toDouble(),
              lng: item['lng']?.toDouble(),
              date: item['date'],
              description: item['description'],
              categoryId: item['category_id'],
            );
          }).toList() ??
          [];

      // 4. 위젯 데이터 업데이트
      await updateAllWidgetsWithAllSchedules(
        trip: selectedTrip,
        allSchedules: allSchedules,
      );

      debugPrint(' Background widget update completed');
    } catch (e, stackTrace) {
      debugPrint(' Background widget update error: $e');
      debugPrint('$stackTrace');
    }
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
    return '#${colorValue.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  // 여행 선택 로직

  TripEntity? selectTripForWidget({
    required List<TripEntity> trips,
    required WidgetSettingsEntity settings,
  }) {
    if (trips.isEmpty) return null;

    if (settings.autoSelectTrip) {
      return _findClosestTrip(trips);
    }

    if (settings.selectedTripId != null) {
      final selectedTrip = trips
          .where((t) => t.id == settings.selectedTripId)
          .firstOrNull;

      return selectedTrip ?? _findClosestTrip(trips);
    }

    return _findClosestTrip(trips);
  }

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

      if (!today.isBefore(startDay) && !today.isAfter(endDay)) {
        ongoingTrip = trip;
        break;
      }

      if (today.isBefore(startDay)) {
        final daysToStart = startDay.difference(today).inDays;
        if (minDaysToStart == null || daysToStart < minDaysToStart) {
          minDaysToStart = daysToStart;
          closestUpcoming = trip;
        }
      }

      if (today.isAfter(endDay)) {
        final daysFromEnd = today.difference(endDay).inDays;
        if (minDaysFromEnd == null || daysFromEnd < minDaysFromEnd) {
          minDaysFromEnd = daysFromEnd;
          closestPast = trip;
        }
      }
    }

    return ongoingTrip ?? closestUpcoming ?? closestPast;
  }

  // D-Day 위젯

  Future<void> updateDDayWidget({required TripEntity trip}) async {
    final now = DateTime.now();
    final startDate = DateTime.parse(trip.startAt);
    final endDate = DateTime.parse(trip.endAt);

    final dDay = _calculateDDay(now, startDate, endDate);
    final dDayText = _formatDDayText(dDay, now, startDate, endDate);

    final settings = await getSettings();
    await _applySettingsToWidget(settings);

    await Future.wait([
      HomeWidget.saveWidgetData('dday_trip_id', trip.id),
      HomeWidget.saveWidgetData('dday_trip_title', trip.title ?? '여행'),
      HomeWidget.saveWidgetData('dday_trip_place', trip.place ?? ''),
      HomeWidget.saveWidgetData('dday_start_date', _formatDate(startDate)),
      HomeWidget.saveWidgetData('dday_end_date', _formatDate(endDate)),
      HomeWidget.saveWidgetData('dday_value', dDay),
      HomeWidget.saveWidgetData('dday_text', dDayText),
      HomeWidget.saveWidgetData('dday_updated_at', now.toIso8601String()),
      // 네이티브에서 D-Day 직접 계산용 (시작 날짜 원본)
      HomeWidget.saveWidgetData('dday_start_date_raw', trip.startAt),
      HomeWidget.saveWidgetData('dday_end_date_raw', trip.endAt),
    ]);

    await HomeWidget.updateWidget(
      androidName: ddayWidgetAndroid,
      iOSName: ddayWidgetIOS,
    );
  }

  Future<void> updateDDayWidgetAuto({required List<TripEntity> trips}) async {
    final settings = await getSettings();
    final selectedTrip = selectTripForWidget(trips: trips, settings: settings);

    if (selectedTrip != null) {
      await updateDDayWidget(trip: selectedTrip);
    } else {
      await _clearDDayWidget();
    }
  }

  Future<void> _clearDDayWidget() async {
    await Future.wait([
      HomeWidget.saveWidgetData('dday_trip_id', -1),
      HomeWidget.saveWidgetData('dday_trip_title', '여행을 추가해주세요'),
      HomeWidget.saveWidgetData('dday_trip_place', ''),
      HomeWidget.saveWidgetData('dday_start_date', ''),
      HomeWidget.saveWidgetData('dday_end_date', ''),
      HomeWidget.saveWidgetData('dday_value', 0),
      HomeWidget.saveWidgetData('dday_text', 'D-?'),
      HomeWidget.saveWidgetData('dday_start_date_raw', ''),
      HomeWidget.saveWidgetData('dday_end_date_raw', ''),
    ]);

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

    await Future.wait([
      HomeWidget.saveWidgetData('schedule_trip_id', trip.id),
      HomeWidget.saveWidgetData('schedule_trip_title', trip.title ?? '여행'),
      HomeWidget.saveWidgetData('schedule_date', _formatDateKorean(now)),
    ]);

    final schedulesJson = todaySchedules.map((s) {
      final dateTime = DateTime.tryParse(s.date ?? '');
      final localDateTime = dateTime?.toLocal();
      return {
        'id': s.id,
        'title': s.title,
        'time': localDateTime != null ? _formatTime(localDateTime) : '',
        'place': s.place ?? '',
        'categoryId': s.categoryId,
      };
    }).toList();

    await Future.wait([
      HomeWidget.saveWidgetData('schedule_list', jsonEncode(schedulesJson)),
      HomeWidget.saveWidgetData('schedule_count', todaySchedules.length),
      HomeWidget.saveWidgetData('schedule_updated_at', now.toIso8601String()),
    ]);

    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );
  }

  // 전체 일정도 함께 저장 (네이티브에서 오늘 날짜 필터링용)
  Future<void> updateScheduleWidgetWithAllSchedules({
    required TripEntity trip,
    required List<ScheduleEntity> allSchedules,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // 오늘 일정 필터링
    final todaySchedules = allSchedules.where((schedule) {
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

    final settings = await getSettings();
    await _applySettingsToWidget(settings);

    // 오늘 일정 JSON (최대 3개 표시용)
    final todaySchedulesJson = todaySchedules.map((s) {
      final dateTime = DateTime.tryParse(s.date ?? '');
      final localDateTime = dateTime?.toLocal();
      return {
        'id': s.id,
        'title': s.title,
        'time': localDateTime != null ? _formatTime(localDateTime) : '',
        'place': s.place ?? '',
        'categoryId': s.categoryId,
      };
    }).toList();

    // 전체 일정 JSON (네이티브에서 오늘 날짜 필터링용)
    final allSchedulesJson = allSchedules.map((s) {
      final dateTime = DateTime.tryParse(s.date ?? '');
      final localDateTime = dateTime?.toLocal();
      return {
        'id': s.id,
        'title': s.title,
        'date': s.date, // 원본 날짜 (필터링용)
        'time': localDateTime != null ? _formatTime(localDateTime) : '',
        'place': s.place ?? '',
        'categoryId': s.categoryId,
      };
    }).toList();

    await Future.wait([
      HomeWidget.saveWidgetData('schedule_trip_id', trip.id),
      HomeWidget.saveWidgetData('schedule_trip_title', trip.title ?? '여행'),
      HomeWidget.saveWidgetData('schedule_date', _formatDateKorean(now)),
      HomeWidget.saveWidgetData(
        'schedule_list',
        jsonEncode(todaySchedulesJson),
      ),
      HomeWidget.saveWidgetData('schedule_count', todaySchedules.length),
      HomeWidget.saveWidgetData('schedule_updated_at', now.toIso8601String()),
      // 전체 일정 저장 (네이티브에서 오늘 날짜 필터링용)
      HomeWidget.saveWidgetData(
        'schedule_all_list',
        jsonEncode(allSchedulesJson),
      ),
    ]);

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

      // 전체 일정도 함께 저장
      await updateScheduleWidgetWithAllSchedules(
        trip: selectedTrip,
        allSchedules: userSchedules,
      );
    } else {
      await _clearAllWidgets();
    }
  }

  // 전체 일정과 함께 모든 위젯 업데이트 (백그라운드용)
  Future<void> updateAllWidgetsWithAllSchedules({
    required TripEntity trip,
    required List<ScheduleEntity> allSchedules,
  }) async {
    // D-Day 위젯 업데이트
    await updateDDayWidget(trip: trip);

    // 일정 위젯 업데이트 (전체 일정 포함)
    await updateScheduleWidgetWithAllSchedules(
      trip: trip,
      allSchedules: allSchedules,
    );
  }

  Future<void> _clearScheduleWidget() async {
    final now = DateTime.now();
    await Future.wait([
      HomeWidget.saveWidgetData('schedule_trip_id', -1),
      HomeWidget.saveWidgetData('schedule_trip_title', '여행을 추가해주세요'),
      HomeWidget.saveWidgetData('schedule_date', _formatDateKorean(now)),
      HomeWidget.saveWidgetData('schedule_list', '[]'),
      HomeWidget.saveWidgetData('schedule_count', 0),
      HomeWidget.saveWidgetData('schedule_all_list', '[]'),
    ]);

    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );
  }

  Future<void> _clearAllWidgets() async {
    await _clearDDayWidget();
    await _clearScheduleWidget();
  }

  Future<Uri?> getInitialUri() async {
    return await HomeWidget.initiallyLaunchedFromHomeWidget();
  }

  Stream<Uri?> get widgetClicked => HomeWidget.widgetClicked;

  Future<void> refreshAllWidgets() async {
    await HomeWidget.updateWidget(
      androidName: ddayWidgetAndroid,
      iOSName: ddayWidgetIOS,
    );
    await HomeWidget.updateWidget(
      androidName: scheduleWidgetAndroid,
      iOSName: scheduleWidgetIOS,
    );

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
