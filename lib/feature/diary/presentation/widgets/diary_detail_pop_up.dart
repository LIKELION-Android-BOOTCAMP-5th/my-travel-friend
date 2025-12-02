import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/profile_img.dart';

import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';

class DiaryDetailPopUp extends StatelessWidget {
  final int diaryId;

  const DiaryDetailPopUp({super.key, required this.diaryId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImg(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "닉네임",
                            style: AppFont.regular.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(child: Text("타입", style: AppFont.tiny)),
                          SizedBox(width: 8),
                          // 공개 비공개 사인 ? AppIcon.lock : AppIcon.unlock
                        ],
                      ),
                      Text(
                        "작성일자",
                        style: AppFont.small.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: AppIcon.close,
                    color: colorScheme.onSurface,
                    onPressed: () {},
                  ),
                ],
              ),
              Text("다이어리 제목"),
            ],
          ),
        ),
      ),
    );
  }
}
