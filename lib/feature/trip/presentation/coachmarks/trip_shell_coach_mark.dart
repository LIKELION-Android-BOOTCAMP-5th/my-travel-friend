import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../../core/service/internal/coach_mark_service.dart';

// [이재은] 네비게이션 코치마크
class TripShellCoachMark {
  final CoachMarkService _coachMarkService;

  // GlobalKey들 - BottomNavigation 탭
  final GlobalKey homeTabKey = GlobalKey();
  final GlobalKey scheduleTabKey = GlobalKey();
  final GlobalKey checklistTabKey = GlobalKey();
  final GlobalKey diaryTabKey = GlobalKey();
  final GlobalKey talkTabKey = GlobalKey();
  final GlobalKey menuButtonKey = GlobalKey();

  TripShellCoachMark({CoachMarkService? coachMarkService})
    : _coachMarkService =
          coachMarkService ?? GetIt.instance<CoachMarkService>();

  // 코치마크 표시 여부 (TripHome 코치마크와 별개)
  bool get shouldShow => _coachMarkService.shouldShowTripHomeCoachMark();

  // 코치마크 표시
  void show(BuildContext context) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[];

    // 0. 메뉴 버튼 (가장 먼저!)
    if (menuButtonKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: menuButtonKey,
          title: '여행 관리',
          description: '여행 정보를 수정하거나\n여행을 포기할 수 있어요.',
          align: ContentAlign.bottom,
          shape: ShapeLightFocus.Circle,
          alignSkip: Alignment.bottomRight,
        ),
      );
    }

    // 1. 여행 홈 탭
    if (homeTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: homeTabKey,
          title: '여행 홈',
          description: '크루 멤버, 캘린더, 오늘의 일정을\n한 눈에 확인할 수 있어요.',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 2. 스케줄 탭
    if (scheduleTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: scheduleTabKey,
          title: '스케줄',
          description: '여행 일정을 추가하고 관리하세요.\n추가된 일정은 크루 모두가 함께 공유해요',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 3. 체크리스트 탭
    if (checklistTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: checklistTabKey,
          title: '체크리스트',
          description: '준비물과 할 일을 체크하세요.\n체크리스트는 나만 볼 수 있어요',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 4. 다이어리 탭
    if (diaryTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: diaryTabKey,
          title: '다이어리',
          description: '여행의 순간을 기록하세요.\n메모, 사진, 리뷰, 소비 내역을 남길 수 있어요.',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 5. 톡톡 탭
    if (talkTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: talkTabKey,
          title: '톡톡',
          description: '크루와 실시간으로 대화하세요.\n여행 중 소통이 편해져요!',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    if (targets.isEmpty) return;

    _coachMarkService.showCoachMark(
      context: context,
      targets: targets,
      onFinish: () => _coachMarkService.completeTripHomeCoachMark(),
      onSkip: () => _coachMarkService.completeTripHomeCoachMark(),
    );
  }
}
