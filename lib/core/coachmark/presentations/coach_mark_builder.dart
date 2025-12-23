import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_font.dart';
import '../models/coach_mark_model.dart';

// [이재은] 코치마크 빌더
class CoachMarkBuilder {
  const CoachMarkBuilder._();

  // 코치마크 표시
  static void show({
    required BuildContext context,
    required List<CoachMarkTarget> targets,
    required VoidCallback onFinish,
    VoidCallback? onSkip,
  }) {
    if (targets.isEmpty) return;

    final focusTargets = targets.map((t) => _createTargetFocus(t)).toList();

    TutorialCoachMark(
      targets: focusTargets,
      colorShadow: Colors.black,
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

  static TargetFocus _createTargetFocus(CoachMarkTarget target) {
    return TargetFocus(
      identify: target.key.toString(),
      keyTarget: target.key,
      alignSkip: target.alignSkip,
      shape: target.shape,
      radius: 8,
      paddingFocus: 8,
      contents: [
        TargetContent(
          align: target.align,
          builder: (context, controller) {
            if (target is CoachMarkTargetWithScroll) {
              _scrollToTarget(target.key, target.scrollController);
            }
            return _buildContent(
              title: target.title,
              description: target.description,
            );
          },
        ),
      ],
    );
  }

  static void _scrollToTarget(GlobalKey key, ScrollController controller) {
    if (!controller.hasClients) return;

    final keyContext = key.currentContext;
    if (keyContext == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = keyContext.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(keyContext).size.height;

      final targetScroll = controller.offset + position.dy - (screenHeight / 3);

      controller.animateTo(
        targetScroll.clamp(0, controller.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

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
