import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

class EmptyScheduleCard extends StatelessWidget {
  final VoidCallback onAdd; // 일정 추가 버튼 클릭 콜백

  const EmptyScheduleCard({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 아이콘
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: IconTheme(
                  data: const IconThemeData(
                    color: AppColors.primaryLight,
                    size: 36,
                  ),
                  child: Icon(AppIcon.calendar), // 캘린더 아이콘
                ),
              ),

              const SizedBox(height: 14),

              // 제목
              Text(
                "일정이 없어요",
                style: AppFont.big.copyWith(color: AppColors.dark),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              // 서브 텍스트
              Text(
                "이 날짜에는 일정이 없어요",
                style: AppFont.regular.copyWith(
                  color: AppColors.dark.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // 일정 추가 버튼
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        "일정 추가하기",
                        style: AppFont.medium.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
