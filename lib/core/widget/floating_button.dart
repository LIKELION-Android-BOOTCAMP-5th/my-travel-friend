import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

// [이재은] 새 여행 계획 수립, 새 다이어리 작성, 위로 스크롤 등에 사용할 수 있는 플로팅 버튼
// -> 추후 테마에 따른 색상값 변경 필요할 수도 있음

class FloatingButton extends StatelessWidget {
  final IconData icon; // 버튼에 들어갈 아이콘
  final VoidCallback onPressed; // 눌렀을 때 액션
  final Color? backgroundColor; // 버튼 배경 색
  final Color? iconColor; // 아이콘 색상
  final double? iconSize; // 크기

  const FloatingButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: backgroundColor ?? AppColors.primaryLight,
      child: Icon(
        icon,
        color: iconColor ?? AppColors.light,
        size: iconSize ?? 30,
      ),
    );
  }
}
