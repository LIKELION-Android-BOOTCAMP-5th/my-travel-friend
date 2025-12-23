import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 스케줄 화면 코치마크
@injectable
class ScheduleCoachMark {
  final CoachMarkStorage _storage;

  ScheduleCoachMark(this._storage);

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowSchedule();

  // 코치마크 표시
  void show(
    BuildContext context, {
    required GlobalKey dateTabKey,
    required GlobalKey categoryTabKey,
    required GlobalKey filterKey,
    required GlobalKey listKey,
    required GlobalKey fabKey,
  }) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[
      CoachMarkBuilder.createTarget(
        key: dateTabKey,
        title: '일자별 보기',
        description: '날짜별로 일정을 확인할 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: categoryTabKey,
        title: '카테고리별 보기',
        description: '숙소, 식당, 관광지 등\n카테고리별로 일정을 모아볼 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: filterKey,
        title: '필터',
        description: '전체 또는 특정 날짜/카테고리만\n선택해서 볼 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: listKey,
        title: '일정 목록',
        description: '크루 모두가 함께 볼 수 있어요.\n일정을 탭하면 수정하거나 삭제할 수 있어요.',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: fabKey,
        title: '일정 추가',
        description: '새로운 일정을 추가하세요.\n장소, 시간, 메모를 입력할 수 있어요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topRight,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeSchedule(),
      onSkip: () => _storage.completeSchedule(),
    );
  }
}
