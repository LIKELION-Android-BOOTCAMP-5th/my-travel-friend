import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 스케줄 작성 화면 코치마크
@injectable
class CreateScheduleCoachMark {
  final CoachMarkStorage _storage;

  CreateScheduleCoachMark(this._storage);

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowCreateSchedule();

  // 코치마크 표시
  void show(
    BuildContext context, {
    required GlobalKey searchButtonKey,
    required GlobalKey titleKey,
    required GlobalKey dateTimeKey,
    required GlobalKey placeKey,
    required GlobalKey categoryKey,
    required GlobalKey memberKey,
    ScrollController? scrollController,
  }) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[
      CoachMarkBuilder.createTarget(
        key: searchButtonKey,
        title: '장소 검색',
        description: '지도에서 장소를 검색하고 선택할 수 있어요.',
        align: ContentAlign.bottom,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.bottomRight,
      ),
      CoachMarkBuilder.createTarget(
        key: titleKey,
        title: '일정 제목',
        description: '일정의 이름을 입력하세요.\n예: 성산일출봉 방문',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: dateTimeKey,
        title: '날짜와 시간',
        description: '일정의 날짜와 시간을 선택하세요.\n여행 기간 내에서만 선택할 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: placeKey,
        title: '장소',
        description: '장소 이름을 직접 입력하거나\n상단 검색 버튼으로 지도에서 선택하세요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: categoryKey,
        title: '카테고리',
        description: '일정의 유형을 선택하세요.\n숙소, 식당, 관광지 등으로 분류할 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.topRight,
      ),
      if (scrollController != null)
        CoachMarkBuilder.createTargetWithScroll(
          key: memberKey,
          title: '함께하는 크루원',
          description: '이 일정에 함께할 크루를 선택하세요.',
          scrollController: scrollController,
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        )
      else
        CoachMarkBuilder.createTarget(
          key: memberKey,
          title: '함께하는 크루원',
          description: '이 일정에 함께할 크루를 선택하세요.',
          align: ContentAlign.top,
          alignSkip: Alignment.topRight,
        ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeCreateSchedule(),
      onSkip: () => _storage.completeCreateSchedule(),
    );
  }
}
