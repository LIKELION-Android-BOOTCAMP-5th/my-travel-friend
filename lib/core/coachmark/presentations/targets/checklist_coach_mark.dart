import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 체크리스트 화면 코치마크
class ChecklistCoachMark {
  final CoachMarkStorage _storage;

  // GlobalKey들
  final GlobalKey checklistTabKey;
  final GlobalKey todoTabKey;
  final GlobalKey progressKey;
  final GlobalKey listKey;
  final GlobalKey fabKey;

  ChecklistCoachMark({
    required this.checklistTabKey,
    required this.todoTabKey,
    required this.progressKey,
    required this.listKey,
    required this.fabKey,
    CoachMarkStorage? storage,
  }) : _storage = storage ?? GetIt.instance<CoachMarkStorage>();

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowChecklist();

  // 코치마크 표시
  void show(BuildContext context) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[];

    // 챙길 것
    if (checklistTabKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: checklistTabKey,
          title: '챙길 것',
          description: '여행에 필요한 짐을 체크하세요.\n추가할 것은 없는지 AI에게 물어볼 수도 있어요',
          align: ContentAlign.bottom,
          alignSkip: Alignment.bottomLeft,
        ),
      );
    }

    // 해야 할 것
    if (todoTabKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: todoTabKey,
          title: '해야 할 것',
          description: '여행 전 해야 할 일을 관리하세요.\n환전, 예약 확인 등을 체크할 수 있어요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.bottomLeft,
        ),
      );
    }

    // 진행률
    if (progressKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: progressKey,
          title: '진행률',
          description: '얼마나 준비했는지 한 눈에 확인하세요.',
          align: ContentAlign.bottom,
          alignSkip: Alignment.bottomLeft,
        ),
      );
    }

    // 리스트
    if (listKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: listKey,
          title: '체크리스트',
          description: '항목을 탭하면 체크할 수 있어요.\n언제든지 삭제하고 다시 추가할 수 있어요',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    // FAB
    if (fabKey.currentContext != null) {
      targets.add(
        CoachMarkBuilder.createTarget(
          key: fabKey,
          title: '항목 추가',
          description: '새로운 항목을 추가하세요.',
          align: ContentAlign.top,
          shape: ShapeLightFocus.Circle,
          alignSkip: Alignment.topRight,
        ),
      );
    }

    if (targets.isEmpty) return;

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeChecklist(),
      onSkip: () => _storage.completeChecklist(),
    );
  }
}
