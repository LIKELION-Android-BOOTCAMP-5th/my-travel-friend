import 'package:flutter/material.dart';

// [이재은] 새 여행 계획 수립, 새 다이어리 작성, 위로 스크롤 등에 사용할 수 있는 플로팅 버튼

class FloatingButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const FloatingButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: backgroundColor ?? colorScheme.primary,
      child: icon, // 그대로 사용
    );
  }
}
