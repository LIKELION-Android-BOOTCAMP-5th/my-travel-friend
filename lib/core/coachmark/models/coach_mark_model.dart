import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// [이재은] 코치마크 타겟 모델
class CoachMarkTarget {
  final GlobalKey key;
  final String title;
  final String description;
  final ContentAlign align;
  final ShapeLightFocus shape;
  final Alignment alignSkip;

  const CoachMarkTarget({
    required this.key,
    required this.title,
    required this.description,
    this.align = ContentAlign.bottom,
    this.shape = ShapeLightFocus.RRect,
    this.alignSkip = Alignment.topRight,
  });
}

// 스크롤이 필요한 코치마크 타겟
class CoachMarkTargetWithScroll extends CoachMarkTarget {
  final ScrollController scrollController;

  const CoachMarkTargetWithScroll({
    required super.key,
    required super.title,
    required super.description,
    required this.scrollController,
    super.align,
    super.shape,
    super.alignSkip,
  });
}
