import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// [이재은] 코치마크 상태 저장소
@LazySingleton()
class CoachMarkStorage {
  final SharedPreferences _prefs;

  static const String _tripListKey = 'coach_mark_trip_list';
  static const String _tripTabsKey = 'coach_mark_trip_tabs';
  static const String _tripHomeKey = 'coach_mark_trip_home';
  static const String _scheduleKey = 'coach_mark_schedule';
  static const String _createScheduleKey = 'coach_mark_create_schedule';
  static const String _diaryKey = 'coach_mark_diary';
  static const String _checklistKey = 'coach_mark_checklist';

  CoachMarkStorage(this._prefs);

  // 표시 여부 확인
  bool shouldShowTripList() => !(_prefs.getBool(_tripListKey) ?? false);
  bool shouldShowTripTabs() => !(_prefs.getBool(_tripTabsKey) ?? false);
  bool shouldShowTripHome() => !(_prefs.getBool(_tripHomeKey) ?? false);
  bool shouldShowSchedule() => !(_prefs.getBool(_scheduleKey) ?? false);
  bool shouldShowCreateSchedule() =>
      !(_prefs.getBool(_createScheduleKey) ?? false);
  bool shouldShowDiary() => !(_prefs.getBool(_diaryKey) ?? false);
  bool shouldShowChecklist() => !(_prefs.getBool(_checklistKey) ?? false);

  // 완료 처리
  Future<void> completeTripList() => _prefs.setBool(_tripListKey, true);
  Future<void> completeTripTabs() => _prefs.setBool(_tripTabsKey, true);
  Future<void> completeTripHome() => _prefs.setBool(_tripHomeKey, true);
  Future<void> completeSchedule() => _prefs.setBool(_scheduleKey, true);
  Future<void> completeCreateSchedule() =>
      _prefs.setBool(_createScheduleKey, true);
  Future<void> completeDiary() => _prefs.setBool(_diaryKey, true);
  Future<void> completeChecklist() => _prefs.setBool(_checklistKey, true);
}
