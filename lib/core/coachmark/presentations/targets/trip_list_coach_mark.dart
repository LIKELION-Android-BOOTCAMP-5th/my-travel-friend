import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/coachmark/storage/coach_mark_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../coach_mark_builder.dart';

@injectable
// [이재은] 여행 목록 화면 코치마크
class TripListCoachMark {
  final CoachMarkStorage _storage;

  TripListCoachMark(this._storage);

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowTripList();

  void show(
    BuildContext context, {
    required GlobalKey fabKey,
    required GlobalKey searchKey,
    required GlobalKey settingKey,
    required GlobalKey alarmKey,
  }) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[
      CoachMarkBuilder.createTarget(
        key: fabKey,
        title: '새 여행 만들기',
        description: '이 버튼을 눌러 새로운 여행을 만들어보세요!\n친구들과 함께 여행을 계획할 수 있어요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
      ),
      CoachMarkBuilder.createTarget(
        key: searchKey,
        title: '여행 검색',
        description: '여행 이름이나 장소로 검색할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: alarmKey,
        title: '알림',
        description: '여행 초대, 일정 변경 등\n중요한 알림을 확인하세요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: settingKey,
        title: '설정',
        description: '프로필, 테마, 알림 설정 등을\n변경할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topLeft,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeTripList(),
      onSkip: () => _storage.completeTripList(),
    );
  }
}
