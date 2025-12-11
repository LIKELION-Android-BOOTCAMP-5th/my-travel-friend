import 'package:flutter/material.dart';

import '../../theme/app_icon.dart';

// [이재은] 여행 홈용 하단 네비게이션 UI
// -> 추후 라우팅 필요

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        selectedIconTheme: IconThemeData(color: colorScheme.primary, size: 24),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurfaceVariant,
          size: 24,
        ),
        backgroundColor: colorScheme.surfaceContainerHighest,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(AppIcon.home), label: '여행 홈'),
          BottomNavigationBarItem(icon: Icon(AppIcon.calendar), label: '스케줄'),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.checklist),
            label: '체크리스트',
          ),
          BottomNavigationBarItem(icon: Icon(AppIcon.diary), label: '다이어리'),
          BottomNavigationBarItem(icon: Icon(AppIcon.talk), label: '톡톡'),
        ],
      ),
    );
  }
}
