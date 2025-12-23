import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 다이어리 화면 코치마크
@injectable
class DiaryCoachMark {
  final CoachMarkStorage _storage;

  DiaryCoachMark(this._storage);

  // 코치마크 표시 여부
  bool get shouldShow => _storage.shouldShowDiary();

  // 코치마크 표시
  void show(
    BuildContext context, {
    required GlobalKey sharedTabKey,
    required GlobalKey myTabKey,
    required GlobalKey filterKey,
    required GlobalKey listKey,
    required GlobalKey fabKey,
  }) {
    if (!shouldShow) return;

    final targets = <TargetFocus>[
      CoachMarkBuilder.createTarget(
        key: sharedTabKey,
        title: '공유 다이어리',
        description: '크루 전체가 작성한 다이어리를 확인하세요.\n함께 여행의 추억을 공유해요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: myTabKey,
        title: '내 다이어리',
        description: '내가 작성한 다이어리만 모아볼 수 있어요\n비공개한 비밀다이어리는 여기서 볼 수 있어요',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: filterKey,
        title: '카테고리 필터',
        description: '메모, 리뷰, 사진, 소비 등\n원하는 유형만 골라서 볼 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkBuilder.createTarget(
        key: listKey,
        title: '다이어리 목록',
        description: '다이어리를 탭하면 상세 내용을 볼 수 있어요.',
        align: ContentAlign.top,
        alignSkip: Alignment.topRight,
      ),
      CoachMarkBuilder.createTarget(
        key: fabKey,
        title: '다이어리 작성하기',
        description: '새로운 다이어리를 작성하세요.\n메모, 리뷰, 사진, 소비 내역을 남길 수 있어요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topRight,
      ),
    ];

    CoachMarkBuilder.show(
      context: context,
      targets: targets,
      onFinish: () => _storage.completeDiary(),
      onSkip: () => _storage.completeDiary(),
    );
  }
}
