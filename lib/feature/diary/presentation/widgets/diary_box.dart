import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/cost_tag.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/profile_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/star_rating.dart';

import '../../../../core/widget/bottom_sheat.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';
import '../../domain/entities/diary_entity.dart';
import '../viewmodels/diary/diary_bloc.dart';
import '../viewmodels/diary/diary_event.dart';
import 'image_with_actions.dart';

// [이재은] 다이어리 리스트용 박스 위젯
class DiaryBox extends StatelessWidget {
  final DiaryEntity diary;
  final int loginUserId;

  const DiaryBox({super.key, required this.diary, required this.loginUserId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final isMine = diary.userId == loginUserId;

    final rating = diary.rating;
    final cost = diary.cost;
    final content = diary.content;
    final title = diary.title;
    final photo = diary.img;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          width: MediaQuery.of(context).size.width * 0.85,
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
                    Expanded(child: ProfileBox(diary: diary)),
                    if (isMine)
                      IconButton(
                        onPressed: () => _showEditOrDeleteSheet(context),
                        icon: Icon(
                          AppIcon.threeDots,
                          size: 20,
                          color: colorScheme.onSurface,
                        ),
                        padding: EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // 제목 (null이 아닐 때만 표시)
                if (title != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: AppFont.regular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],

                // 내용 (null이 아닐 때만 표시)
                if (content != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content,
                      style: AppFont.small.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],

                // 별점 (null이 아닐 때만 표시)
                if (rating != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: StarRating(rating: rating.toDouble()),
                  ),
                  const SizedBox(height: 8),
                ],

                // 사진 (null이 아닐 때만 표시)
                if (photo != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ImageWithActions(
                      imageUrl: photo, // 이미지 URL
                      heroTag: 'diary_image_${diary.id}', // 애니메이션 태그
                      height: 100,
                      width: 100,
                      borderRadius: BorderRadius.circular(8), // 모서리 둥글기
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // 비용 (null이 아닐 때만 표시)
                if (cost != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CostTag(cost: cost),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 수정 삭제 바텀시트
  void _showEditOrDeleteSheet(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final diaryBloc = context.read<DiaryBloc>();

    CommonBottomSheet.show(
      context,
      sheetTitle: '다이어리 편집',
      actions: [
        BottomSheetAction(
          icon: const Icon(AppIcon.edit),
          iconBgColor: colorScheme.primary,
          title: '고치기',
          onTap: () {
            context.read<DiaryBloc>().add(DiaryEvent.requestEdit(diary: diary));
          },
        ),
        BottomSheetAction(
          icon: const Icon(AppIcon.delete),
          iconBgColor: colorScheme.secondary,
          title: '지우기',
          onTap: () {
            _showDeletePopUp(context, diaryBloc);
          },
        ),
      ],
    );
  }

  // 삭제 확인 팝업
  void _showDeletePopUp(BuildContext context, DiaryBloc diaryBloc) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (_) => PopUpBox(
        title: '삭제하시겠습니까?',
        message: '삭제된 다이어리는 복구할 수 없습니다.',
        icon: AppIcon.delete,
        iconColor: colorScheme.secondary,
        leftText: '취소',
        rightText: '삭제',
        rightButtonColor: colorScheme.secondary,
        rightTextColor: colorScheme.onSecondary,
        onRight: () {
          diaryBloc.add(DiaryEvent.deleteDiary(diaryId: diary.id!));
        },
      ),
    );
  }
}
