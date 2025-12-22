import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../theme/app_colors.dart';

// [이재은] 코치마크 서비스
@LazySingleton()
class CoachMarkService {
  final SharedPreferences _prefs;

  // SharedPreferences 키
  static const String _tripListKey = 'coach_mark_trip_list';
  static const String _tripTabsKey = 'coach_mark_trip_tabs';
  static const String _tripHomeKey = 'coach_mark_trip_home';
  static const String _scheduleKey = 'coach_mark_schedule';
  static const String _createScheduleKey = 'coach_mark_create_schedule';
  static const String _diaryKey = 'coach_mark_diary';
  static const String _checklistKey = 'coach_mark_checklist';

  CoachMarkService(this._prefs);

  // 표시 여부 확인

  bool shouldShowTripListCoachMark() =>
      !(_prefs.getBool(_tripListKey) ?? false);
  bool shouldShowTripTabsCoachMark() =>
      !(_prefs.getBool(_tripTabsKey) ?? false);
  bool shouldShowTripHomeCoachMark() =>
      !(_prefs.getBool(_tripHomeKey) ?? false);
  bool shouldShowScheduleCoachMark() =>
      !(_prefs.getBool(_scheduleKey) ?? false);
  bool shouldShowCreateScheduleCoachMark() =>
      !(_prefs.getBool(_createScheduleKey) ?? false);
  bool shouldShowDiaryCoachMark() => !(_prefs.getBool(_diaryKey) ?? false);
  bool shouldShowChecklistCoachMark() =>
      !(_prefs.getBool(_checklistKey) ?? false);

  // 완료 처리

  Future<void> completeTripListCoachMark() async {
    await _prefs.setBool(_tripListKey, true);
  }

  Future<void> completeTripTabsCoachMark() async {
    await _prefs.setBool(_tripTabsKey, true);
  }

  Future<void> completeTripHomeCoachMark() async {
    await _prefs.setBool(_tripHomeKey, true);
  }

  Future<void> completeScheduleCoachMark() async {
    await _prefs.setBool(_scheduleKey, true);
  }

  Future<void> completeCreateScheduleCoachMark() async {
    await _prefs.setBool(_createScheduleKey, true);
  }

  Future<void> completeDiaryCoachMark() async {
    await _prefs.setBool(_diaryKey, true);
  }

  Future<void> completeChecklistCoachMark() async {
    await _prefs.setBool(_checklistKey, true);
  }

  // 초기화
  Future<void> resetAllCoachMarks() async {
    await _prefs.remove(_tripListKey);
    await _prefs.remove(_tripHomeKey);
    await _prefs.remove(_scheduleKey);
    await _prefs.remove(_createScheduleKey);
    await _prefs.remove(_diaryKey);
    await _prefs.remove(_checklistKey);
  }

  // 코치마크 표시
  void showCoachMark({
    required BuildContext context,
    required List<TargetFocus> targets,
    required VoidCallback onFinish,
    VoidCallback? onSkip,
    Color? colorShadow,
  }) {
    if (targets.isEmpty) return;

    TutorialCoachMark(
      targets: targets,
      colorShadow: colorShadow ?? Colors.black,
      opacityShadow: 0.8,
      textSkip: '건너뛰기',
      textStyleSkip: AppFont.regular.copyWith(color: AppColors.light),
      paddingFocus: 10,
      focusAnimationDuration: const Duration(milliseconds: 300),
      pulseAnimationDuration: const Duration(milliseconds: 500),
      onFinish: onFinish,
      onSkip: () {
        onSkip?.call();
        return true;
      },
    ).show(context: context, rootOverlay: true);
  }

  // 단일 타겟 생성
  TargetFocus createTarget({
    required GlobalKey key,
    required String title,
    required String description,
    ContentAlign align = ContentAlign.bottom,
    ShapeLightFocus shape = ShapeLightFocus.RRect,
    double? radius,
    double? paddingFocus,
    Alignment alignSkip = Alignment.topRight,
  }) {
    return TargetFocus(
      identify: key.toString(),
      keyTarget: key,
      alignSkip: alignSkip,
      shape: shape,
      radius: radius ?? 8,
      paddingFocus: paddingFocus ?? 8,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            return _buildCoachMarkContent(
              title: title,
              description: description,
            );
          },
        ),
      ],
    );
  }

  TargetFocus createTargetWithScroll({
    required GlobalKey key,
    required String title,
    required String description,
    required ScrollController scrollController,
    ContentAlign align = ContentAlign.bottom,
    ShapeLightFocus shape = ShapeLightFocus.RRect,
    double? radius,
    double? paddingFocus,
    Alignment alignSkip = Alignment.topRight,
  }) {
    return TargetFocus(
      identify: key.toString(),
      keyTarget: key,
      alignSkip: alignSkip,
      shape: shape,
      radius: radius ?? 8,
      paddingFocus: paddingFocus ?? 8,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            _scrollToTarget(key, scrollController);
            return _buildCoachMarkContent(
              title: title,
              description: description,
            );
          },
        ),
      ],
    );
  }

  // 타겟 위치로 스크롤
  void _scrollToTarget(GlobalKey key, ScrollController scrollController) {
    if (!scrollController.hasClients) return;

    final keyContext = key.currentContext;
    if (keyContext == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = keyContext.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(keyContext).size.height;

      // 화면 중앙에 오도록 스크롤
      final targetScroll =
          scrollController.offset + position.dy - (screenHeight / 3);

      scrollController.animateTo(
        targetScroll.clamp(0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // 코치마크 컨텐츠 위젯
  Widget _buildCoachMarkContent({
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFont.medium.copyWith(color: AppColors.light)),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppFont.regular.copyWith(color: AppColors.light),
          ),
        ],
      ),
    );
  }
}
