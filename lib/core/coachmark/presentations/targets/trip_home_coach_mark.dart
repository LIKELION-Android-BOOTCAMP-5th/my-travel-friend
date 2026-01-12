import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../models/coach_mark_model.dart';
import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 여행홈 코치마크
@injectable
class TripHomeCoachMark {
  final CoachMarkStorage _storage;

  TripHomeCoachMark(this._storage);

  bool get shouldShow => _storage.shouldShowTripHome();

  void show(
    BuildContext context, {
    required GlobalKey crewKey,
    required GlobalKey inviteKey,
    required GlobalKey calendarKey,
    required GlobalKey scheduleKey,
  }) {
    if (!shouldShow) return;

    final targets = [
      CoachMarkTarget(
        key: crewKey,
        title: '크루 멤버',
        description: '함께 여행하는 친구들을 확인하세요.\n탭하면 멤버 목록이 펼쳐져요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topLeft,
      ),
      CoachMarkTarget(
        key: inviteKey,
        title: '친구 초대',
        description: '친구를 여행에 초대해보세요!\n함께 일정을 계획할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topLeft,
      ),
      CoachMarkTarget(
        key: calendarKey,
        title: '주간 캘린더',
        description: '날짜를 선택하면 해당 날짜의\n일정을 확인할 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topLeft,
      ),
      CoachMarkTarget(
        key: scheduleKey,
        title: '오늘의 일정',
        description: '선택한 날짜의 일정이 표시돼요.\n탭하면 상세 정보를 볼 수 있어요.',
        align: ContentAlign.top,
        alignSkip: Alignment.topLeft,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeTripHome(),
      onSkip: () => _storage.completeTripHome(),
    );
  }
}
