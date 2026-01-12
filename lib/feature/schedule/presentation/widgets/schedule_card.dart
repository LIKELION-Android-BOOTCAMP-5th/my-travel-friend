import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';
import 'package:my_travel_friend/feature/schedule/presentation/widgets/schedule_category_tag.dart';

import '../../../../core/widget/profile_img.dart';

class ScheduleCard extends StatefulWidget {
  final String title;
  final String dateTime;
  final String place;
  final String tagName;
  final List<String> profileImages; // 유저 프로필 이미지 URL 리스트
  final String? memo; // 메모 (옵셔널)

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ScheduleCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.place,
    required this.tagName,
    required this.profileImages,
    required this.onEdit,
    required this.onDelete,
    this.memo,
  });

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool showMemo = false;

  @override
  Widget build(BuildContext context) {
    final hasMemo = widget.memo != null && widget.memo!.trim().isNotEmpty;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 태그 + 수정/삭제 버튼
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 왼쪽: 태그 + 제목
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 태그
                    ScheduleCategoryTag(tagName: widget.tagName),

                    const SizedBox(width: 8),

                    // 제목
                    Expanded(
                      child: Text(
                        widget.title,
                        style: AppFont.medium.copyWith(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // 오른쪽: 아이콘 (절대 안 밀림)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(AppIcon.edit, size: 15),
                    onPressed: widget.onEdit,
                  ),
                  IconButton(
                    icon: const Icon(
                      AppIcon.delete,
                      size: 15,
                      color: AppColors.secondary,
                    ),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          // 날짜/시간
          Row(
            children: [
              const Icon(AppIcon.calendar, size: 13),
              const SizedBox(width: 8),
              Text(widget.dateTime),
            ],
          ),

          const SizedBox(height: 6),

          // 장소
          if (widget.place.isNotEmpty)
            Row(
              children: [
                const Icon(AppIcon.mapPin, size: 13),
                const SizedBox(width: 8),
                Text(
                  widget.place!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

          const SizedBox(height: 12),

          // ----- 메모 토글 버튼 -----
          if (hasMemo)
            GestureDetector(
              onTap: () => setState(() => showMemo = !showMemo),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      showMemo ? "메모 숨기기" : "메모 보기",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(
                      showMemo ? AppIcon.closeUp : AppIcon.openDown,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),

          // 메모 내용
          if (showMemo && hasMemo) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.memo!,
                style: AppFont.regular.copyWith(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          // 참여자 프로필
          Row(
            children: widget.profileImages.map((img) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ProfileImg(imageUrl: img, radius: 20),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

String formatScheduleDateTime(String isoString) {
  final dt = DateTime.parse(isoString).toLocal();
  return DateFormat('yyyy-MM-dd / HH:mm').format(dt);
}
