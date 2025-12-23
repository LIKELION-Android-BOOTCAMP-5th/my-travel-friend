import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 네비게이션 코치마크
@injectable
class TripShellCoachMark {
  final CoachMarkStorage _storage;

  TripShellCoachMark(this._storage);

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowTripTabs();

  // 코치마크 표시
  void show(
    BuildContext context, {
    required GlobalKey menuButtonKey,
    required GlobalKey homeTabKey,
    required GlobalKey scheduleTabKey,
    required GlobalKey checklistTabKey,
    required GlobalKey diaryTabKey,
    required GlobalKey talkTabKey,
    VoidCallback? onFinish,
    VoidCallback? onShowHomeCoachMark,
  }) {
    if (!shouldShow) {
      onShowHomeCoachMark?.call();
      onFinish?.call();
      return;
    }

    final targets = <TargetFocus>[
      CoachMarkBuilder.createTarget(
        key: menuButtonKey,
        title: '여행 관리',
        description: '여행 정보를 수정하거나\n여행을 포기할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.bottomRight,
      ),
      CoachMarkBuilder.createTarget(
        key: homeTabKey,
        title: '여행 홈',
        description: '크루 멤버, 캘린더, 오늘의 일정을\n한 눈에 확인할 수 있어요.',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: scheduleTabKey,
        title: '스케줄',
        description: '여행 일정을 추가하고 관리하세요.\n추가된 일정은 크루 모두가 함께 공유해요',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: checklistTabKey,
        title: '체크리스트',
        description: '준비물과 할 일을 체크하세요.\n체크리스트는 나만 볼 수 있어요',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: diaryTabKey,
        title: '다이어리',
        description: '여행의 순간을 기록하세요.\n메모, 사진, 리뷰, 소비 내역을 남길 수 있어요.',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: talkTabKey,
        title: '톡톡',
        description: '크루와 실시간으로 대화하세요.\n여행 중 소통이 편해져요!',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () {
        _storage.completeTripTabs();
        onShowHomeCoachMark?.call();
        onFinish?.call();
      },
      onSkip: () {
        _storage.completeTripTabs();
        onShowHomeCoachMark?.call();
        onFinish?.call();
      },
    );
  }
}
