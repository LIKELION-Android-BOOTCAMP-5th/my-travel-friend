import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/profile_img.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/star_rating.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/type_tag.dart';

import '../../../../core/util/time_ago.dart';
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
    final writer = diary.user;
    final writerName = writer?.nickname;
    final writtenTime = diary.createdAt;
    final rating = diary.rating;
    final cost = diary.cost;
    final content = diary.content;
    final title = diary.title;
    final photo = diary.img;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                            writerName ?? "알 수 없음",
                            style: AppFont.regular.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(width: 8),
                          TypeTag(diary: diary),
                          SizedBox(width: 8),
                          diary.isPublic
                              ? Icon(AppIcon.unlock)
                              : Icon(AppIcon.lock),
                        ],
                      ),
                      if (writtenTime != null)
                        Text(
                          TimeAgo.getTimeAgo(writtenTime),
                          style: AppFont.small.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
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
                Row(
                  children: [
                    Text(
                      "별점",
                      style: AppFont.small.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    StarRating(rating: rating.toDouble()),
                  ],
                ),
                const SizedBox(height: 8),
              ],

              // 내용 (null이 아닐 때만 표시)
              if (content != null) ...[
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppFont.regular.copyWith(color: colorScheme.onSurface),
                ),
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
                Row(
                  children: [
                    Text(
                      "비용",
                      style: AppFont.small.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${_formatCost(cost)}원",
                      style: AppFont.regular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // 비용 포맷팅 (1000 → 1,000)
  String _formatCost(int cost) {
    return cost.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
