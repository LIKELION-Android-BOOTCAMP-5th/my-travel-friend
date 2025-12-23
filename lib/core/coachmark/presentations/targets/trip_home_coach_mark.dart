import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_travel_friend/core/coachmark/storage/coach_mark_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../coach_mark_builder.dart';

// [이재은] 여행홈 코치마크
class TripHomeCoachMark {
  final CoachMarkStorage _storage;

  // GlobalKey
  final GlobalKey calendarKey;
  final GlobalKey crewKey;
  final GlobalKey inviteKey;
  final GlobalKey scheduleKey;

  TripHomeCoachMark({
    required this.calendarKey,
    required this.crewKey,
    required this.inviteKey,
    required this.scheduleKey,
    CoachMarkStorage? storage,
  }) : _storage = storage ?? GetIt.instance<CoachMarkStorage>();

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowTripHome();

  // 코치마크 표시
  void show(BuildContext context) {
    if (!shouldShow) {
      return;
    }

    // 타겟 목록 생성
    final targets = <TargetFocus>[];

    // 크루 멤버 타겟
    if (crewKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: crewKey,
          title: '크루 멤버',
          description: '함께 여행하는 친구들을 확인하세요.\n탭하면 멤버 목록이 펼쳐져요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.topLeft,
        ),
      );
    }

    // 초대 버튼 타겟
    if (inviteKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: inviteKey,
          title: '친구 초대',
          description: '친구를 여행에 초대해보세요!\n함께 일정을 계획할 수 있어요.',
          align: ContentAlign.bottom,
          shape: ShapeLightFocus.Circle,
          alignSkip: Alignment.topLeft,
        ),
      );
    }

    // 캘린더 타겟
    if (calendarKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: calendarKey,
          title: '주간 캘린더',
          description: '날짜를 선택하면 해당 날짜의\n일정을 확인할 수 있어요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.topLeft,
        ),
      );
    }

    // 일정 타겟
    if (scheduleKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: scheduleKey,
          title: '오늘의 일정',
          description: '선택한 날짜의 일정이 표시돼요.\n탭하면 상세 정보를 볼 수 있어요.',
          align: ContentAlign.top,
          alignSkip: Alignment.topLeft,
        ),
      );
    }

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeTripHome(),
      onSkip: () => _storage.completeTripHome(),
    );
  }
}
