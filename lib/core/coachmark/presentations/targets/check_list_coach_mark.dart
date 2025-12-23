import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../models/coach_mark_model.dart';
import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

@injectable
class ChecklistCoachMark {
  final CoachMarkStorage _storage;

  ChecklistCoachMark(this._storage);

  bool get shouldShow => _storage.shouldShowChecklist();

  void show(
    BuildContext context, {
    required GlobalKey checklistTabKey,
    required GlobalKey todoTabKey,
    required GlobalKey progressKey,
    required GlobalKey listKey,
    required GlobalKey fabKey,
  }) {
    if (!shouldShow) return;

    final targets = [
      CoachMarkTarget(
        key: checklistTabKey,
        title: '챙길 것',
        description: '여행에 필요한 짐을 체크하세요.\n추가할 것은 없는지 AI에게 물어볼 수도 있어요',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: todoTabKey,
        title: '해야 할 것',
        description: '여행 전 해야 할 일을 관리하세요.\n환전, 예약 확인 등을 체크할 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: progressKey,
        title: '진행률',
        description: '얼마나 준비했는지 한 눈에 확인하세요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: listKey,
        title: '체크리스트',
        description: '항목을 탭하면 체크할 수 있어요.\n언제든지 삭제하고 다시 추가할 수 있어요',
        align: ContentAlign.top,
      ),
      CoachMarkTarget(
        key: fabKey,
        title: '항목 추가',
        description: '새로운 항목을 추가하세요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeChecklist(),
      onSkip: () => _storage.completeChecklist(),
    );
  }
}
