import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_travel_friend/core/coachmark/storage/coach_mark_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../coach_mark_builder.dart';

// [이재은] 여행 목록 화면 코치마크
class TripListCoachMark {
  final CoachMarkStorage _storage;

  // GlobalKey들 - 화면에서 위젯에 연결
  final GlobalKey fabKey;
  final GlobalKey searchKey;
  final GlobalKey settingKey;
  final GlobalKey alarmKey;

  TripListCoachMark({
    required this.fabKey,
    required this.searchKey,
    required this.settingKey,
    required this.alarmKey,
    CoachMarkStorage? storage,
  }) : _storage = storage ?? GetIt.instance<CoachMarkStorage>();

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowTripList();

  // 코치마크 표시
  void show(BuildContext context) {
    if (!shouldShow) {
      return;
    }

    // 타겟 목록 생성
    final targets = <TargetFocus>[];

    // FAB 타겟
    if (fabKey.currentContext != null) {
      final target = CoachMarkBuilder.createTarget(
        key: fabKey,
        title: '새 여행 만들기',
        description: '이 버튼을 눌러 새로운 여행을 만들어보세요!\n친구들과 함께 여행을 계획할 수 있어요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
      );

      targets.add(target);
    }

    // 검색 타겟
    if (searchKey.currentContext != null) {
      final target = CoachMarkBuilder.createTarget(
        key: searchKey,
        alignSkip: Alignment.topLeft,
        title: '여행 검색',
        description: '여행 이름이나 장소로 검색할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
      );

      targets.add(target);
    }

    // 알림 타겟
    if (alarmKey.currentContext != null) {
      final target = CoachMarkBuilder.createTarget(
        key: alarmKey,
        alignSkip: Alignment.topLeft,
        title: '알림',
        description: '여행 초대, 일정 변경 등\n중요한 알림을 확인하세요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
      );

      targets.add(target);
    }

    // 설정 타겟
    if (settingKey.currentContext != null) {
      final target = CoachMarkBuilder.createTarget(
        key: settingKey,
        alignSkip: Alignment.topLeft,
        title: '설정',
        description: '프로필, 테마, 알림 설정 등을\n변경할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
      );

      targets.add(target);
    }

    // 코치마크 표시
    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () {
        _storage.completeTripList();
      },
      onSkip: () {
        _storage.completeTripList();
      },
    );
  }
}
