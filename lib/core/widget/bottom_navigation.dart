import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';

import '../theme/app_icon.dart';

// [이재은] 여행 홈용 하단 네비게이션 UI
// -> 추후 라우팅 필요

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final int chatUnreadCount;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.chatUnreadCount = 0,
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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(AppIcon.home),
            label: '여행 홈',
          ),
          const BottomNavigationBarItem(
            icon: Icon(AppIcon.calendar),
            label: '스케줄',
          ),
          const BottomNavigationBarItem(
            icon: Icon(AppIcon.checklist),
            label: '체크리스트',
          ),
          const BottomNavigationBarItem(
            icon: Icon(AppIcon.diary),
            label: '다이어리',
          ),
          BottomNavigationBarItem(
            icon: _buildChatIcon(colorScheme),
            label: '톡톡',
          ),
        ],
      ),
    );
  }

  // 채팅 아이콘 + 배지
  Widget _buildChatIcon(ColorScheme colorScheme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(AppIcon.talk),
        if (chatUnreadCount > 0)
          Positioned(
            right: -6,
            top: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: colorScheme.error,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                chatUnreadCount > 99 ? '99+' : '$chatUnreadCount',
                style: AppFont.small.copyWith(
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
