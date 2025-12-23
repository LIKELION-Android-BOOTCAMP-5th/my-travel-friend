import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_font.dart';

// [이재은] 코치마크 빌더
// - 타겟 생성 및 코치마크 표시 담당
class CoachMarkBuilder {
  const CoachMarkBuilder._();

  // 코치마크 표시
  static void show({
    required BuildContext context,
    required List<TargetFocus> targets,
    required VoidCallback onFinish,
    VoidCallback? onSkip,
    Color? colorShadow,
  }) {
    if (targets.isEmpty) return;

    TutorialCoachMark(
      targets: targets,
      colorShadow: colorShadow ?? Colors.black,
      opacityShadow: 0.8,
      textSkip: '건너뛰기',
      textStyleSkip: AppFont.regular.copyWith(color: AppColors.light),
      paddingFocus: 10,
      focusAnimationDuration: const Duration(milliseconds: 300),
      pulseAnimationDuration: const Duration(milliseconds: 500),
      onFinish: onFinish,
      onSkip: () {
        onSkip?.call();
        return true;
      },
    ).show(context: context, rootOverlay: true);
  }

  // 단일 타겟 생성
  static TargetFocus createTarget({
    required GlobalKey key,
    required String title,
    required String description,
    ContentAlign align = ContentAlign.bottom,
    ShapeLightFocus shape = ShapeLightFocus.RRect,
    double radius = 8,
    double paddingFocus = 8,
    Alignment alignSkip = Alignment.topRight,
  }) {
    return TargetFocus(
      identify: key.toString(),
      keyTarget: key,
      alignSkip: alignSkip,
      shape: shape,
      radius: radius,
      paddingFocus: paddingFocus,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            return _buildContent(title: title, description: description);
          },
        ),
      ],
    );
  }

  // 스크롤이 필요한 타겟 생성
  static TargetFocus createTargetWithScroll({
    required GlobalKey key,
    required String title,
    required String description,
    required ScrollController scrollController,
    ContentAlign align = ContentAlign.bottom,
    ShapeLightFocus shape = ShapeLightFocus.RRect,
    double radius = 8,
    double paddingFocus = 8,
    Alignment alignSkip = Alignment.topRight,
  }) {
    return TargetFocus(
      identify: key.toString(),
      keyTarget: key,
      alignSkip: alignSkip,
      shape: shape,
      radius: radius,
      paddingFocus: paddingFocus,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            _scrollToTarget(key, scrollController);
            return _buildContent(title: title, description: description);
          },
        ),
      ],
    );
  }

  // 타겟 위치로 스크롤
  static void _scrollToTarget(
    GlobalKey key,
    ScrollController scrollController,
  ) {
    if (!scrollController.hasClients) return;

    final keyContext = key.currentContext;
    if (keyContext == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = keyContext.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(keyContext).size.height;

      final targetScroll =
          scrollController.offset + position.dy - (screenHeight / 3);

      scrollController.animateTo(
        targetScroll.clamp(0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // 코치마크 컨텐츠
  static Widget _buildContent({
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFont.medium.copyWith(color: AppColors.light)),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppFont.regular.copyWith(color: AppColors.light),
          ),
        ],
      ),
    );
  }
}
