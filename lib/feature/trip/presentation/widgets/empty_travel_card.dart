import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../theme/app_icon.dart';

class EmptyTravelCard extends StatelessWidget {
  final String title;
  final String description;

  const EmptyTravelCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 아이콘 영역
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: IconTheme(
              data: const IconThemeData(
                color: AppColors.primaryLight,
                size: 30,
              ),
              child: Icon(AppIcon.mapPin), // 그대로 넣기!
            ),
          ),
          const SizedBox(height: 12),

          /// 제목
          Text(
            title,
            style: AppFont.huge.copyWith(color: AppColors.dark),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          /// 설명
          Text(
            description,
            style: AppFont.regular.copyWith(
              color: AppColors.dark.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
