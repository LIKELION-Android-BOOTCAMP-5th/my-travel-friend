import 'package:flutter/material.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/type_tag.dart';

import '../../../../core/util/time_ago.dart';
import '../../../../core/widget/profile_img.dart';
import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';
import '../../domain/entities/diary_entity.dart';

// [이재은] 다이어리 프로필 정보 모음
class ProfileBox extends StatelessWidget {
  final DiaryEntity diary;

  const ProfileBox({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final writer = diary.user;
    final writerName = writer?.nickname;
    final writtenTime = diary.createdAt;

    return Row(
      children: [
        ProfileImg(imageUrl: writer?.profileImg!),
        SizedBox(width: 8.0),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  writerName ?? "알 수 없음",
                  style: AppFont.regular.copyWith(color: colorScheme.onSurface),
                ),
                SizedBox(width: 8),
                TypeTag(diary: diary),
                SizedBox(width: 8),
                diary.isPublic ? Icon(AppIcon.unlock) : Icon(AppIcon.lock),
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
      ],
    );
  }
}
