import 'package:flutter/material.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/cost_tag.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/profile_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/star_rating.dart';

import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';
import '../../domain/entities/diary_entity.dart';
import 'image_with_actions.dart';

// [이재은] 다이어리 상세보기 팝업 위젯
class DiaryDetailPopUp extends StatelessWidget {
  final DiaryEntity diary;

  const DiaryDetailPopUp({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final rating = diary.rating;
    final cost = diary.cost;
    final content = diary.content;
    final title = diary.title;
    final photo = diary.img;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: ProfileBox(diary: diary)),
                  IconButton(
                    icon: Icon(AppIcon.close),
                    color: colorScheme.onSurface,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 제목 (null이 아닐 때만 표시)
              if (title != null) ...[
                Text(
                  title,
                  style: AppFont.regularBold.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // 별점 (null이 아닐 때만 표시)
              if (rating != null) ...[
                StarRating(
                  rating: rating.toDouble(),
                  starSize: 20,
                  starSpacing: 5,
                ),
                const SizedBox(height: 8),
              ],

              // 내용 (null이 아닐 때만 표시)
              if (content != null) ...[
                Text(
                  content,
                  style: AppFont.regular.copyWith(color: colorScheme.onSurface),
                ),
                SizedBox(height: 8),
              ],

              // 사진 (null이 아닐 때만 표시)
              if (photo != null) ...[
                ImageWithActions(
                  imageUrl: photo, // 이미지 URL
                  heroTag: 'diary_image_${diary.id}', // 애니메이션 태그
                  height: 200, // 높이
                  borderRadius: BorderRadius.circular(12), // 모서리 둥글기
                ),
                const SizedBox(height: 12),
              ],

              // 비용 (null이 아닐 때만 표시)
              if (cost != null) ...[
                CostTag(cost: cost),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
