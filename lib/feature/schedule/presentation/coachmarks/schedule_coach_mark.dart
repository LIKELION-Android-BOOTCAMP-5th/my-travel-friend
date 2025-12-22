import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../../core/service/internal/coach_mark_service.dart';

// 스케줄 화면 코치마크
class ScheduleCoachMark {
  final CoachMarkService _coachMarkService;

  // GlobalKey들
  final GlobalKey dateTabKey = GlobalKey();
  final GlobalKey categoryTabKey = GlobalKey();
  final GlobalKey filterKey = GlobalKey();
  final GlobalKey listKey = GlobalKey();
  final GlobalKey fabKey = GlobalKey();

  ScheduleCoachMark({CoachMarkService? coachMarkService})
    : _coachMarkService =
          coachMarkService ?? GetIt.instance<CoachMarkService>();

  // 코치마크 표시 여부
  bool get shouldShow => _coachMarkService.shouldShowScheduleCoachMark();

  // 코치마크 표시
  void show(BuildContext context) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[];

    // 1. 일자별 탭
    if (dateTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: dateTabKey,
          title: '일자별 보기',
          description: '날짜별로 일정을 확인할 수 있어요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 2. 카테고리별 탭
    if (categoryTabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: categoryTabKey,
          title: '카테고리별 보기',
          description: '숙소, 식당, 관광지 등\n카테고리별로 일정을 모아볼 수 있어요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 3. 필터
    if (filterKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: filterKey,
          title: '필터',
          description: '전체 또는 특정 날짜/카테고리만\n선택해서 볼 수 있어요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 4. 일정 리스트
    if (listKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: listKey,
          title: '일정 목록',
          description: '크루 모두가 함께 볼 수 있어요.\n일정을 탭하면 수정하거나 삭제할 수 있어요.',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // 5. FAB
    if (fabKey.currentContext != null) {
      targets.add(
        _coachMarkService.createTarget(
          key: fabKey,
          title: '일정 추가',
          description: '새로운 일정을 추가하세요.\n장소, 시간, 메모를 입력할 수 있어요.',
          align: ContentAlign.top,
          shape: ShapeLightFocus.Circle,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    if (targets.isEmpty) return;

    _coachMarkService.showCoachMark(
      context: context,
      targets: targets,
      onFinish: () => _coachMarkService.completeScheduleCoachMark(),
      onSkip: () => _coachMarkService.completeScheduleCoachMark(),
    );
  }
}
