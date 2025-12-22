import 'package:flutter/material.dart';

// 온보딩 페이지 인디케이터 위젯

// 현재 페이지를 시각적으로 표시하는 도트 인디케이터
class OnboardingIndicator extends StatelessWidget {
  // 현재 페이지 인덱스
  final int currentPage;

  // 전체 페이지 수
  final int pageCount;

  // 활성 도트 색상
  final Color? activeColor;

  // 비활성 도트 색상
  final Color? inactiveColor;

  // 도트 클릭 콜백
  final ValueChanged<int>? onDotTap;

  const OnboardingIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    this.activeColor,
    this.inactiveColor,
    this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveActiveColor = activeColor ?? colorScheme.primary;
    final effectiveInactiveColor =
        inactiveColor ?? colorScheme.primary.withOpacity(0.3);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;

        return GestureDetector(
          onTap: onDotTap != null ? () => onDotTap!(index) : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 28 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: isActive ? effectiveActiveColor : effectiveInactiveColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }),
    );
  }
}
