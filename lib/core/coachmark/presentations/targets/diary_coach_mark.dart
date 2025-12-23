import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../models/coach_mark_model.dart';
import '../../storage/coach_mark_storage.dart';
import '../coach_mark_builder.dart';

// [이재은] 다이어리 화면 코치마크
@injectable
class DiaryCoachMark {
  final CoachMarkStorage _storage;

  DiaryCoachMark(this._storage);

  bool get shouldShow => _storage.shouldShowDiary();

  void show(
    BuildContext context, {
    required GlobalKey sharedTabKey,
    required GlobalKey myTabKey,
    required GlobalKey filterKey,
    required GlobalKey listKey,
    required GlobalKey fabKey,
  }) {
    if (!shouldShow) return;

    // title, description은 여기서 정의!
    final targets = [
      CoachMarkTarget(
        key: sharedTabKey,
        title: '공유 다이어리',
        description: '크루 전체가 작성한 다이어리를 확인하세요.\n함께 여행의 추억을 공유해요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: myTabKey,
        title: '내 다이어리',
        description: '내가 작성한 다이어리만 모아볼 수 있어요\n비공개한 비밀다이어리는 여기서 볼 수 있어요',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: filterKey,
        title: '카테고리 필터',
        description: '메모, 리뷰, 사진, 소비 등\n원하는 유형만 골라서 볼 수 있어요.',
        align: ContentAlign.bottom,
        alignSkip: Alignment.bottomLeft,
      ),
      CoachMarkTarget(
        key: listKey,
        title: '다이어리 목록',
        description: '다이어리를 탭하면 상세 내용을 볼 수 있어요.',
        align: ContentAlign.top,
      ),
      CoachMarkTarget(
        key: fabKey,
        title: '다이어리 작성하기',
        description: '새로운 다이어리를 작성하세요.\n메모, 리뷰, 사진, 소비 내역을 남길 수 있어요.',
        align: ContentAlign.top,
        shape: ShapeLightFocus.Circle,
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
